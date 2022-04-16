//
//  MainViewModel.swift
//  SearchDaumBlog
//
//  Created by 박진우 on 2022/04/12.
//

import UIKit
import RxSwift
import RxCocoa

struct MainViewModel {
    let disposeBag = DisposeBag()
    
    let blogListViewModel = BlogListViewModel()
    let searchBarViewModel = SearchBarViewModel()
    
    let alertActionTapped = PublishRelay<MainViewController.AlertAction>()
    let shouldPresentAlert: Signal<MainViewController.Alert>
    
    init(model: MainModel = MainModel()) {
        // ViewModel끼리 Network 로직을 처리
        let blogResult = searchBarViewModel.shouldLoadResult
            .flatMapLatest(model.searchBlog)    // operator의 parameter와 method의 parameter가 동일한 경우 축약가능
            .share()    // stream 공유
            
        let blogValue = blogResult
            .compactMap(model.getBlogValue)
        
        let blogError = blogResult
            .compactMap { data -> String? in
                guard case .failure(let error) = data else {
                    return nil
                }
                return error.localizedDescription
            }
        // 네트워크를 통해 가져온 값을 cellData로 변환
        let cellData = blogValue
            .map { blog -> [BlogListCellData] in
                return blog.documents
                    .map { doc in
                        let thumbnailURL = URL(string: doc.thumbnail ?? "")
                        return BlogListCellData(
                            thumbnailURL: thumbnailURL,
                            name: doc.name,
                            title: doc.title?.removeHTMLTag(),
                            datetime: doc.datetime
                        )
                    }
            }
        // FilterView를 선택핼을 때 나오는 alertsheet를 선택했을 때 type
        let sortedType = alertActionTapped
            .filter {
                switch $0 {
                case .title, .datetime:
                    return true
                default:
                    return false
                }
            }
            .startWith(.title)
        // MainViewController -> ListView data send (가장 최신의 타입(filter or searchdata)에 따라 정렬)
        //   -> 신규 검색 | filter 변경
        Observable
            .combineLatest(
                sortedType,
                cellData
            ) { type, data -> [BlogListCellData] in
                switch type {
                case .title:    // title 오름차순
                    return data.sorted { $0.title ?? "" < $1.title ?? "" }
                case .datetime: // datetime 내림차순 (최신순)
                    return data.sorted { $0.datetime ?? Date() > $1.datetime ?? Date() }
                default:
                    return data
                }
            }
            .bind(to: blogListViewModel.blogCellData)
            .disposed(by: disposeBag)
        
        let alertSheetForSorting = blogListViewModel.filterViewModel.sortButtonTapped
            .map { _ -> MainViewController.Alert in
                return (title: nil, message: nil, actions: [.title, .datetime, .cancel], style: .actionSheet)
            }
        
        let alertForErrorMessage = blogError
            .map { message -> MainViewController.Alert in
                return (
                    title: "앗!",
                    message: "예상치 못한 오류가 발생했습니다.\n 잠시 후 다시 시도해주세요.\n \(message)",
                    actions: [.confirm],
                    style: .alert
                )
            }
        
        self.shouldPresentAlert = Observable
            .merge(
                alertSheetForSorting,
                alertForErrorMessage
            )
            .asSignal(onErrorSignalWith: .empty())
    }
}
