//
//  ModelData.swift
//  Landmarks
//
//  Created by A on 2022/12/06.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
    // SwiftUI는 observable object를 subscribe하고, 해당 데이터 변경 시, 업데이트가 필요한 View를 새로 고침.
    // @Published attribute를 사용하여 observable object 선언!
    @Published var landmarks: [Landmark] = load("landmarkData.json")
}


func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main budle: \n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
