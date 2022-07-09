//
//  Bookmark.swift
//  Translator
//
//  Created by 박진우 on 2022/07/03.
//

import Foundation

struct Bookmark: Codable {
    let sourceLanguage: Language
    let translatedLanguage: Language
    
    let sourceText: String
    let translatedText: String
}

