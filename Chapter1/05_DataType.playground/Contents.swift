import UIKit

// Int: 64bit 정수
// UInt: 부호없는 64bit 정수
// Float: 32bit 부동 소수점
// Double: 64bit 부동 소수점
// Bool: true, false
// Character: 문자
// String: 문자열
// Any: 모든 타입

// Int
var someInt: Int = -100
someInt = 100
//someInt = 1.1   // int에 float 할당 => error

// UInt
var someUInt: UInt = 200

// Float
var someFloat: Float = 1.1
someFloat = 1
print(someFloat)

// Double
var someDouble: Double = 1.1
someDouble = 1

// Bool
var someBool: Bool = true
someBool = false

// Character
var someCharacter: Character = "가"
someCharacter = "A"
someCharacter = "🥰"
//someCharacter = "swift"     // character에 string 할당 => error

// String
var someString: String = "안녕하세오 🤚"

// 타입추론 - 변수/상수의 타입을 컴파일러가 자동으로 판단 (타입 생략 가능)
var number = 10
