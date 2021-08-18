import UIKit

/*
 class 클래스 이름 {
    properties
 
    methods
 }
 */
class Dog {
    var name: String = ""
    var age: Int = 0
    
    init() {    // class의 경우, struct와 달리 생성자를 정의해주어야함
        
    }
    
    func introduce() {
        print("name: \(name), age: \(age)")
    }
}

var dog = Dog()

// property 접근 및 변경
print(dog.name)
print(dog.age)
dog.name = "haru"
dog.age = 2
print(dog.name)
print(dog.age)

dog.introduce()
