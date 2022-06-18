//
//  User.swift
//  Cafe
//
//  Created by 박진우 on 2022/06/06.
//

import Foundation

struct User {
    let userName: String
    let account: String
    
    static let shared = User(userName: "Jinu", account: "jw9622")
}
