// 익스텐션 extension

// 구조체 , 클래스, 열거형, 프로토콜 타입에 새로운 기능을 추가할 수 있는 기능
// 기능을 추가하려는 타입의 구현된 소스코드를 알지 못하거나 볼 수 없다고 해도,
// 타입만 알고 있다면 그 타입의 기능을 확장할 수 있음

// 익스텐션으로 추가 가능한 기능
// 연산 타입 프로퍼티 , 타입매서드, 인스턴스 매서드, 이니셜라이저, 서브스크립트, 중첩타입

// 기존에 존재하는 기능을 재정의 할 수는 없다.


import UIKit


/*
extension 확장할 타입 이름{
 }
 
 익스텐션은 기존에 존재하는 타입이 다른 프로토콜을 채택할 수 있도록 확장 가능
 extension 확장할 타입 이름 : 프로토콜1 , 프로토콜2, 프로토콜3 ...{
 }
 
*/


extension Int{
    var isEven: Bool{
        return self % 2 == 0
    }
    
    var isOdd: Bool{
        return self % 2 == 1
    }
}

print(1.isEven) //false
print(2.isEven) //true
print(1.isOdd)  //true
print(2.isOdd)  //false

var number = 3
print(number.isEven)    //false
print(number.isOdd)     //true
number = 2
print(number.isEven)    //true
print(number.isOdd)     //false

// 매서드 추가

extension Int{
    func multiply(by n: Int) -> Int{
        return self * n
    }
}

print(3.multiply(by: 2))    //6
print(4.multiply(by: 5))    //20
print(number.multiply(by: 3))


extension String{
    init(intTypeNumber: Int){
        self = "\(intTypeNumber)"
    }
    
    init(doubleTypeNumber: Double){
        self = "\(doubleTypeNumber)"
    }
}


let stringFromInt: String = String(intTypeNumber: 100)  // 100
let stringFromDouble: String = String(doubleTypeNumber: 100)    // 100.0

