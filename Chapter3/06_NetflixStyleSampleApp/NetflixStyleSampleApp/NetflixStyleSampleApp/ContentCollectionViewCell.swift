//
//   ContentCollectionViewCell.swift
//  NetflixStyleSampleApp
//
//  Created by 박진우 on 2021/12/28.
//

import UIKit
import SnapKit

class ContentCollectionViewCell: UICollectionViewCell {
   
    let imageView = UIImageView()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // Cell의 실제 content 표시 : contentView
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 5
        contentView.clipsToBounds = true
        
        imageView.contentMode = .scaleAspectFill
        
        contentView.addSubview(imageView)
        
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
