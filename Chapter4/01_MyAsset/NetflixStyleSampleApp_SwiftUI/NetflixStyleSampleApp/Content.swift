//
//  Content.swift
//  NetflixStyleSampleApp
//
//  Created by 박진우 on 2021/12/28.
//

import UIKit
 
// 사용자가 직접 write 작업을 하지않기에 Decodable로 설정
struct Content: Decodable {
    let sectionType: SectionType
    let sectionName: String
    let contentItem: [Item]
    
    // sectionType은 String이나, 아래의 type으로 이루어져있기에 enum으로 선언 
    enum SectionType: String, Decodable {
        case basic
        case main
        case large
        case rank
    }
}

struct Item: Decodable {
    let description: String
    let imageName: String
    
    var image: UIImage {
        return UIImage(named: imageName) ?? UIImage()
    }
}

