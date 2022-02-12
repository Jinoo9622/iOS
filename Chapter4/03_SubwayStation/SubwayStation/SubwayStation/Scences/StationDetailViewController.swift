//
//  StationDetailViewController.swift
//  SubwayStation
//
//  Created by 박진우 on 2022/02/07.
//

import UIKit
import SnapKit
import Alamofire

class StationDetailViewController: UIViewController {
    
    private let station: Station
    
    private var realtimeArrivalList: [StationArrivalDataResponseModel.RealTimeArrival] = []
    
    private lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(fetchData), for: .valueChanged)
        return refreshControl
    }()
    
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = CGSize(width: view.frame.width - 32.0, height: 100.0)
        layout.sectionInset = UIEdgeInsets(top: 16.0, left: 16.0, bottom: 16.0, right: 16.0)
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground
        collectionView.register(StationDetailCollectionViewCell.self, forCellWithReuseIdentifier: "StationDetailCollectionViewCell")
        collectionView.dataSource = self
        
        collectionView.refreshControl = refreshControl
        
        return collectionView
    }()
    
    init(station: Station) {
        self.station = station
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = station.stationName
        
        self.view.addSubview(collectionView)
        collectionView.snp.makeConstraints { $0.edges.equalToSuperview() }
        
        fetchData()
    }
    
    @objc private func fetchData() {
//        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(1)) {
//            self.refreshControl.endRefreshing()
//        }
        // 지하철역 정보 검색 API는 ~역으로 데이터를 받으나, 지하철 실시간 도착정보 API는 역을 뺀 값으로 API 호출..(ex. 서울역 -> 서울, 강남역 -> 강남)
        let stationName = station.stationName.replacingOccurrences(of: "역", with: "")
        
        let urlString = "http://swopenapi.seoul.go.kr/api/subway/sample/json/realtimeStationArrival/0/5/\(stationName)"
        AF.request(urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "").responseDecodable(of: StationArrivalDataResponseModel.self) { [weak self] response in
            // request의 성공, 실패 여부에 상관없이 refreshControl을 멈추어야하기에 closure 상단에서 실행
            self?.refreshControl.endRefreshing() // refreshControl이 실행중이지 않을 경우, 실행되지않음
            
            guard case .success(let data) = response.result else { return }
            
            self?.realtimeArrivalList = data.realtimeArrivalList
            DispatchQueue.main.async {  //
                self?.collectionView.reloadData()
            }
        }.resume()
    }
}

extension StationDetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return realtimeArrivalList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StationDetailCollectionViewCell", for: indexPath) as? StationDetailCollectionViewCell else { return UICollectionViewCell() }
        let realTimeArrival = realtimeArrivalList[indexPath.row]
        cell.setup(with: realTimeArrival)
        
        return cell
    }
}

/**
 * - 도착정보 표시 구현 시
 *   1. Request Method를 호출하는 적절한 타이밍 구현
 *   2. 가져온 데이터가 화면에 표시되도록 구현
 */
