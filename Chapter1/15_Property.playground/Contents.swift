import UIKit

// property: 클래스, 구조체 또는 열거형 등에 관련된 값을 뜻한다
// - Stored Property: 인스턴스의 변수 or 상수
struct Dog {
    // 저장 프로퍼티
    var name: String
    let gender: String
}

var dog = Dog(name: "haru", gender: "Male")
print(dog)

dog.name = "coco"
//dog.gender = "Female"   // 해당 property가 let(상수)으로 선언되었기에 error 발생

let dog2 = Dog(name: "haru", gender: "Female")
//dog2.name = "coco"      // 해당 instance가 let(상수)으로 선언되었기에 error 발생, struct는 value type이기 때문 (class의 경우 reference type이기에 error X)

class Cat {
    var name: String
    let gender: String
    
    init(_ name: String, _ gender: String) {
        self.name = name
        self.gender = gender
    }
}
let cat = Cat("json", "male")
cat.name = "kiki"
print(cat.name)


// - Computed Property: 값을 저장하는것이 아닌 특정 연산을 실행한 결과값
struct Stock {
    var averagePrice: Int
    var quantity: Int
    // Computed Property
    var purchasePrice: Int {
        get {
            return averagePrice * quantity
        }
        // set 연산자가 없는 경우, read only
        set(newPrice) {
            averagePrice = newPrice / quantity
        }
        /*
        set {   // 매개변수를 설정하지 않는 경우, default로 newValue로 설정됨
            averagePrice = newValue / quantity
        }
        */
    }
}

var stock = Stock(averagePrice: 2300, quantity: 3)
print(stock)
stock.purchasePrice     // Computed Property 접근 시, get안의 연산 후, 값 return
stock.purchasePrice = 3000      // Computed Property 값 변경 시, set안의 연산 진행
stock.averagePrice


// 프로퍼티 옵저버: 프로퍼티의 값의 변화를 감지 (값이 set 될때마다 호출)
// Stored Property, Override Stored/Computed Property에서만 사용 가능
class Account {
    var credit: Int = 0 {
        // 매개변수 이름 지정
        willSet {       // 값이 set 되기 직전에 호출
            print("잔액이 \(credit)원에서 \(newValue)원으로 변경될 예정입니다")
        }
        
        didSet {        // 값이 set 되고 난 이후에 호출
            print("잔액이 \(oldValue)원에서 \(credit)원으로 변경되었습니다.")
        }
    }
}

var account = Account()
account.credit = 1000


// - Type Property: 특정 인스턴스에서 사용되는것이 아닌, 특정 타입에서 사용되는 프로퍼티.
//                  인스턴스 생성 없이 객체 내의 프로퍼티에 접근을 가능하게 하는 프로퍼티.
//                  프로퍼티와 타입 자체를 연결.
struct SomeStructure {
    // stored / computed property에서만 사용 가능, static으로 선언
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 1
    }
}

// type property 접근
SomeStructure.storedTypeProperty
SomeStructure.computedTypeProperty

// type property 변경
SomeStructure.storedTypeProperty = "Changed vale."
SomeStructure.storedTypeProperty 
