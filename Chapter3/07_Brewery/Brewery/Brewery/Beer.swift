//
//  Beer.swift
//  Brewery
//
//  Created by 박진우 on 2022/01/04.
//

import UIKit

struct Beer: Decodable {
    let id: Int?
    let name, taglineString, description, brewersTips, imageURL: String?
    let foodPairing: [String]?
    
    // 각각의 tag들에 #을 추가 및 변형 (실제 해쉬태그형식으로 변환)
    var tagLine: String {
        let tags = taglineString?.components(separatedBy: ". ")
        let hashtags = tags?.map {
            "#" + $0.replacingOccurrences(of: " ", with: "")
                .replacingOccurrences(of: ".", with: "")
                .replacingOccurrences(of: ",", with: " #")
        }
        return hashtags?.joined(separator: " ") ?? ""
    }
    
    enum CodingKeys: String, CodingKey {
        case id, name, description
        case taglineString = "tagline"
        case brewersTips = "brewers_tips"
        case imageURL = "image_url"
        case foodPairing = "food_pairing"
    }
}
