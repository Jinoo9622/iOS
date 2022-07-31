//
//  MockUserDefaultsManager.swift
//  BookReviewTests
//
//  Created by 박진우 on 2022/07/15.
//

import Foundation
@testable import BookReview

final class MockUserDefaultsManager: UserDefaultsManagerProtocol {
    var isCalledGetReviews = false
    var isCalledSetReview = false
    
    func getReviews() -> [BookReview] {
        isCalledGetReviews = true
        
        return []
    }
    
    func setReview(_ newValue: BookReview) {
        isCalledSetReview = true
    }
}
