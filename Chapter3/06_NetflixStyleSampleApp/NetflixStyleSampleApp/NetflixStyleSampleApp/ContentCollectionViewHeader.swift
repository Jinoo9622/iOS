//
//  ContentCollectionViewHeader.swift
//  NetflixStyleSampleApp
//
//  Created by 박진우 on 2021/12/28.
//

import UIKit

// Header or Footer는 반드시 UICollectionReusableView로 선언
class ContentCollectionViewHeader: UICollectionReusableView {
    
    let sectionNameLabel = UILabel()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        sectionNameLabel.font = .systemFont(ofSize: 17, weight: .bold)
        sectionNameLabel.textColor = .white
        sectionNameLabel.sizeToFit()
        
        addSubview(sectionNameLabel)
        
        sectionNameLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.top.bottom.leading.equalToSuperview().offset(10)
        }
    }
}
