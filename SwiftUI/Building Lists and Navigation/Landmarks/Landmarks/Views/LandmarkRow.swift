//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by A on 2022/12/08.
//

import SwiftUI

struct LandmarkRow: View {
    // stored property 추가 시, preview에 initializ 필요
    var landmark: Landmark

    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)

            Spacer()
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            LandmarkRow(landmark: landmarks[0])
            LandmarkRow(landmark: landmarks[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
