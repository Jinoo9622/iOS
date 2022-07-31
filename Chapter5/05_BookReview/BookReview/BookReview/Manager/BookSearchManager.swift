//
//  BookSearchManager.swift
//  BookReview
//
//  Created by 박진우 on 2022/07/11.
//

import Alamofire
import Foundation

struct BookSearchManager {
    func request(from keyword: String, completionHandler: @escaping (([Book]) -> Void)) {
        guard let url = URL(string: "https://openapi.naver.com/v1/search/book.json") else { return }
        
        let parameters = BookSearchRequestModel(query: keyword)
        let headers: HTTPHeaders = [
            "X-Naver-Client-Id": Bundle.main.object(forInfoDictionaryKey: "X-Naver-Client-Id") as! String,
            "X-Naver-Client-Secret": Bundle.main.object(forInfoDictionaryKey: "X-Naver-Client-Secret") as! String
        ]
        
        AF.request(url, method: .get, parameters: parameters, headers: headers)
            .responseDecodable(of: BookSearchResponseModel.self) { response in
                switch response.result {
                case .success(let result):
                    completionHandler(result.items)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        .resume()
    }
}
