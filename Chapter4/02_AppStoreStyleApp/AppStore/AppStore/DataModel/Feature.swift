//
//  Feature.swift
//  AppStore
//
//  Created by 박진우 on 2022/01/29.
//

import Foundation

struct Feature: Decodable {
    let type: String
    let appName: String
    let description: String
    let imageURL: String
}
