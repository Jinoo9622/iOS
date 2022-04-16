//
//  PriceTextFieldCellViewModel.swift
//  UsedTradeApp
//
//  Created by 박진우 on 2022/04/16.
//

import RxSwift
import RxCocoa

struct PriceTextFieldCellViewModel {
    // ViewModel -> View
    let showFreeShareButton: Signal<Bool>
    let resetPrice: Signal<Void>
    
    // View -> ViewModel
    let priceValue = PublishRelay<String?>()
    let freeShareButtonTapped = PublishRelay<Void>()
    
    init() {
        // priceValue가 0이라고 입력된 경우 보이기,
        // freeShareButton이 눌렸을 경우 숨기기
        self.showFreeShareButton = Observable
            .merge(
                priceValue.map { $0 ?? "" == "0" },
                freeShareButtonTapped.map { _ in false }
            )
            .asSignal(onErrorJustReturn: false)
        
        self.resetPrice = freeShareButtonTapped
            .asSignal(onErrorSignalWith: .empty())
    }
}
