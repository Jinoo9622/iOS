//
//  SearchBarViewModel.swift
//  SearchDaumBlog
//
//  Created by 박진우 on 2022/04/12.
//

import RxSwift
import RxCocoa

struct SearchBarViewModel {
    let queryText = PublishRelay<String?>()
    // SearchBar에서 방출하는 Event
    let searchButtonTapped = PublishRelay<Void>()
    let shouldLoadResult: Observable<String>
    
    init() {
        // View 바깥에서 View의 로직을 가져가기에 View가 알 필요가 없음
        self.shouldLoadResult = searchButtonTapped
            .withLatestFrom(queryText) { $1 ?? "" }  // 가장 최근의 값만 방출
            .filter { !$0.isEmpty }
            .distinctUntilChanged()
    }
}
