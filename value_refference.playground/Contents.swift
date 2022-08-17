import Swift

//Class
//단일 상속, 참조 타입, 애플 프레임워크 큰 뼈대는 대부분 클래스로 구성 OOP 관점에서의 클래스

//Struct
//상속 불가, 값 타입, 스위프트 대부분 큰 뼈대는 구조체로 구성, C언어 구조체보다는 다양한 기능

//Enum
//다른 언어의 열거형과는 다름, 상속 불가, 값 타입, 하나의 데이터 타입이면서 케이스 하나하나 유의마한 값으로 취급

// --> 클래스만 유일하게 참조 타입, 상속 가능

// value -> 데이터를 전달할 때 값을 복사해서 전달
// reference -> 데이터를 전달할 때 값의 메모리 주소를 전달

struct ValueType{
    var property = 1
}

class ReferenceType{
    var property = 1
}

let firstStructInstance = ValueType()
var secondStructInstance = firstStructInstance
secondStructInstance.property = 2


print("first struct instance property : \(firstStructInstance.property)" )  // 1
print("second struct instance property : \(secondStructInstance.property)") // 2

let firstClassReference = ReferenceType()
var secondClassReference = firstClassReference
secondClassReference.property = 2

print("first class reference property : \(firstClassReference.property)" )  //2
print("second class reference property : \(secondClassReference.property)") //2

//구조체, 클래스 사용은 상황에 따라 선택해야 함

class SomeClass{
    var property: String = "Property"
}

var someClassInstance: SomeClass = SomeClass()

func someFunc(classInstance: SomeClass){
    var localVar: SomeClass = classInstance
    localVar.property = "ABC"
}

someFunc(classInstance: someClassInstance)
print(someClassInstance.property)
