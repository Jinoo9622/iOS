//
//  TranslateRequestModel.swift
//  Translator
//
//  Created by 박진우 on 2022/07/09.
//

import Foundation

struct TranslateRequestModel: Codable {
    let source: String
    let target: String
    let text: String
}
