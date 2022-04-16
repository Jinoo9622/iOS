//
//  FilterViewModel.swift
//  SearchDaumBlog
//
//  Created by 박진우 on 2022/04/12.
//

import RxSwift
import RxCocoa

struct FilterViewModel {
    // FilterView에서 방출하는 Event
    let sortButtonTapped = PublishRelay<Void>()
}
