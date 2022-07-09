//
//  TranslateResponseModel.swift
//  Translator
//
//  Created by 박진우 on 2022/07/09.
//

import Foundation

struct TranslateResponseModel: Decodable {
    private let message: Message
    
    var translatedText: String { message.result.translatedText }
    
    struct Message: Decodable {
        let result: Result
    }
    
    struct Result: Decodable {
        let translatedText: String
    }
}
