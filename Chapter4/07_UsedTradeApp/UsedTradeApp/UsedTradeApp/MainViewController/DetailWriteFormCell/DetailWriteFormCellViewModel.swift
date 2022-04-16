//
//  DetailWriteFormCellViewModel.swift
//  UsedTradeApp
//
//  Created by 박진우 on 2022/04/16.
//

import RxSwift
import RxCocoa

struct DetailWriteFormCellViewModel {
    // View -> ViewModel
    let contentValue = PublishRelay<String?>()
}
