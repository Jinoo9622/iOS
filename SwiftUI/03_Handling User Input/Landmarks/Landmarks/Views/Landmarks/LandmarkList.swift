//
//  LandmarkList.swift
//  Landmarks
//
//  Created by A on 2022/12/08.
//

import SwiftUI

struct LandmarkList: View {
    // environmentObject(_:)가 적용되는 한, 해당 property는 자동으로 값들을 update
    // @EnvironmentObject: 상위 View에서 내려온 data
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoriteOnly = false

    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter {
            (!showFavoriteOnly || $0.isFavorite)
        }
    }

    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $showFavoriteOnly) {
                    Text("Favorites only")
                }

                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
            .environmentObject(ModelData())
    }
}
