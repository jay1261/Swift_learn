import Swift

// function
func sumF(a: Int, b: Int) -> Int{
    return a + b
}

var sumResult : Int = sumF(a: 1, b: 2)
print(sumResult)

// Closure
var sum: (Int, Int) -> Int = { (a: Int, b: Int) -> Int in
    return a + b
}

sumResult = sum(1,2)
print(sumResult)

sum = sumF(a:b:) // 클로저에 함수 할당 가능하다.

//클로저는 함수의 전달 인자로 사용됨

let add: (Int, Int) -> Int
add = {(a: Int, b: Int) -> Int in
    return a + b
}

let substract: (Int, Int) -> Int
substract = {(a: Int, b: Int) -> Int in
    return a - b
}

let divide: (Int, Int) -> Int
divide = {(a: Int, b: Int) -> Int in
    return a / b
}

func calculate(a: Int, b: Int, method: (Int, Int)-> Int) -> Int {
    return method(a,b)
}
var caculated: Int

caculated = calculate(a: 3, b: 5, method: substract)
print(calculate(a: 2,b: 3, method: add))

var c = calculate(a: 50, b: 10, method: {(a: Int, b: Int) -> Int in
    return a * b
})
print(c)


//  클로져 고급
//  다양한 표현법이 있기 떄문에 알아보기 쉬운 정도로 사용하기

var result: Int = 0

// 후행 클로저
// method 를 쓰지 않고 소괄호 밖에 붙여서 만들면, 마지막 인자로 들어가는 Closure로 인식 함.
result = calculate(a: 10, b: 10) {(a: Int, b: Int) -> Int in
    return a + b
}
print(result)

//반환 타입을 생략
result = calculate(a: 20, b: 20, method: {(a: Int, b: Int) in
    return a + b
})

result = calculate(a: 20, b: 20 ) {(a: Int, b: Int) in
    return a + b
}
print(result)


// 인자 이름 단축 가능
result = calculate(a: 50, b: 20, method: {
    return $0 + $1
})
result = calculate(a: 50, b: 20) {
    return $0 + $1
}
print(result)

//암시적 반환 표현
result = calculate(a: 30, b: 20) {
    $0 + $1
}
print(result)

// 한 줄로 표현 가능
result = calculate(a: 100, b: 20) {$0 + $1}
result = calculate(a: 90, b: 20) {return $0 + $1}

print(result)

