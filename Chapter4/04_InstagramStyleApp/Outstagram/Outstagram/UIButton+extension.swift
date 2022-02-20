//
//  UIButton+extension.swift
//  Outstagram
//
//  Created by 박진우 on 2022/02/13.
//

import UIKit

extension UIButton {
    // Helper Method, SF Symbol의 이미지를 가져오는 경우, image size를 맞추지 못하는 경우가 발생
    // -> image resizing
    func setImage(systemName: String) {
        contentHorizontalAlignment = .fill
        contentVerticalAlignment = .fill
        
        imageView?.contentMode = .scaleAspectFit
        imageEdgeInsets = .zero
        
        setImage(UIImage(systemName: systemName), for: .normal)
    }
}
