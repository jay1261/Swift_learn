// 고차 함수

// 전달 인자로 함수를 전달받거나
// 함수 실행의 결과를 함수로 반환하는 함수

// map, filter, reduce


import UIKit

// map
// 컨테이너 내부의 기존 데이터를 변형해서 새로운 컨테이너 생성
let numbers: [Int] = [0,1,2,3,4]
var doubledNumbers: [Int]
var strings: [String]
// 배열 내부의 값들을 두배 곱하거나, 문자열로 변환하는 예
// 기존의 for문을 사용한 방식
doubledNumbers = [Int]()    // 배열 생성
strings = [String]()

for number in numbers{
    doubledNumbers.append(number * 2)
    strings.append("\(number)")
}
print(doubledNumbers)
print(strings)

// map 매서드 사용
doubledNumbers = numbers.map({(number: Int) -> Int in
    return number * 2
})

strings = numbers.map({(number: Int) -> String in
    return "\(number)"
})

print(doubledNumbers)
print(strings)

// 클로저 기법들 사용 가능 (매개변수 , 반환타입, 반환 키워드 생략, 후행 클로져)
doubledNumbers = numbers.map {$0 * 2}
print(doubledNumbers)

// filter
// 컨테이너 내부의 값을 걸러서 새로운 컨테이너로 추출

// for 구문으로 구현 , 변수를 먼저 생성해야함
var filtered: [Int] = [Int]()

for number in numbers{
    if number % 2 == 0 {
        filtered.append(number)
    }
}

print(filtered)

// filter 메서드 사용 , 변수에 바로 사용 가능
let evenNumber: [Int] = numbers.filter {
    (number: Int) -> Bool in
    return number % 2 == 0
}
print(evenNumber)

// 클로저 기법 사용 가능(매개변수 , 반환타입, 반환 키워드 생략, 후행 클로져)
let oddNumber: [Int] = numbers.filter {
    $0 % 2 == 1
}
print(oddNumber)


// reduce
// 컨테이너 내부의 콘텐츠를 하나로 통합

let someNumbers: [Int] = [2,8,15]

// for 구문 사용
var result: Int = 0
for number in someNumbers{
    result += number
}
print(result)   // 25

// reduce 메서드 사용
// 초깃값이 0이고 someNumbers 내부의 모든 값을 더한다
var sum: Int = someNumbers.reduce(0,{
    (first: Int, second: Int) -> Int in
    return first + second
})
print(sum)  // 25

// 초깃값이 0이고 someNumbers 내부의 모든 값을 뺀다
var subtract: Int = someNumbers.reduce(0,{
    (first: Int, second: Int) -> Int in
    return first - second
})
print(subtract) // -25

// 클로저 기법 사용 가능
let sumFromThree = someNumbers.reduce(3) {$0 + $1}
print(sumFromThree) // 28

print(someNumbers.reduce(1){$0 * $1}) // 240




