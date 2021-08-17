import UIKit

// Collection Type
// Array - 데이터 타입의 값들을 순서대로 저장하는 리스트
var numbers: Array<Int> = Array<Int>()  // 기본적인 생성자
var names: [String] = []

// 순서대로 값 추가
numbers.append(1)
numbers.append(2)
numbers.append(3)

// Array 접근
numbers[0]
numbers[1]

// 값 삽입
numbers.insert(4, at: 2)
numbers

// 값 제거
numbers.remove(at: 0)
numbers


// Dictionary - 순서없이 키(key)와 값(value) 한 쌍으로 데이터를 저장하는 컬렉션 타입
// var dic: Dictionary<String, Int> = Dictionary<String, Int>()
var dic: [String: Int] = ["swift": 1]
// (key, value) 추가
dic["java"] = 2
dic["python"] = 5
dic

// key에 해당하는 value 변경
dic["swift"] = 100
dic

// key에 해당하는 value 제거
dic.removeValue(forKey: "java")
dic


// Set - 같은 데이터 타입의 값을 순서없이 저장하는 리스트
var set: Set = Set<Int>()   // Set은 축약형 생성자 X

// 값 추가
set.insert(10)
set.insert(20)
set.insert(30)
set.insert(30)
set.insert(20)
set

// 값 제거
set.remove(20)
set
