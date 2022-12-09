//
//  LandmarkList.swift
//  Landmarks
//
//  Created by A on 2022/12/08.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        // List의 각각의 element는 identifiable!
        // - key path 사용 or element가 identifiable protocol을 만족

        /* key path 사용
        List(landmarks, id: \.id) { landmark in
            LandmarkRow(landmark: landmark)
        }
        */
        // element가 identifiable protocol을 만족
        NavigationView {
            List(landmarks) { landmark in
                NavigationLink {
                    LandmarkDetail(landmark: landmark)
                } label: {
                    LandmarkRow(landmark: landmark)
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE (3rd generation)", "iPhone Xs Max"], id: \.self) { deviceName in
            // 각각의 simulator에서의 preview
            LandmarkList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
