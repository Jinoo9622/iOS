//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by A on 2022/12/05.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @StateObject private var modelData = ModelData()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
