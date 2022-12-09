//
//  MapView.swift
//  Landmarks
//
//  Created by A on 2022/12/06.
//

import SwiftUI
import MapKit

struct MapView: View {
    // @State: 1개 이상의 View에서 수정 가능한 데이터 설정 시 사용
    // - 해당 값에 따른 View update를 자동으로 처리
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868),
        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
    )

    var body: some View {
        // @State 변수는 '$'를 붙여서 binding (reference)
        Map(coordinateRegion: $region)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
