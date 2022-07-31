//
//  BookReview.swift
//  BookReview
//
//  Created by 박진우 on 2022/07/11.
//

import Foundation

struct BookReview: Codable {
    let title: String
    let contents: String
    let imageURL: URL?
}
