//
//  ProfileCollectionViewCell.swift
//  Outstagram
//
//  Created by 박진우 on 2022/02/16.
//

import UIKit
import SnapKit

class ProfileCollectionViewCell: UICollectionViewCell {
    
    private let imageView = UIImageView()
    
    func setup(with image: UIImage) {
        self.addSubview(imageView)
        imageView.snp.makeConstraints { $0.edges.equalToSuperview() }
        
        imageView.image = image
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
    }
}
