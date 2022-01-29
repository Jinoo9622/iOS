//
//  RankingFeature.swift
//  AppStore
//
//  Created by 박진우 on 2022/01/29.
//

import Foundation

struct RankingFeature: Decodable {
    let title: String
    let description: String
    let isInPurchaseApp: Bool
}
