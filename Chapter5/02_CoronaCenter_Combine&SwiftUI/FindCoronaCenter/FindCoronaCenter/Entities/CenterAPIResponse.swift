//
//  CenterAPIResponse.swift
//  FindCoronaCenter
//
//  Created by 박진우 on 2022/04/28.
//

import Foundation

struct CenterAPIResponse: Decodable {
    let data: [Center]
}
