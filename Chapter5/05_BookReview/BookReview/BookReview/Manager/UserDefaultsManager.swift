//
//  UserDefaultsManager.swift
//  BookReview
//
//  Created by 박진우 on 2022/07/11.
//

import Foundation

protocol UserDefaultsManagerProtocol {
    func getReviews() -> [BookReview]
    func setReview(_ newValue: BookReview)
}

struct UserDefaultsManager: UserDefaultsManagerProtocol {
    enum Key: String {
        case review
    }
    
    func getReviews() -> [BookReview] {
        guard let data = UserDefaults.standard.data(forKey: Key.review.rawValue) else { return [] }
        
        return (try? PropertyListDecoder().decode([BookReview].self, from: data)) ?? []
    }
    
    func setReview(_ newValue: BookReview) {
        var currentReviews: [BookReview] = getReviews()
        currentReviews.insert(newValue, at: 0)  // 작성한 review를 가장 최신 data로 넣
        UserDefaults.standard.setValue(
            try? PropertyListEncoder().encode(currentReviews),
            forKey: Key.review.rawValue
        )
    }
}
