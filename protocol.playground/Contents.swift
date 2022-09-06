// 프로토콜

// 특정 역할을 수행하기 위한
// 매서드, 프로퍼티, 이니셜라이저 등의 요구사항을 정의한다.
// 쉽게말해 어떤 타입이나 이 기능이 꼭 필요하다고 강요하는 것과 같다

// 구조체, 클래스, 열거형은 프로토콜을 채택해서 (Adopted)
// 프로토콜의 요구사항을 실제로 구현할 수 있다.
// 어떤 프로토콜의 요구사항을 모두 따르는 타입은 그 프로토콜을 준수한다 (Conform) 고 표현한다
// 프로토콜의 요구사항을 충족하라면 프로토콜이 제시하는 기능을 모두 구현해야 한다.

// protocol 프로토콜 이름{}

import UIKit

protocol Talkable{
    // 프로퍼티 요구
    // 프로퍼티 요구는 항상 var 키워드로 사용
    // get 은 읽기만 가능해도 상관없다는 의미
    // get과 set을 모두 명시하면 읽기 쓰기 모두 가능한 프로퍼티여야 한다
    var topic: String {get set}
    var language: String {get}
    
    // 매서드 요구
    func talk()
    
    // 이니셜 라이저 요구
    init(topic: String, language: String)
}

// Person구조체는 Talkbale 프로토콜을 채택함
struct Person: Talkable{
    var topic: String
    let language: String
    
    // 저장 프로퍼티 요구는 연산 프로퍼티로 대체 가능
    // var language: String { return "한국어"}
//    var subject: String = ""
//    var topic: String{
//        set{
//            self.subject = newValue
//        }
//        ger {
//            return self.subject
//        }
//    }
    
    func talk(){
        print("\(topic)에 대해 \(language)로 말합니다")
    }
    
    init(topic: String, language: String){
        self.topic = topic
        self.language = language
    }
}


// 프로토콜은 다중 상속이 가능하다.

//protocol 프로토콜이름 : 부모 프로토콜 이름 목록{}

protocol Readable{
    func read()
}

protocol Writeable{
    func write()
}

protocol ReadSpeakable: Readable{
//    func read()   상속 받기 때문에 쓰지 않아도 요구 하고 있음
    func speak()
}

protocol ReadWriteSpeakable: Readable, Writeable{
//    func read()
//    func write()
    func speak()
}


struct SomeType: ReadWriteSpeakable{
    // 프로토콜 요구 중에 하나라도 구현하지 않으면 오류 발생
    func read(){
        print("Read")
    }
    
    func write() {
        print("write")
    }
    
    func speak() {
        print("Speak")
    }
}


// 클래스 상속과 프로토콜
// 클래스에서 상속과 프로토콜 채택을 동시에 하려면
// 상속받으려는 클래스를 먼저 명시하고 그 뒤에 채택할 프로토콜 목록 작성

class SuperClass: Readable{
    func read(){
        print("read")
    }
}
// : 상속할 클래스 , 프로토콜들
class SubClass: SuperClass, Writeable, ReadSpeakable{
    func write() {
        print("write")
    }
    
    func speak() {
        print("speak")
    }
}


// 인스턴스가 프로토콜을 준수하는지 확인할 수 있다.
// is as 연산자 사용
let sup: SuperClass = SuperClass()
let sub: SubClass = SubClass()

var someAny: Any = sup
someAny is Readable // true
someAny is ReadSpeakable // false

someAny = sub
someAny is Readable //true
someAny is ReadSpeakable    //true

someAny = sup

if let someReadable: Readable = someAny as? Readable{
    someReadable.read()
} // read

if let someReadSpeakable: ReadSpeakable = someAny as? ReadSpeakable{
    someReadSpeakable.speak()
}// 동작하지 않음

someAny = sub

if let someReadable: Readable = someAny as? Readable{
    someReadable.read()
} // read

if let someReadSpeakable: ReadSpeakable = someAny as? ReadSpeakable{
    someReadSpeakable.speak()
}// speak


// 명확하게 기능을 구현할 수 있음


