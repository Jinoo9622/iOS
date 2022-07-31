//
//  BookSearchResponseModel.swift
//  BookReview
//
//  Created by 박진우 on 2022/07/11.
//

import Foundation

struct BookSearchResponseModel: Decodable {
    // response에서 items 배열의 값이 없는 경우 처리하기 위해 변수로 선언하여 초기값 설정
    var items: [Book] = []
}

