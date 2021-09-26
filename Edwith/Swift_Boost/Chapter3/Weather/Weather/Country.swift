//
//  Country.swift
//  Weather
//
//  Created by 박진우 on 2020/07/12.
//  Copyright © 2020 박진우. All rights reserved.
//

import Foundation

/*
 {"korean_name":"한국","asset_name":"kr"},
 */

struct Country: Codable {
    let koreanName: String
    let assetName: String
    
    enum CodingKeys : String, CodingKey {
        case koreanName = "korean_name"
        case assetName = "asset_name"
    }
}
