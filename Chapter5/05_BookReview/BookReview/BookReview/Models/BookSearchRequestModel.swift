//
//  BookSearchRequestModel.swift
//  BookReview
//
//  Created by 박진우 on 2022/07/11.
//

import Foundation

struct BookSearchRequestModel: Codable {
    /// 검색할 책 키워드
    let query: String
}
