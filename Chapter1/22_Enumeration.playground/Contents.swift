import UIKit

enum CompassPoint: String {     // 원시값 선언
    case north = "북"
    case south = "남"
    case east = "동"
    case west = "서"
    // case north, south, east, west
}

var direction = CompassPoint.east
direction = .west

switch direction {
case .north:
    print("north, \(direction.rawValue)")
case .south:
    print("south, \(direction.rawValue)")
case .east:
    print("east, \(direction.rawValue)")
case .west:
    print("west, \(direction.rawValue)")
}

// rawValue로 해당 값에 매칭되는 열거형 반환 (인스턴스 생성 시, 원시값을 넘겨줌)
let direction2 = CompassPoint(rawValue: "남")
direction2

// 연관값 설정 가능
enum PhoneError {
    case unknown
    case batteryLow(String)
}

let error = PhoneError.batteryLow("배터리가 곧 방전됩니다.")
error

// 연관값 추출
switch error {
case .batteryLow(let message):
    print(message)
case .unknown:
    print("알 수 없는 에러.")
}
