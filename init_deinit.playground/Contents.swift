import Swift
// 인스턴스의 생성, 소멸
// 이니셜라이저, 디이니셜라이저

// 스위프트는 모든 프로퍼티에 유효한 값이 할당되어 있어야 한다
// 모든 저장 프로퍼티에 기본값을 할당해야 함
// 인스턴스가 생성될 때 그 안의 모든 프로퍼티는 정상적인 값들로 초기화 되어있어야 한다는 규칙
class PersonA{
    // 기본값을 할당하지 않으면 오류 발생
    // var name1 : String
    var name : String = "unknown"
    var age : Int = 0
    var nickName: String = "nick"
}

let jason : PersonA = PersonA()
jason.name = "jason"
jason.age = 30
jason.nickName = "j"

// 인스턴스의 생성과 동시에 초기화를 해주고 싶을 때
// -> 이니셜라이저 사용

class PersonB{
    var name : String
    var age : Int
    var nickName : String

    //이니셜라이저 - init 키워드
    init(name: String, age: Int , nickName: String){
        self.name = name
        self.age = age
        self.nickName = nickName
    }
}

let hana : PersonB = PersonB(name:"hana", age: 20, nickName: "h")


class PersonC{
    var name : String
    var age : Int
    //프로퍼티의 초기값이 꼭 필요하지는 않을 때 옵셔널 사용 가능
    var nickName : String?

    //이니셜라이저 - init 키워드
    init(name: String, age: Int , nickName: String){
        self.name = name
        self.age = age
        self.nickName = nickName
    }

    init(name: String, age: Int){
        self.name = name
        self.age = age
    }
}

let Tim : PersonC = PersonC(name: "Tim", age: 22)

class PersonD{
    var name : String
    var age : Int
    //프로퍼티의 초기값이 꼭 필요하지는 않을 때 옵셔널 사용 가능
    var nickName : String?

    init(name: String, age: Int){
        self.name = name
        self.age = age
    }
    // init 이 많아지는 경우
    // 자신의 이니셜라이저를 호출할 때
    // convenience 키워드 사용
    convenience init(name: String, age: Int , nickName: String){
        self.init(name: name, age: age)
        self.nickName = nickName
    }
}

//암시적 추출 옵셔널
//!를 사용하고 이는 인스턴스 사용에 꼭 필요하지만, 초기값을 할당하지 않고자 할 때 사용 (나중에 입력)
class Puppy{
    var name: String
    var owner: PersonC!
    
    init(name: String){
        self.name = name
    }
    func goOut(){
        print("\(name)가 주인 \(owner.name)와 산책합니다.")
    }
}

let happy : Puppy = Puppy(name: "happy")
//print(happy.owner)
//happy.goOut()
happy.owner = Tim
happy.goOut()

//실패가 가능한 이니셜라이저
//초기값이 잘못된 경우 인스턴스 생성에 실패할 수 있다.
//실패하면 nil을 반환함 -> 반환타입이 옵셔널
class PersonE{
    var name: String
    var age: Int
    var nickName: String?
    //init 뒤에 ? 추가
    init?(name: String, age: Int){
        if(0...120).contains(age) == false{
            return nil
        }
        if(name.count == 0){
            return nil
        }
        self.name = name
        self.age = age
    }
}

// 여기서도 PersonE 뒤에 ?를 붙여 옵셔널로 받아야한다
let john: PersonE? = PersonE(name: "john", age: 23)
let joker: PersonE? = PersonE(name: "joker", age: 123)
let batman: PersonE? = PersonE(name: "", age: 30)
print(joker?.name)
print(john)
print(joker)
print(batman)


// deinit 디이니셜라이저
// 인스턴스가 메모리에서 해제되는 시점에 해야할 일들을 구현
class PersonF{
    var name: String
    var pet: Puppy?
    var child: PersonC
    
    init(name: String, child: PersonC){
        self.name = name
        self.child = child
    }
    
    //키워드 deinit 사용 (클래스 타입에만 구현 가능)
    deinit{
        if let petName = pet?.name {
            print("\(name)가 \(child.name)에게 \(petName)를 인도 합니다.")
            self.pet?.owner = child
        }
    }
}
//여기서도 PersinF뒤에 ? 안써주면 nil로 해줄 수 없음
var donald : PersonF? = PersonF(name: "donald", child: Tim)
donald?.pet = happy
donald = nil

