//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by A on 2022/12/05.
//

import SwiftUI

@main
struct LandmarksApp: App {
    // @StateObject attribute: 한번의 app life cycle 동안 사용할 property initialize
    @StateObject private var modelData = ModelData()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
