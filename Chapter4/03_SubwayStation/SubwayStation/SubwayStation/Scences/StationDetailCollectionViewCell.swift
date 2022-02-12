//
//  StationDetailCollectionViewCell.swift
//  SubwayStation
//
//  Created by 박진우 on 2022/02/07.
//

import UIKit
import SnapKit

class StationDetailCollectionViewCell: UICollectionViewCell {
    
    private lazy var lineLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15.0, weight: .bold)
        
        return label
    }()
    
    private lazy var remainTimeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15.0, weight: .medium)
        
        return label
    }()
    
    func setup(with realTimeArrival: StationArrivalDataResponseModel.RealTimeArrival) {
        self.layer.cornerRadius = 12.0
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.2
        self.layer.shadowRadius = 10.0
        
        // layer의 기준값이 없기에 backgroudColor 설정 필요
        self.backgroundColor = .systemBackground
        
        [lineLabel, remainTimeLabel].forEach { self.addSubview($0) }
        
        lineLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16.0)
            $0.top.equalToSuperview().inset(16.0)
        }
        
        remainTimeLabel.snp.makeConstraints {
            $0.leading.equalTo(lineLabel.snp.leading)
            $0.top.equalTo(lineLabel.snp.bottom).offset(16.0)
            $0.bottom.equalToSuperview().inset(16.0)
        }
        
        lineLabel.text = realTimeArrival.line
        remainTimeLabel.text = realTimeArrival.remainTime
    }
}
