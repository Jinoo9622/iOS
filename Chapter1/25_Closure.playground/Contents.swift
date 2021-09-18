import UIKit

// Closure
// - 코드에서 전달 및 사용할 수 있는 독립 기능 블록이며, 일급 객체의 역할을 할 수 있음
//   ※ 일급객체 : 전달 인자로 보낼 수 있고, 변수/상수 등으로 저장하거나 전달할 수 있으며, 합수의 반환값이 될 수 있음

/* 표현식
 ~~ { (parameter) -> type in     <- closure head
     실행 구문                      <- closure body
 }
 */
let hello = { () -> () in
    print("hello")
}
hello()

let hello2 = { (name: String) -> String in
    return "Hello, \(name)"
}
//hello2(name: "Park")    // error : closure는 전달인자 label을 사용하지않음
hello2("Park")

// closure를 parameter로 전달 (일급객체이기에 가능)
func doSomething(closure: () -> ()) {
    closure()
}
// 표현식 및 생략
doSomething(closure: { () -> () in
    print("Hi")
})

doSomething() {
    print("HIHI")
}

doSomething {
    print("HIHI")
}


func doSomething2() -> () -> () {
    return { () -> () in
        print("doSomething2")
    }
}

doSomething2()()
// parameter로 n개의 closure가 있는 경우
func doSomething2(success: () -> (), fail: () -> ()) {
}

doSomething2 {
    print("success")
} fail: {
    print("fail")
}


func doSomething3(closure: (Int, Int, Int) -> Int) {
    closure(1,2,3)
}

// 표현을 간소화 (다 동일한 결과)
doSomething3(closure: { (a, b, c) in
    return a + b + c
})

doSomething3(closure: {
    return $0 + $1 + $2
})

doSomething3(closure: {
    // 실행구문에 단일 return만 있는 경우, 생략 가능
    $0 + $1 + $2
    // print("closure test")
    // return $0 + $1 + $2
})

doSomething3() {
    $0 + $1 + $2
}

doSomething3 {
    $0 + $1 + $2
}
