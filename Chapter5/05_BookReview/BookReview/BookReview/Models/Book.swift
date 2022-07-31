//
//  Book.swift
//  BookReview
//
//  Created by 박진우 on 2022/07/11.
//

import Foundation

struct Book: Decodable {
    /// 책 이름
    let title: String
    private let image: String?
    /// 책 이미지 url
    var imageURL: URL? {
        URL(string: image ?? "")
    }
    
    init(title: String, imageURL: String?) {
        self.title = title
        self.image = imageURL
    }
}
