import UIKit

enum PhoneError: Error {
    case unknown
    case batteryLow(batteryLevel: Int)
}

// Error 발생
//throw PhoneError.batteryLow(batteryLevel: 20)
/*
Playground execution terminated: An error was thrown and was not caught:
▿ PhoneError
  ▿ batteryLow : 1 element
    - batteryLevel : 20
*/

// 오류를 처리하는 방법
// 1. 함수에서 발생한 오류를 해당 함수를 호출한 코드에 전파
// 2. do-catch 구문을 사용하여 오류처리
// 3. optional을 이용하여 오류 처리
// 4. 오류가 발생하지 않을 것이라고 확신

// 1. 함수에서 발생한 오류를 해당 함수를 호출한 코드에 전파
func checkPhoneBatteryStatus(batteryLevel: Int) throws -> String {
    guard batteryLevel != -1 else { throw PhoneError.unknown }
    guard batteryLevel > 20 else { throw PhoneError.batteryLow(batteryLevel: batteryLevel) }
    return "Battery status is normal."
}
// 2. do-catch 구문을 사용하여 오류처리
/*
 do {
    try 오류 발생 가능 코드
 } catch 오류 패턴 {
    처리 코드
 }
 */
do {
    try checkPhoneBatteryStatus(batteryLevel: 20)
} catch PhoneError.unknown {
    print("Unknown Error")
} catch PhoneError.batteryLow(let batteryLevel) {
    print("Battery lack, remain : \(batteryLevel)%")
} catch {
    print("Else : \(error)")
}

// 3. optional을 이용하여 오류 처리
let status = try? checkPhoneBatteryStatus(batteryLevel: -1) // error 발생 시, nil이 반환됨 (error 발생여부 확인 가능)
print(status)

// 4. 오류가 발생하지 않을 것이라고 확신
let status2 = try! checkPhoneBatteryStatus(batteryLevel: 21) // error 발생 시, 프로그램 강제종료!
print(status2)
