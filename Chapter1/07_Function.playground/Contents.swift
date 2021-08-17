import UIKit

// Function
/*
func 함수명(파라미터 이름: 데이터 타입) -> 반환 타입 {
  ...
  return 반환 값
}
*/

func sum(a: Int, b: Int) -> Int {
    return a + b
}
sum(a: 10, b: 3)

func hello() -> String {
    return "Hello"
}
print(hello())

func printName() -> Void {      // return Void : 리턴값 생략 가능 => func printName() { ... }
}

func greeting(friend: String, me: String = "swift") {   // 디폴트 변수 선언 (전달값이 없는 경우, 디폴트값 사용)
    print("Hello, \(friend)! I'm \(me)")
}
greeting(friend: "java")
greeting(friend: "python", me: "java")


/*  // 코드의 가독성 증가
 func 함수 이름(전달인자 레이블: 매개변수 이름: 매개변수 타입, 전달인자 레이블: 매개변수 이름: 매개변수 타입...) -> 반환 타입 {
    ...
    return 반환 값
 }
 */
func sendMessage(from myName: String, to name: String) -> String {
    return "Hello \(name)! I'm \(myName)"
}
print(sendMessage(from: "java", to: "swift"))

func sendMessage(_ name: String) -> String {
    return "Hello \(name)"
}
print(sendMessage("java"))

func sendMessage(me: String, friends: String...) -> String {    // 가변매개변수 사용 (배열을 넘겨받음 / 함수당 1개)
    return "Hello \(friends)! I'm \(me)"
}
print(sendMessage(me: "swift", friends: "java", "python", "c#"))
