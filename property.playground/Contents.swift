import Swift
//프로퍼티
// 종류
// 저장 프로퍼티
// 연산 프로퍼티
// 인스턴스 프로퍼티
// 타입 프로퍼티

struct Student{
    // 저장 프로퍼티
    var name: String = ""
    var `class`: String = "Swift"
    var koreanAge : Int = 0;
    
    // 연산 프로퍼티
    var westernAge : Int{
        get {
            return koreanAge - 1;
        }
        set(inputvalue){
            koreanAge = inputvalue + 1;
        }
    }
    //타입 프로퍼티
    static var typeDescription : String = "학생"
    
    // 읽기 전용 연산 프로퍼티
    var selfIntfo : String{
        get {
            return "I'm \(name) of \(`class`) class"
        }
    }
}

var student : Student = Student()

print(student.selfIntfo)

student.koreanAge = 10
print("Koeran Age : \(student.koreanAge), Western Age \(student.westernAge)")
student.westernAge = 10
print("Koeran Age : \(student.koreanAge), Western Age \(student.westernAge)")

 


class Money{
    var currentRate : Double = 1100
    var dollar : Double = 0
    var won : Double{
        get{
            return dollar * currentRate
        }
        set{
            dollar =  newValue / currentRate
        }
    }
}

var money: Money = Money()


money.dollar = 10
print(money.won)

money.won = 10000
print(money.won)

// 연산 프로퍼티는 지역변수, 전역변수에도 사용 가능
var a: Int = 100
var b: Int = 200
var sum: Int{
    get{    // get 생략 가능
        return a+b
    }
}
print(sum)  // 300
