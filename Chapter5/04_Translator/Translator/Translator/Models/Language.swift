//
//  Language.swift
//  Translator
//
//  Created by 박진우 on 2022/06/19.
//

import Foundation

enum Language: String, CaseIterable, Codable {  // enum에서 Codable 사용 시, String값을 raw value로 사용하도록 수정!
    case ko
    case en
    case ja
    case ch = "zn-CN"

    var title: String {
        switch self {
        case .ko: return NSLocalizedString("Korean", comment: "한국어")
        case .en: return NSLocalizedString("English", comment: "영어")
        case .ja: return NSLocalizedString("Japanese", comment: "일본어")
        case .ch: return NSLocalizedString("Chinese", comment: "중국어")
        }
    }
    
    var languageCode: String {
        return self.rawValue
    }
}
