import UIKit

// Protocol
// - 특정 역할을 하기 위한 메서드, 프로퍼티, 기타 요구사항등의 청사진 정의 (인터페이스)
/*
 protocol 이름 {
    요구사항..
 }
 */
protocol SomeProtocol {
    
}

protocol SomeProtocol2 {
    
}

struct SomeStructure: SomeProtocol, SomeProtocol2  {    // protocol 채택 (다수 채택 가능)
    
}

/*
 class SomeClass: SomeSuperclass, FirstProtocol, AnotherProtocol {  // class의 경우 상속을 받을 때, 상속받을 superclass를 제일 먼저 선언
    
 }
 */

protocol FirstProtocol {
    // stored property 선언 (var로 선언)
    var name: Int { get set }
    var age: Int { get }
}

protocol AnotherProtocol {
    // type property 선언 (static으로 선언)
    static var someTypeProperty: Int { get set }
}

protocol SomeProtocol3 {
    // protocol에서 method 지정 시, 해당 method의 본문은 필요가 없으며
    // 매개변수는 지정이 가능하나, default값은 지정 불가.
    func someTypeMethod()
}

protocol FullyNames {
    var fullName: String { get set }
    func printFullName()
}

struct Person: FullyNames {
    var fullName: String
    
    func printFullName() {
        print("fullName : \(fullName)")
    }
}

protocol SomeProtocol4 {
    // constructor 정의
    // constructo 키워드와 매개변수만 선언
    init(someParameter: Int)
}

protocol SomeProtocol5 {
    init()
}

class SomeClass: SomeProtocol5 {
    // protocol에서 요구하는 생성자를 구현할때는 required 식별자 선언 필요 (class인 경우 -> struct인 경우에는 필요 없음)
    required init() {
        
    }
}
