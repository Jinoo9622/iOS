import UIKit

// assert
// - 특정 조건을 체크하고, 조건이 성립되지 않으면 메세지를 출력하게 할 수 있는 함수
// - 디버깅 모드에서만 동작하고, 주로 디버깅 중 조건의 검증을 위하여 사용

// guard
// - 무언가를 검사하여, 그 다음에 오는 코드를 실행할지 말지 결정
// - guard문에 주어진 조건문이 false일때 guard 블럭이 실행

var value = 0
assert(value == 0)

value = 2
//assert(value == 0, "값이 0이 아닙니다")    // Assertion failed: 값이 0이 아닙니다

/*
 guard 조건 else {
    // 조건이 false이면 else 구문이 실행되고,
    return, throw, break를 통해 이후 코드를 실행하지 않도록 함
 }
 */

func guardTest(value: Int) {
    guard value == 0 else { return }
    print("Hello")
}

guardTest(value: 0)
guardTest(value: 2)     // guard문에 막혀 이후코드 실행 X


func guardTest2(value: Int?) {
    guard let value = value else { return }
    print("\(value)")
}

guardTest2(value: 0)
guardTest2(value: nil)  // guard문에 막혀 이후코드 실행 X
