//
//  WeatherInfomation.swift
//  Weather
//
//  Created by 박진우 on 2021/11/17.
//

import Foundation
// Codable protocol : 자신을 변환하거나, 외부표현(ex. json)으로 변환할 수 있는 type
struct WeatherInfomation: Codable {
    let weather: [Weather]
    let temp: Temp
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case weather
        case temp = "main"
        case name
    }
}
// json 형태로 data 변환 시, json type의 key와 사용자가 정의한 property의 이름과 type이 일치해야함
/*
 weather: [
     {
         id: 800,
         main: "Clear",
         description: "clear sky",
         icon: "01n"
     }
 ]
 */
struct Weather: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}
// ※ key와 property의 이름을 다르게 사용할 경우, type 내부에서 CodingKeys 열거형 선언 후, CodingKey protocol 채택
/*
 main: {
     temp: 279.65,
     feels_like: 278.76,
     temp_min: 276.57,
     temp_max: 281.84,
     pressure: 1022,
     humidity: 61
 }
 */
struct Temp: Codable {
    let temp: Double
    let feelsLike: Double
    let minTemp: Double
    let maxTemp: Double
    
    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case minTemp = "temp_min"
        case maxTemp = "temp_max"
    }
}
