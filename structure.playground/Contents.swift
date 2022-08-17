import Swift
//구조체 선언
struct Sample {
    var mutableProperty: Int = 100      //  가변  인스턴스 프로퍼티
    let immutableProperty: Int = 100    //  불변
    
    static var typeProperty: Int = 100  //  타입 프로퍼티?
    
    //인스턴스 매서드
    func instanceMethod(){
        print("instance method")
    }
    
    //타입 매서드
    static func typeMethod(){
        print("type method")
    }
}

var mutable: Sample = Sample()
mutable.mutableProperty = 200
//mutable.immutableProperty = 200 // 바꿀 수 없음

let immutable: Sample = Sample()
//immutable.mutableProperty = 200 // 바꿀 수 없음

Sample.typeProperty = 300
Sample.typeMethod()
//mutable.typeProperty = 300

//학생 구조체 테스트
struct Student{
    var name: String = "unknown"
    var `class`: String = "Swift"
    
    static func selfIntroduce(){
        print("학생 타입입니다")
    }
    
    func selfIntroduce(){
        print("저는 \(`class`)반 \(name)입니다")
    }
     
}
    
Student.selfIntroduce()
var test: Student = Student()
test.selfIntroduce()
test.name = "Jay"
test.selfIntroduce()
	
