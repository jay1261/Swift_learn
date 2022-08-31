import Swift

// 상속
//스위프트의 상속은 클래스, 프로토콜에서 가능
//스위프트에서는 다중상속은 지원하지않음 - 단일상속만 가능

//class 이름 : 상속받을 클래스 이름

class Person{
    var name: String = ""
    
    func selfIntroduce(){
        print("I'm \(name)")
    }
    
    //final 키워드를 사용해 재정의를 방지할 수 있다
    final func sayHello(){
        print("Hello!")
    }
    
    //타입 매서드
    //static 또한 재정의 불가
    static func typeMethod(){
        print("typeMethod - static")
    }
    
    //class 타입 매서드는 재정의 가능
    class func classMethod(){
        print("classMethod - class")
    }
    
    //Class 타입 매서드도 final 을 붙이면 재정의 불가능
    //static 과 똑같은 역할을 한다
    final class func finalClassMethod(){
        print("type method - final class")
    }
}
    
    
class Student : Person{
    //저장 프로퍼티 (변수)는 재정의 불가
//        var name: String = ""     상속받은 상태이므로 부모가 가진 변수와 똑같이 쓰면 오류
    var major: String = ""
    
    //부모의 selfIntroduce 재정의 - override 키워드 사용
    override func selfIntroduce() {
        print("I'm \(name) and my major is \(major)")
        //super.selfIntroduce()   // <-- 부모클래스의 셀프 인트로듀스 함수를 호출 가능
    }
    
    override class func classMethod() {
        print("overriden type method - class")
    }
    
    //static 재정의 불가
//        override static func typeMethod(){}
    
    //final 키워드 재정의 불가
//    override func sayHello(){}
//    override class func finalClassMethod(){}
    
}

let parent : Person = Person()
let child: Student = Student()

parent.name = "papa"
child.name = "son"
child.major = "Swift"

parent.selfIntroduce()
child.selfIntroduce()

Person.classMethod()
Person.typeMethod()
Person.finalClassMethod()

Student.classMethod()
Student.typeMethod()
Student.finalClassMethod()

