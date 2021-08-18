import UIKit

/*
 struct 구조체 이름 {
    properties(member variable)
 
    methods(member function)
 }
 */
struct User {   // struct의 경우, 별도의 생성자 없이도 자동으로 생성자를 생성해줌 (해당 struct의 property들로 생성)
    var nickname: String
    var age: Int
    
    func getInformation() {
        print("\(nickname), \(age)")
    }
}

var user: User = User(nickname: "user", age: 26)

// property 접근
user.nickname
user.age

// property 변경
user.nickname = "swift"
user.age = 20

// method 호출
user.getInformation()
