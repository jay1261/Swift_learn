import UIKit


 //프로퍼티 감시자 : 프로퍼티 값이 변경될 때 원하는 동작을 수행할 수 있게 해줌

struct Money{
    
    //currentRate라는 프로퍼티가 변경될 때 원하는 동작 수행
    var currentRate: Double = 1100{
        //willSet은 바뀌기 직전에 한번 호출
        willSet(newRate){
            print("환률이 \(currentRate)에서 \(newRate)로 변경될 예정입니다.")
        }
        //didSet은 바뀌고 나서 한번 호출
        didSet(oldRate){
            print("환률이 \(oldRate)에서 \(currentRate)로 변경되었습니다.")
        }
    }
    
    var dollar: Double = 0{
        //willSet은 newValue
        willSet{
            print("\(dollar)에서 \(newValue)로 변경될 예정입니다.")
        }
        //didSet은 oldValue
        didSet{
            print("\(oldValue)에서 \(dollar)로 변경되었습니다.")
        }
    }
    
    //연산 프로퍼티 안에는 willset didset 불가능 하다.
    var won : Double{
        get{
            return dollar * currentRate
        }
        set{
            dollar = newValue / currentRate
        }
    }
    
}

var money : Money = Money()

print(money.currentRate)
money.currentRate = 1150

money.dollar = 10
print(money.won)

// 프로퍼티 감시자는 지역변수 전역변수에도 사용이 가능하다

var a: Int = 10{
    willSet {
        print("a:\(a) -> \(newValue)")
    }
    didSet{
        print("a: \(oldValue) -> \(a)")
    }
}

a = 11

