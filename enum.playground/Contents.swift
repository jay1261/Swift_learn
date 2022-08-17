import Swift

//enum은 타입이므로 대문자 카멜케이스로 정의
// 각 케이스 들은 소문자 카멜 케이스로 정의
//enum 이름{
//    case 이름1
//    case 이름2
//}


enum WeekDay{
    case mon
    case tue
    case wed
    case thu, fri, sat, sun
}

var day: WeekDay = WeekDay.mon
day = .tue
day = .fri
print(day)

switch day{
case .mon, .tue, .wed, .thu:
    print("평일")
case WeekDay.fri:
    print("불금")
case .sat, .sun:
    print("주말")
//    enum을 case에 다 써주면 default 생략 가능 하나라도 빈다면 default 넣어야함
}

enum Fruit: Int{
    case apple = 0
    case graph = 1
    case peach
// 자동으로 1씩 증가해서 넣어줌
}
print(Fruit.graph.rawValue)
print(Fruit.graph)


enum School: String{
    case elementary = "초등"
    case middle = "중등"
    case high = "고등"
    case university     //  케이스의 이름 그대로 들어감
 
}
print(School.middle.rawValue)   //중등
print(School.university.rawValue)   //university


let apple: Fruit? = Fruit(rawValue: 0)

if let orange: Fruit = Fruit(rawValue: 5){
    print("5에 해당하는 케이스는 \(orange)입니다")
}
else {
    print("5에 해당하는 케이스가 없습니다.")
}

enum Month{
    case dec, jan, feb
    case mar, apr, may
    case jun, jul, aug
    case sep, oct, nov
    
    func printMessage(){
        switch self{
        case .mar, .apr, .may:
            print("봄")
        case .jun, .jul, .aug:
            print("여름")
        case .sep, .oct, .nov:
            print("가을")
        case .dec, .jan, .feb:
            print("겨울")
        }
    }
}

Month.sep.printMessage();

