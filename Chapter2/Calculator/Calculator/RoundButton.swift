//
//  RoundButton.swift
//  Calculator
//
//  Created by 박진우 on 2021/09/28.
//

import UIKit

// @IBDesignable annotation 선언 시, StoryBoard에서 실시간으로 UI변경 확인 가능 (StoryBoard 로드 할때마다 빌드 - 남용X)
@IBDesignable
class RoundButton: UIButton {
    // @IBDesignable annotation 선언 시, 해당 속성을 StoryBoard에서 확인 가능
    @IBInspectable var isRound: Bool = false {
        didSet {
            if isRound {
                self.layer.cornerRadius = self.frame.height / 2
            }
        }
    }
}
