//
//  CafeApp.swift
//  Cafe
//
//  Created by 박진우 on 2022/05/03.
//

import SwiftUI

@main
struct CafeApp: App {
    var body: some Scene {
        WindowGroup {
            MainTabView()
                .accentColor(.green)
        }
    }
}
