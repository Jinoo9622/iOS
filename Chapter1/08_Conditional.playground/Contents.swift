import UIKit

/*
 if 조건식 {
    ...
 }
 */
var age = 12

if age < 19 {
    print("미성년자 입니다.")
}

/*
 if 조건식 {
    ...
 } else {   // else의 경우 있어도 없어도 OK
    ...
 }
 */
age = 20
if age < 19 {
    print("미성년자 입니다.")
} else {
    print("성인 입니다.")
}

/*
 if 조건식1 {
    ...
 } else if 조건식2 {  // else if 조건은 무수히 추가 가능
    ...
 } else {           // else의 경우 있어도 없어도 OK
    ...
 }
 */
var animal = "cat"

if animal == "dog" {
    print("feed dog")
} else if animal == "cat" {
    print("feed cat")
} else {
    print("there is no feedstuff")
}

/*
 switch 비교대상 {
    case 패턴1:
        패턴1 일치할 때 실행되는 구문
    case 패턴2, 패턴3:
        패턴2, 3이 일치할 때 실행되는 구문
    default:
        아무런 case에도 일치하지 않을 때 실행되는 구문
 }
 */
let color = "red"

switch color {
case "blue":
    print("color is blue")
case "green":
    print("color is green")
case "yellow":
    print("color is yellow")
default:
    print("no match color case")
}

// switch문 사용 시, 범위연산자 사용 가능
let temperature = 30

switch temperature {
case -20...9:
    print("Winter")
case 10...14:
    print("Autumn")
case 15...25:
    print("Spring")
case 26...35:
    print("Summer")
default:
    print("Abnormal!!")
}
