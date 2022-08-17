import Swift

var intergers: Array<Int> = Array<Int>()
intergers.append(1)
intergers.append(100)

intergers.contains(100)
intergers.contains(9)

intergers.remove(at:0)
intergers.removeLast()
intergers.removeAll()

intergers.count

//intergers[0] //비어있는데 접근하려고 하면 오류

var doubles: Array<Double> = [Double]()
var strings: [String] = [String]()
var characters: [Character] = []

let immutableArray = [1,2,3]    // 변경 불가능한 배열

var anyDictionary: Dictionary<String, Any> = [String: Any]()
anyDictionary["someKey"] = "value"
anyDictionary["anotherKey"] = 100

anyDictionary

anyDictionary.removeValue(forKey: "someKey")
anyDictionary
anyDictionary["anotherKey"] = nil
anyDictionary

//Set
var intergerSet: Set<Int> = Set<Int>()
intergerSet.insert(1)
intergerSet.insert(100)
intergerSet.insert(80)
intergerSet

intergerSet.contains(1)
intergerSet.contains(2)

intergerSet.removeFirst()

//함수
func sum(a: Int , b: Int) -> Int{
    return (a + b)
}

sum(a: 2,b: 3)

func greeting(friend: String, me: String = "base"){
    print("Hello \(friend) I'm \(me))")
}

func greeting(to friend: String, from me: String){
    print("Hello \(friend) i'm\(me)")
}

func say(me: String, friend: String...){
    print("\(friend)")
}

say(me:"base", friend: "아","마","바")

//optional

//  값이 있을 수도, 없을 수도 있다 ==> nil의 가능성을 명시적으로 표현
//  Optional<Int> == Int? !

//  옵셔널 바인딩, 옵셔널 강제추출
//  바인딩은 닐체크 + 안전한 값 추출

func printName(_ name: String){
    print(name)
}

var myName: String! = "Jay"
var yourName: String? = nil

if let name: String = myName{
    printName(name)
}
else{
    print("myName == nil")
}

//printName(name)
yourName = "sm"
if let name = myName, let friend = yourName{
    print("\(name) and \(friend)")
}

//옵셔널 강제 추출
printName(_: myName!)   //  뒤에 !를 붙여주면 강제 추출 한다, 만약 값이 nil이라면 런타임 오류 발생

