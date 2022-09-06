// assert함수  guard구문
// 애플리케이션이 동작 도중에 생성하는 다양한
// 결과값을 동적으로 확인하고 안전하게 처리할 수 있게 해줌

// assertion
// assert(_:_:file:line:) 함수를 사용
// assert 함수는 디버깅 모드에서만 동작함
// 배포하는 앱에서는 제외됨
// 주로 디버깅 중 조건의 검증을 위해 사용


import UIKit


var someInt: Int = 0
// 조건이 참이면 그냥 지나감, 참이 아니면 두번째 인자를 출력하고
// 동작을 중지시킴
assert(someInt == 0, "someInt != 0")

someInt = 1
//assert(someInt == 0, "someInt != 0")'


// 매개변수로 전달되는 전달 인자를 검사하는데 많이 사용됨
func funcWithAssert(age: Int?){
    assert(age != nil, "age == nil")
    assert((age! >= 0) && (age! <= 130), "나이값 입력이 잘못되었습니다")
    print("당신의 나이는 \(age!)세 입니다.")
}

funcWithAssert(age: 50)
//funcWithAssert(age: -1)
//funcWithAssert(age: nil)



// guard 는 디버깅 모드 뿐만 아니라 어떤 조건에서도 동작한다.
// 잘못된 값이 전달될 시 특정 실행 구문을 빠르게 종료한다 early exit
// guard 의 else 블럭 내부에는 특정 코드블럭을 종료하는 지시어 (return , break 등)이 꼭 있어야 한다.
// 타입캐스팅, 옵셔널과 자주 사용
// 그 외 단순한 조건 판단 후 빠르게 종료할 때도 용이함.

func funcWithGuard(age: Int?){
    guard let unwrappedAge = age,   // 옵셔널 바인딩 먼저 실행 age가 nil이라면 실행 안됨
          unwrappedAge < 130,   // 조건1 이 false라면 종료
          unwrappedAge >= 0     // 조건2 이 false라면 종료
    else{   //else 항상 있어야 함
        print("나이값 입력이 잘못되었습니다")
        return
    }
    
    print("당신의 나이는 \(unwrappedAge)세 입니다.")
}

funcWithGuard(age: 140)
funcWithGuard(age: nil)
funcWithGuard(age: -1)
funcWithGuard(age: 10)


// 반복문 안에서도 사용 가능
var count = 1
while true{
    guard count < 3 // 3 미만이 아니라면 종료
    else{
        break
    }
    print(count)
    count += 1
}


// 딕셔너리를 받아왔을 때 많이 활용 가능
func someFunction(info: [String: Any]){
    guard let name = info["name"] as? String    // name 이라는 키의 값이 string인지 캐스팅 해봄
    else{
        return
    }
    
    guard let age = info["age"] as? Int     // age 라는 키의 값이 int인지 캐스팅되는지 확인
    else{
        return
    }
    
    print("\(name) : \(age)")
}

someFunction(info: ["name": "jenny", "age" : "10"]) // 실행 안됨 (age의 값이 int가 아님)
someFunction(info: ["name": "mike"])    //실행 안됨 (age 가 없음)
someFunction(info: ["name": "jay", "age" : 10]) // jay : 10 프린트


