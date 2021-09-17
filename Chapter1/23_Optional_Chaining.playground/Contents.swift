import UIKit

// Optional Chaining
// - optional에 속해있는 nil일지도 모르는 property, method, subscription등을 가져오거나 호출할 때 사용할수있는 일련의 과정

struct Developer {
    var name: String
}

struct Company {
    let name: String
    var developer: Developer?
}

var developer = Developer(name: "Park")
var company = Company(name: "Swift", developer: nil)
print(company.developer)    // nil

company.developer = developer
print(company.developer)    // Optional(__lldb_expr_24.Developer(name: "han"))
//print(company.developer.name)   // error 발생

// ?로 unwrapping 시, optional값 return (nil 가능)
// !로 unwrapping 시, 해당 값 return (nil일 경우 error발생)
print(company.developer?.name)      // Optional("Park")
print(company.developer!.name)     // Park
