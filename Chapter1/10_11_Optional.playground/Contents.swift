import UIKit

// optional: 값이 있을수도 있고 없을 수 도 있 (= nullable)
// var 변수명: type? = nil <- nil(null)을 지정
var name: String?

var optionalName: String? = "swift"
print(optionalName)
//var requiredName: String = optionalName     // optional이 아닌 변수 생성 시에 optional 변수 대입 불가 (컴파일 전까지는 optional에 할당한 데이터 확인 X)


// 11_Optional binding

// • 명시적 해제
//  - 강제 해제: 값이 nil일 경우 error 발생 가능
var number: Int? = 3
print(number)
print(number!)  // 강제 해제

//  - 비강제 해제 (옵셔널 바인딩)
if let result = number {
    print(result)
} else {    // 옵셔널 바인딩 실패시 else 구문 실행
    
}

func test() {
    let number: Int? = 5
    guard let result = number else { return }   // guard로 옵셔널 바인딩 시에는 if let 구문과 다르게 변수 or 상수를 해당 영역에서 사용 가능
    print(result)
}
test()

// • 묵시적 해제
//  - 컴파일러에 의한 자동 해제: 비교연산자 사용 시, 컴파일러가 자동으로 옵셔널 바인딩 해제
let value: Int? = 6

if value == 6 {
    print("value == 6")
} else {
    print("value != 6")
}

//  - 옵셔널의 묵시적 해제: 값 사용 시, 자동으로 옵셔널 바인딩 해제
let string = "12"
var stringToInt: Int! = Int(string)
print(stringToInt + 1)
