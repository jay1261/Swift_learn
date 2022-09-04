// 옵셔널 체이닝
// 옵셔널 요소 내부의 프로퍼티
// 또다시 옵셔널이 연속적으로 연결되는 경우
// 구조체나 클래스 안에 또다른 구조체 인스턴스가 들어올 수 있고 그안에 또다른 구조체 인스턴스가 오는 경우

import Swift

class Person{
    var name : String
    var job : String?
    var home : Apartment?
    
    init (name : String){
        self.name = name
    }
}

class Apartment{
    var buildingNumber: String
    var roomNumber: String
    var `guard`: Person?
    var owner: Person?
    
    init(dong: String, ho: String){
        buildingNumber = dong
        self.roomNumber = ho
    }
}

let Jay: Person? = Person(name: "Jay")
let apart: Apartment? = Apartment(dong: "101", ho: "202")
let superman: Person? = Person(name: "superman")
// 옵셔널 실행 후 결과값이 nil일 수 있으므로 결과 타입도 옵셔널
// 만약 우리집 경비원의 직업이 궁금하다면
// 옵셔널 체이닝을 사용하지 않는다면 아래처럼 복잡한 코드
func guardJob(owner: Person?){
    if let owner = owner {
        if let home = owner.home{
            if let `guard` = home.`guard` {
                if let guardJob = `guard`.job{
                    print("우리집 경비원의 직업은 \(guardJob)입니다")
                }
                else{
                    print("우리집 경비원은 직업이 없어요")
                }
            }
        }
    }
}

guardJob(owner: Jay)

print("안돼")

func guardJobWithOptionalChaining(owner: Person?){
    // 순서대로 owner확인하고 home 확인하고 ~~~ 중간에 하나라도 없으면 넘어감
    if let guardJob = owner?.home?.guard?.job{
        print("우리집 경비원의 직업은 \(guardJob)입니다")
    }
    else{
        print("우리집 경비원은 직업이 없어요")
    }
}

guardJobWithOptionalChaining(owner: Jay)


Jay?.home?.guard?.job
Jay?.home = apart

Jay?.home
Jay?.home?.guard

Jay?.home?.guard = superman
Jay?.home?.guard

Jay?.home?.guard?.name
Jay?.home?.guard?.job

Jay?.home?.guard?.job = "경비원"
guardJobWithOptionalChaining(owner: Jay)


// nil 병합 연산자
// 값이 nil 일 경우 뒤의 값으로 채워줌
// ?? 사용
var guardJob: String
guardJob = Jay?.home?.guard?.job ?? "슈퍼맨"   // 현재는 "경비원"이 할당되어있음
print(guardJob)

Jay?.home?.guard?.job = nil     //nil 로 할당
guardJob = Jay?.home?.guard?.job ?? "슈퍼맨"   // nil 이라면, ?? 뒤의 값으로 넣어줌
print(guardJob)
                    
