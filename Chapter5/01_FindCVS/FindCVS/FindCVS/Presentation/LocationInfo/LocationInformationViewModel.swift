//
//  LocationInformationViewModel.swift
//  FindCVS
//
//  Created by 박진우 on 2022/04/17.
//

import RxSwift
import RxCocoa

struct LocationInformationViewModel {
    let disposeBag = DisposeBag()
    
    // subViewModels
    let detailListBackgroudViewModel = DetailListBackgroundViewModel()
    
    // viewModel -> view
    let setMapCenter: Signal<MTMapPoint>
    let errorMessage: Signal<String>
    let detailListCellData: Driver<[DetailListCellData]>
    let scrollToSelectedLocation: Signal<Int>
    
    // view -> viewModel
    let currentLocation = PublishRelay<MTMapPoint>()
    let mapCenterPoint = PublishRelay<MTMapPoint>()
    let selectPOIItem = PublishRelay<MTMapPOIItem>()
    let mapViewError = PublishRelay<String>()
    let currentLocationButtonTapped = PublishRelay<Void>()
    let detailListItemSelected = PublishRelay<Int>()
    
    private let documentData = PublishSubject<[KLDocument]>()
    
    init(model: LocationInformationModel = LocationInformationModel()) {
        // MARK: 네트워크 통신으로 데이터 불러오기
        let cvsLocationDataResult = mapCenterPoint
            .flatMapLatest(model.getLocation)
            .share()
        
        let cvsLocationDataValue = cvsLocationDataResult
            .compactMap { data -> LocationData? in
                guard case let .success(value) = data else {
                    return nil
                }
                return value
            }
        
        let cvsLocationDataErrorMessage = cvsLocationDataResult
            .compactMap { data -> String? in
                switch data {
                case let .success(data) where data.documents.isEmpty:
                    return """
                    500m 근처에 이용할 수 있는 편의점이 없습니다.
                    지도 위치를 옮겨서 재검색해주세요.
                    """
                case let .failure(error):
                    return error.localizedDescription
                default:    // .success(data) where !data.documents.isEmpty -> error message를 return할 필요 X
                    return nil
                }
            }
        
        cvsLocationDataValue
            .map { $0.documents }
            .bind(to: documentData)
            .disposed(by: disposeBag)
        
        // MARK: 지도 중심점 설정
        let selectDetailListItem = detailListItemSelected
            .withLatestFrom(documentData) { $1[$0] }
            .map { data -> MTMapPoint in
                guard let longtitue = Double(data.x),
                      let latitud = Double(data.y) else {
                    return MTMapPoint()
                }
                
                let geoCoord = MTMapPointGeo(latitude: latitud, longitude: longtitue)
                return MTMapPoint(geoCoord: geoCoord)
            }
        
        let moveToCurrentLocation = currentLocationButtonTapped
            .withLatestFrom(currentLocation)
        
        let currentMapCenter = Observable
            .merge(
                selectDetailListItem,   // list에서 선택한 값
                currentLocation.take(1),// 현재값을 받아온 최초값
                moveToCurrentLocation   // 버튼을 눌러 현재위치로 이동
            )
        
        setMapCenter = currentMapCenter
            .asSignal(onErrorSignalWith: .empty())
        
        errorMessage = Observable
            .merge(
                cvsLocationDataErrorMessage,
                mapViewError.asObservable()
            )
            .asSignal(onErrorJustReturn: "잠시 후 다시 시도해주세요.")
        
        detailListCellData = documentData
            .map(model.documentsToCellData)
            .asDriver(onErrorDriveWith: .empty())
        
        documentData
            .map { !$0.isEmpty }
            .bind(to: detailListBackgroudViewModel.shouldHideStatusLabel)
            .disposed(by: disposeBag)
        
        scrollToSelectedLocation = selectPOIItem
            .map { $0.tag }
            .asSignal(onErrorJustReturn: 0)
    }
}
