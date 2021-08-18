import UIKit

/*
 for 루프상수 in 순회대상(Collection Type, string, 범위데이터) {
    ...
 }
 */
for i in 1...4 {
    print(i)
}

let array = [1,2,3,4,5]

for i in array {
    print(i, terminator: " ")
}

/*  조건식이 참일 경우 code block 실행
 while 조건식(boolean type) {
    ...
 }
 */
var number = 5

while number < 10 {
    number += 1
}
print()
print(number)

/*  적어도 1번은 code block 실행
 repeat {
    ...
 } while 조건식
 */
var x = 6

repeat {
    x += 2
} while x < 5

print(x)
