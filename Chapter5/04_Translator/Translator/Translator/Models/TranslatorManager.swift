//
//  TranslatorManager.swift
//  Translator
//
//  Created by 박진우 on 2022/07/09.
//

import Alamofire    // AFNetworking, URLSession
import Foundation
import CloudKit

struct TranslatorManager {
    var sourceLanguage: Language = .ko
    var targetLanguage: Language = .en
    
    func translate(from text: String, completionHandler: @escaping (String) -> Void) {
        guard let url = URL(string: "https://openapi.naver.com/v1/papago/n2mt") else { return }
        
        let requestModel = TranslateRequestModel(
            source: sourceLanguage.languageCode,
            target: targetLanguage.languageCode,
            text: text
        )
        
        let headers: HTTPHeaders = [
            "X-Naver-Client-Id": Bundle.main.object(forInfoDictionaryKey: "X-Naver-Client-Id") as! String,
            "X-Naver-Client-Secret": Bundle.main.object(forInfoDictionaryKey: "X-Naver-Client-Secret") as! String
        ]
        
        AF.request(url, method: .post, parameters: requestModel, headers: headers)
            .responseDecodable(of: TranslateResponseModel.self) { response in
                switch response.result {
                case .success(let result):
                    completionHandler(result.translatedText)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            .resume()
    }
}
