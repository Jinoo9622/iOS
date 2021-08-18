import UIKit

// Initialization: 클래스, 구조체 또는 열거형의 instance를 사용하기 위한 준비 과정
/* 클래스, 구조체, 열거형안에 정의 가능
  init(매개변수: 타입, ...) {     // overloading 가능
    // property 초기화
    // instance 생성 시 필요한 설정을 해주는 코드 작성
 }
 */
class User {
    var nickname: String
    var age: Int
    
    init(nickname: String, age: Int) {
        self.nickname = nickname
        self.age = age
    }
    
    init(age: Int) {
        self.nickname = "no name"
        self.age = age
    }
    
    deinit {    // instance 해제 직전에 호출, class에서만 선언 가능
        print("deinit user class")
    }
}

var user = User(nickname: "swift", age: 26)
print(user.nickname)
print(user.age)

var user2 = User(age: 20)
print(user2.nickname)
print(user2.age)

var user3: User? = User(age: 23)
user3 = nil     // instance 해제
