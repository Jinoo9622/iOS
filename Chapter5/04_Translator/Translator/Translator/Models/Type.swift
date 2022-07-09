//
//  Type.swift
//  Translator
//
//  Created by 박진우 on 2022/07/03.
//

import UIKit

enum `Type` {
    case source
    case target

    var color: UIColor {
        switch self {
        case .source: return .label
        case .target: return .mainTintColor
        }
    }
}
