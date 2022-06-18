//
//  Tab.swift
//  Cafe
//
//  Created by 박진우 on 2022/05/03.
//

import SwiftUI

// 관리하기 용이하기위해 enum으로 사용
enum Tab {
    case home
    case other
    
    // associated value
    var tabTextItem: Text {
        switch self {
        case .home: return Text("Home")
        case .other: return Text("Other")
        }
    }
    
    var imageItem: Image {
        switch self {
        case .home: return Image(systemName: "house.fill")
        case .other: return Image(systemName: "ellipsis")
        }
    }
}
