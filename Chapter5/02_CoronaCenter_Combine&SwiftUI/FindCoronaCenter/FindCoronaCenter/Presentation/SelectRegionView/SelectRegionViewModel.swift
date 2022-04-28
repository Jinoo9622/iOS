//
//  SelectRegionViewModel.swift
//  FindCoronaCenter
//
//  Created by 박진우 on 2022/04/28.
//

import Foundation
import Combine

class SelectRegionViewModel: ObservableObject {
    @Published var centers = [Center.Sido: [Center]]()
    private var cancellables = Set<AnyCancellable>()    // RxSwift의 DisposeBag 역할
    
    init(centerNetwork: CenterNetwork = CenterNetwork()) {
        centerNetwork.getCenterList()
            .receive(on: DispatchQueue.main)
            .sink(  // RxSwift의 subscribe
                receiveCompletion: { [weak self] in
                    guard case .failure(let error) = $0 else { return }
                    print(error.localizedDescription)
                    self?.centers  = [Center.Sido: [Center]]()
                },
                receiveValue: { [weak self] centers in
                    self?.centers = Dictionary(grouping: centers) { $0.sido }
                }
            )
            .store(in: &cancellables)       // disposed(by: disposeBag)
    }
}
