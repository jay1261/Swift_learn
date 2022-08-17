// 구조체는 값 타입, 클래스는 참조타입

import Swift


class Sample{
    var mutableP: Int = 100
    let immutableP: Int = 100
    
    static var typeP: Int = 100
    
    func instanceMethod(){
        print("instance Method")
    }
    
    //재정의 불가 타입 매서드
    static func typeMethod(){
        print("type method")
    }
        
    //재정의 가능 타입 매서드
    class func classMethod(){
        print("type method - class")
    }
}
//클래스는 let 과 var 로 만들어진 인스턴스 모두가 뮤터블 변수 변경 가능.
var mutableReference: Sample = Sample()
mutableReference.mutableP = 200

let immutableReference: Sample = Sample()
immutableReference.mutableP = 200


//학생 클래스
class Student{
    var name: String = "unknown"
    var `class`: String = "swift"
    
    class func selfIntroduce(){
        print("학생 타입입니다")
    }
    
    func selfIntroduce(){
        print("\(`class`)반의 \(name)입니다.")
    }
}

var student1: Student = Student()
student1.selfIntroduce()
student1.name = "J"
student1.selfIntroduce()

Student.selfIntroduce()

