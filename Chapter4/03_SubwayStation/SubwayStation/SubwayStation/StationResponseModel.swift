//
//  StationResponseModel.swift
//  SubwayStation
//
//  Created by 박진우 on 2022/02/08.
//

import Foundation

struct StationResponseModel: Decodable {
    /**
     * Tip
     *   stations를 사용하여, StationResponseModel.searchInfo.row 형태로 복잡하게 사용될 부분을 간소화 시킴
     *   -> StationResponseModel.stations
     */
    var stations: [Station] { searchInfo.row }
    
    private let searchInfo: SearchInfoBySubwayNameServiceModel
    
    enum CodingKeys: String, CodingKey {
        case searchInfo = "SearchInfoBySubwayNameService"
    }
    
    struct SearchInfoBySubwayNameServiceModel: Decodable {
        var row: [Station] = []
    }
}

struct Station: Decodable {
    let stationName: String
    let lineNumber: String
    
    enum CodingKeys: String, CodingKey {
        case stationName = "STATION_NM"
        case lineNumber = "LINE_NUM"
    }
}
