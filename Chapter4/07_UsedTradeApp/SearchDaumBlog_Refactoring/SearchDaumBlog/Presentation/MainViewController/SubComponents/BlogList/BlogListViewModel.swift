//
//  BlogListViewModel.swift
//  SearchDaumBlog
//
//  Created by 박진우 on 2022/04/12.
//

import RxSwift
import RxCocoa

struct BlogListViewModel {
    let filterViewModel = FilterViewModel()
    
    // MainViewController -> BlogListView
    let blogCellData = PublishSubject<[BlogListCellData]>()
    let cellData: Driver<[BlogListCellData]>
    
    init() {
        self.cellData = blogCellData
            .asDriver(onErrorJustReturn: [])
    }
}
