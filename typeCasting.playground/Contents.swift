// 타입캐스팅
// 스위프트의 타입 캐스팅은 인스턴스의 타입을 확인하는 용도로 사용
// is, as 를 사용


import UIKit

// 타입캐스팅이 아닌 새로 생성하는 코드
let someInt: Int = 10
let someDouble: Double = Double(someInt)    // 타입 캐스팅이 아니고, Double타입을 새로 생성하는 느낌

class Person{
    var name: String = ""
    func breath(){
        print("숨을 쉽니다")
    }
}

class Student : Person{
    var school: String = ""
    func goToSchool(){
        print("학교에 갑니다")
    }
}

class UniversityStudent:Student{
    var major: String = ""
    func goToMT(){
        print("멤버쉽 트레이닝")
    }
}

var jay: Person = Person();
var hana: Student = Student();
var jason: UniversityStudent = UniversityStudent();

var result: Bool
// type 체크 is 사용
result = jay is Person  // true
result = jay is Student // false
result = jay is UniversityStudent   // false

result = hana is Person     // true
result = hana is Student    // true
result = hana is UniversityStudent  //false

result = jason is Person    // true
result = jason is Student   // true
result = jason is UniversityStudent //true

// is 응용
if jay is UniversityStudent{
    print{"대학생입니다."}
}else if jay is Student{
    print("학생입니다.")
}else if jay is Person{
    print("사람입니다")
}
// switch 구문에서도 패턴 활용 가능
switch jason{
case is Person:
    print("jason은 사람입니다.")
case is Student:
    print("jason은 학생입니다.")
case is UniversityStudent:
    print("jason은 대학생입니다.")
}

// 업캐스팅
// as를 사용해서 부모 클래스의 인스턴스로 사용할 수 있도록 컴파일러에게 알려줌
var mike : Person = UniversityStudent() as Person
var jenny : Student = Student()
var jina : Any = Person() // as Any 생략 가능

// 다운 캐스팅
// as? as! 를 사용
// 자식 클래스의 인스턴스로 사용할 수 있도록 컴파일러에게 타입 정보를 전환 해줌

// 조건부 다운캐스팅
var optionalCasted: Student?

optionalCasted = mike as? UniversityStudent
optionalCasted = jenny as? UniversityStudent    // nil student 인스턴스 이기 때문에 캐스팅 불가
optionalCasted = jina as? UniversityStudent     // nil
optionalCasted = jina as? Student   // nil

// 강제 다운캐스팅
optionalCasted = mike as! UniversityStudent
//optionalCasted = jenny as! UniversityStudent    // 런타임 오류
//optionalCasted = jina as! UniversityStudent     // 런타임 오류
//optionalCasted = jina as! Student   // 런타임 오류

// 활용
func doSomethinWithSwitch(someone: Person){
    switch(someone){
    case is UniversityStudent:
        (someone as! UniversityStudent).goToMT()
    case is Student:
        (someone as! Student).goToSchool()
    case is Person:
        (someone as! Person).breath()
    }
}

doSomethinWithSwitch(someone: mike as Person)
doSomethinWithSwitch(someone: mike)
doSomethinWithSwitch(someone: jenny)

func doSomething(someone: Person){
    if let uniStudent = someone as? UniversityStudent{
        uniStudent.goToMT()
    }else if let student = someone as? Student{
        student.goToSchool()
    }else if let person = someone as? Person{
        person.breath()
    }
}

doSomething(someone: mike as Person)
doSomething(someone: mike)
doSomething(someone: jenny)
doSomething(someone: jay)
