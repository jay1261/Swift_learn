// 오류 처리
// Error 프로토콜과 (주로) 열거형을 통해 오류를 표현

/*
 enum 오류 종류 이름: Error{
 case 종류1
 case 종류2
 case 종류3
 }
 */


import UIKit

enum VendingMachineError: Error{
    case invalidInput
    case insufficientFunds(moneyNeeded: Int)    // 돈이 모자라는데 얼마가 모자라는지
    case outOfStock
    
}

// 함수에서 발생한 오류 던지기
// 자판기 동작 중 발생한 오류
// throws 를 사용하여 오류를 내포하고 있는 함수임을 표시
class VendingMachin{
    let itemPrice: Int = 100
    var itemCount: Int = 5
    var deposited: Int = 0
    
    // 돈 받기 매서드
    func receiveMoney(_ money: Int) throws {
        //입력한 돈이 0 이하면 오류를 던짐
        guard money > 0
        else{
            throw VendingMachineError.invalidInput
        }
        // 오류가 없으면 정상 처리
        self.deposited += money
        print("\(money)원 받음")
    }
    
    // 물건 팔기 매서드
    func vend(numberOfItems numberOfItemsToVend: Int) throws -> String {
        // 원하는 아이템의 수량 입력이 잘못되면 오류를 던짐
        guard numberOfItemsToVend > 0
        else{
            throw VendingMachineError.invalidInput
        }
        
        // 구매하려는 수량보다 미리 넣어둔 돈이 적으면 오류를 던짐
        guard numberOfItemsToVend * itemPrice <= deposited
        else{
            let moneyNeeded: Int
            moneyNeeded = numberOfItemsToVend * itemPrice - deposited
            
            throw VendingMachineError.insufficientFunds(moneyNeeded: moneyNeeded)
        }
        
        // 구매하려는 수량이 보유량보다 많으면 오류 발생
        guard itemCount >= numberOfItemsToVend
        else{
            throw VendingMachineError.outOfStock
        }
        
        // 오류가 없으면 정상 처리
        let totalPrice = numberOfItemsToVend * itemPrice
        self.deposited -= totalPrice
        self.itemCount -= numberOfItemsToVend
        
        return "\(numberOfItemsToVend)개 제공함"
    }
}

// 자판기 인스턴스
let machine: VendingMachin = VendingMachin()
// return 값으로 string을 전달 받기 위한 변수
var result: String?
 
// 오류 발생 여지가 있는 throws 함수는 무조건 try를 사용 해야함
// try, try?, try! 3가지 존재
// do catch 구문 사용


do {
    try machine.receiveMoney(0) // 이 함수에서 오류가 발생했다면, throw
}
catch VendingMachineError.invalidInput{     // 오류를 캐치
    print("입력이 잘못되었습니다")
}
catch VendingMachineError.insufficientFunds(let moneyNeeded){
    print("\(moneyNeeded)원이 부족합니다.")
}
catch VendingMachineError.outOfStock{
    print("수량이 부족합니다.")
}   // 입력이 잘못되었습니다.


// switch 문으로도 활용 가능
do{
    try machine.receiveMoney(300)
}
catch /* (let error) 생략 가능*/{
    switch error{
    case VendingMachineError.invalidInput:
        print("입력이 잘못되었습니다.")
    case VendingMachineError.insufficientFunds(let moneyNeeded):
        print("\(moneyNeeded)원이 부족합니다.")
    case VendingMachineError.outOfStock:
        print("수량이 부족합니다.")
    default:
        print("알 수 없는 오류 \(error)")
    }
}


// 간결한 사용
do {
    result = try machine.vend(numberOfItems: 4)
}
catch{
    print(error)
}   // insufficientFunds(moneyNeeded: 300)
 

// do만 사용해서 오류 출력 안하기
//do{
//    result = try machine.vend(numberOfItems: 2)
//}

// try? 와 try!

// try?
// 별도의 오류 처리결과를 통보받지 않고 오류발생하면 nil로 돌려받음
// 정상 동작하면 옵셔널 타입으로 정상값 받음
result = try? machine.vend(numberOfItems: 2)    // 정상처리
print(result)   // Optional("2개 제공함)

result = try? machine.vend(numberOfItems: 2)    // 오류발생
print(result)   // nil



// try!
// 오류가 발생하지 않을거라는 강력한 확신을 가질 때
// try! 를 사용하면 정상동작 후에 바로 결과값을 돌려받음
// 만약 오류가 발생하면 앱 중지됨

result =  try! machine.vend(numberOfItems: 1)
result

//result =  try! machine.vend(numberOfItems: 1)
