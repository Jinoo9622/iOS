//
//  MapView.swift
//  FindCoronaCenter
//
//  Created by 박진우 on 2022/04/28.
//

import SwiftUI
import MapKit   // apple의 자체 MapKit

struct AnnotationItem: Identifiable {
    let id = UUID()
    var coordinate: CLLocationCoordinate2D
}

struct MapView: View {
    var coordination: CLLocationCoordinate2D
    // @State: Observable과 달리 해당 view 안에서만 변화하는 상태를 의미
    // - 외부의 어떤 영향을 받지 않음
    @State private var region = MKCoordinateRegion()
    @State private var annotationItems = [AnnotationItem]()
    
    var body: some View {
        Map(
            coordinateRegion: $region,  // @State로 선언된 변수의 경우, $표시를 하여, 해당 state를 주시하겠다고 표현
            annotationItems: [AnnotationItem(coordinate: coordination)],
            annotationContent: {
                MapMarker(coordinate: $0.coordinate)
            }
        )
        .onAppear {
            setRegion(coordination)
            setAnnotationItems(coordination)
        }
    }
    
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
            )
    }
    
    private func setAnnotationItems(_ coordinate: CLLocationCoordinate2D) {
        annotationItems = [AnnotationItem(coordinate: coordinate)]
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        let center0 = Center(id: 0, sido: .경기도, facilityName: "실내빙상장 앞", address: "경기도 안양시 동안구 평촌대로 389", lat: "37.404476", lng: "126.9491998", centerType: .local, phoneNumber: "031-8045-4832")
        
        MapView(coordination: CLLocationCoordinate2D(latitude: CLLocationDegrees(center0.lat) ?? .zero, longitude: CLLocationDegrees(center0.lng) ?? .zero))
    }
}
