//
//  Weather.swift
//  Weather
//
//  Created by 박진우 on 2020/07/12.
//  Copyright © 2020 박진우. All rights reserved.
//

import Foundation
/*
 {
    "city_name":"서울",
    "state":12,
    "celsius":17.8,
    "rainfall_probability":60
 },
 */

struct Weather: Codable {
    let cityName: String
    let state: Int
    let celsius: Float
    let rainfallProbability: Int
    
    var temperature: String {
        let fahrenheit = String(format: "%.1f", (self.celsius * 9/5 + 32))
        
        return "섭씨 \(self.celsius)도 / 화씨 \(fahrenheit)도"
    }
    
    var rainFall: String {
        return "강수확률 \(rainfallProbability)%"
    }
    enum CodingKeys: String, CodingKey {
        case cityName = "city_name"
        case state, celsius
        case rainfallProbability = "rainfall_probability"
    }
}
