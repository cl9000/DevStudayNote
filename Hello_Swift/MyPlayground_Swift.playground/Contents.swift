//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

print("hellow world");

var myVariable = 24;
myVariable = 05;
let myConstant = 24;
let impicitInteger = 70;
let implicitDouble = 70.0;
let explicitDouble:Double = 70;

let label = "this width is";
let width = 94;
let widthLable = label + String(width);

let apples = 3;
let oranges = 5;
let appleSummary = "I have \(apples) aa";
let fruitSummary = "I have \(apples+oranges) ad";

var shoppingList = ["catfish", "water", "blue"];
shoppingList[1] = "bottle of water";

var occupations = [
                    "Malcoml":"Captain",
                    "Kaylee" :"Mechanic",
                    ]
occupations["Jayne"] = "Public Relations"

shoppingList = []
occupations = [:]

let indidualScores = [75, 43, 102, 87, 99]
var teamScore = 0
for score in indidualScores {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
print(teamScore)

var optionalString:String? = "Hellow"
print(optionalString == nil)

var optionalName:String? = "John Applesee"
var greeting = "Hellow!"
if let name = optionalName {
    greeting = "Hello, \(name)"
}

let vegetable = "red pepper"
switch vegetable {
    case "celery":
        let vegetableComment = "Add some rais"
    case "cucumber", "watercress":
        let vergetableComment = "that would make a good"
    case let x where x.hasSuffix("pepper"):
        let vergetableComment = "Is it a spicy \(x)?"
    default:
        let vergetableComment = "everything tastes go"
}

let interestingNumber = [
                        "Prime": [2,3,5,7,11,122],
                        "Fibonacci": [1,1,1,2,3,4],
                        "Square":[1,2,3,4,55],
]
var largest = 0
for (kind, numbers) in interestingNumber {
    for number in numbers {
        if number > largest {
            largest = number
        }
    }
}
print(largest)

var n = 2
while n < 100 {
    n = n * 2
}
print(n)

var m = 2
repeat {
    m = m * 2
}while m < 100
print(m)

var firstForLoop = 0
for i in 0..<4 {
    firstForLoop += i
}
print(firstForLoop)

var secondForLoop = 0
for var i = 0; i < 4; i+=1 {
    secondForLoop += i
}
print(secondForLoop)

var firstForLoop1 = 0
for i in 0...4 {//包含上界
    firstForLoop1 += i
}
print(firstForLoop1)

func greet(name:String, day:String, food:String) -> String {
    return "Hellow \(name), today is \(day).eat \(food)"
}
greet("Jon", day: "周四", food: "茶叶蛋")

func calculateStatistics(scores:[Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    for score in scores {
        if score > max {
            max = score
        }else {
            min = score
        }
        sum += score
    }
    return (min, max, sum)
}
let statistics = calculateStatistics([5, 3, 100, 3, 10])
print(statistics.sum)
print(statistics.min)

func sumOf(numbers: Int...) -> Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum
}
sumOf()
sumOf(42, 597, 12)

func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}
returnFifteen()

//h函数可以作为名义函数的返回值
func makeIncrementer() -> (Int -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
increment(7)

//函数可以当做参数传入另一个函数
func hasAnyMatches(list: [Int], condition: Int -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}
func lessThenTen(number: Int) -> Bool {
    return number < 10
}
var numbers = [20, 19, 7, 12]
hasAnyMatches(numbers, condition: lessThenTen)
/**
 *  函数实际上是一种特殊的闭包：它是一段能之后被调取的代码。闭包中的代码能访问锁建作用与中能得到的变量和函数，即使闭包是在一个不同的作用域被执行的，你可以使用{}来创建一个匿名闭包。使用in将参数和返回值类型声明与闭包函数体进行分离
 */

numbers.map({
    (number: Int) -> Int in
    let result = 3 * number
    return result
})

let mappedNumbers = numbers.map({
    number in 3 * number
})
print(mappedNumbers)

//let sortedNumbers = sorted(numbers){ $0 > $1 }
//print(sortedNumbers)

//对象和类
class Shape {
    var numberOfSides = 0
    let number2 = 2
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}
var shape = Shape()
shape.numberOfSides = 8
var shapeDescription = shape.simpleDescription()

class NamedShape {
    var numberOfSides: Int = 0
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

//class Square: NamedShape {
//    var sideLength: Double
//    
//}

enum Rank: Int {
    case Ace = 1
    case Two, Three, Four, Five, Six, Seven, Eight, Nin, Ten
    case Jack, Queen, King
    func simpDescription() -> String {
        switch self {
        case .Ace:
            return "ace"
        case .Jack:
            return "jack"
        case .Queen:
            return "queen"
        case .King:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}
let ace = Rank.Ace
let aceRawValue = ace.rawValue

//if let convertedRank = Rank(rawValue: 3) {
//    let threeDescription = convertedRank.simpleDescription()
//}
enum Suit {
    case Spades, Hearts, Diamonds, Clubs
    func simpleDescription() -> String {
        switch self {
        case .Spades:
            return "spandes"
        case .Hearts:
            return "hearts"
        case .Diamonds:
            return "dianmonds"
        case .Clubs:
            return "clubs"
        }
    }
}
let hearts = Suit.Diamonds
let heartsDescription = hearts.simpleDescription()

struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpDescription()) of \(suit.simpleDescription())"
    }
}
let threeOfSpandes = Card(rank: .Three, suit: .Spades)
let threeOfSpandesDescription = threeOfSpandes.simpleDescription()

enum ServerResponse {
    case Result(String, String)
    case Error(String)
    case OK(String)
}
let success = ServerResponse.Result("6:00 am", "8:09 pm")
let failure = ServerResponse.Error("Out of cheese")
let ok_ok = ServerResponse.OK("You are OK")
var temp = failure
switch temp {
    case let .Result(sunrise, sunset):
            let severResponse = "sunrise is at \(sunrise) and sunset at \(sunset)."
    case let .Error(error):
            let serverResponse = "Failure...\(error)"
    case let .OK(ok_ok):
            let serverResponse = "hahaha...\(ok_ok)"
}

/**
 *  协议和扩展
 *  使用protocol来声明一个协议
 */
protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}
//类、枚举和结构体都可以实现协议
class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class."
    var anotherProperty: Int = 69105
    func adjust() {
        simpleDescription += "Now 100% adjusted."
    }
}
var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription

struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple structure"
    mutating func adjust() {
        simpleDescription += "(adjusted)"
    }
}
var b = SimpleStructure()
b.adjust()
let bDescripton = b.simpleDescription

enum SimpleEnum {
    case One, Two
}
let one = SimpleEnum.One
switch one {
    case .One():
        let SimpleEnum = ""
    case .Two():
        let SimpleEnum = ""
}


//声明SimpleSructure时候mutating关键字用来标记一个会修改结构体的方法
//SimpleClass的声明不需要标记任何方法因为类中的方法经常会修改类
//使用extension来为现有的类型添加功能，比如新的方法和参数。你可以使用扩展在别处修改定义，甚至是从外部库或者框架引入的一个类型，似的这个类型遵循某个协议
extension Int: ExampleProtocol  {
    var simpleDescription: String {
        return "The number \(self)"
    }
    mutating func adjust() {
        self += 42
    }
}
print(7.simpleDescription)

let protocolValue: ExampleProtocol = a
protocolValue.simpleDescription
//即使protocalValue变量运行时的类型是simpleClass，编译器会把它的类型当做ExampleProtocol。这表示你不能调用类在他实现的协议之外是实现方法或者属性。

//泛型
//在尖括里写一个名字来创建一个泛型函数或者类型。
func repeatItem<Item>(item: Item, numberOfTimes: Int) -> [Item] {
    var result = [Item]()
    for _ in 0..<numberOfTimes {
        result.append(item)
    }
    return result
}
repeatItem("knock", numberOfTimes: 4)


enum OptionalValue<T> {
    case None
    case Some(T)
}
var possibleInteger: OptionalValue<Int> = .None
possibleInteger = .Some(100)

var x = 0.0, y = 0.0, z = 0.0

let minValue = UInt8.min
let maxValue = UInt8.max

let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)
var serverResponseCode: Int? = 404
serverResponseCode = nil
var suveyAnswer: String?
if convertedNumber != nil {
    print("convertedNumber contains some integer value.")
}

//if let actualNumber = possibleNumber.toInt() {
//    print("\(possibleNumber) has an integer value of \(actualNumber)")
//}else {
//    print("\(possibleNumber) could not be convertd to an intger")
//}
//常量和变量必须在使用前声明， 用let来声明常量，var来声明变量
let maximumNumberOfLoginAttempts = 10
var currentLoginAttempt = 0
var welcomeMessage: String
//声明中的冒号代表着“是...类型”，所以这行代码可以被理解为：
//'声明一个类型为String，名字为welcomeMessage的变量。'
//’类型为String‘的意思是“可以存储任意String类型的值。”
//welcomeMessage变量现在可以被设置成任意字符串：
welcomeMessage = "Hello"
var red, green, blue: Double
let π = 3.14159
let 你好 = "你好 world"
//let  = "dog"

var frinendlyWelcome = "Hello!"
frinendlyWelcome = "BobBob"

let languageName = "Swift"
//languageName = "Swift++"// 编译报错，不能再改变

let decimalInteger = 17
let binaryInteger = 0b10001 //二进制
let octalInteger = 0o21 //八进制
let hexadecimalInteger = 0x11 //十六进制

let decimalDouble = 12.1875
let exponentDouble = 1.21875e1
let hexadecimalDouble = 0xC.3p0

let padedDouble = 000123.456
let oneMillion = 1_000_000
let justOverOneMillion = 1_000_000.000_000_1

//let cannotBenegative: UInt8 = -1 //UInt8 类型不能存储负数，故报错
//let tooBig: Int8 = Int8.max + 1 //Int8 类型不能存储超过最大值得数，所以报错

let twoThousand: UInt16 = 2_000
let one1: UInt8 = 1
let twoThousandAndOne = twoThousand + UInt16(one1)

let three = 3
let pointOneFourOneFiveNine = 0.14159
let pi = Double(three) + pointOneFourOneFiveNine //pi 等于3.14159 所以被推测为Double类型

let intergerPi = Int(pi)

typealias AudioSample = UInt16
var maxAmplitudeFound = AudioSample.min

let orangesAreOrange = true
let turnipsAreDelicious = false
if turnipsAreDelicious {
    print("12345")
}else {
    print("45678")
}

let http404Error = (404, "Not Found")
let (statusCode, statusMessage) = http404Error
print("The status code is \(statusCode)")
print("The status code is \(statusMessage)")

let (justTheStatusCode,  _) = http404Error
print("The status code is \(justTheStatusCode)")

print("The status code is \(http404Error.0)")
print("The status code is \(http404Error.1)")

let http200Status = (statusCode: 200, description: "OK")
print("The status code is \(http200Status)")
print("The status code is \(http200Status.description)")

let possibleNumber2 = "123"
let convertedNumber2 = Int(possibleNumber)

func canThrowAnErrow() throws {
    
}
func makeASandwich() throws {
    
}
do {
    try makeASandwich()
    
}

//let possibleString: String？ = "An optional string."
//let forcedString: possibleString!
//
//let possibleString:String! = "An "
//let implicitString:String = assumedString


let age = -3
//assert(age >= 0, "A person's age cannot be less than zero")
//assert(age >= 0)

let b2 = 10
var a2 = 5
a2 = b2
let (x2, y2) = (1, 2)
"hello"+" ,world"

//空合并运算符
//a != nil ? a! : b
let defaultColorName = "red"
var userDefinedColorName: String? //默认值为nil
var colorNameToUse = userDefinedColorName ?? defaultColorName
//userDefinedColorName的值为空， 所以colorNameToUse的值为‘red’

userDefinedColorName = "green"
colorNameToUse = userDefinedColorName ?? defaultColorName
//userDefinedColorName非空，因此colorNameToUser的值为绿色

//区间运算符
for index in 1...5 {
    print("\(index)*5 = \(index * 5)")
}
let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count
for i in 0..<count {
    print("第 \(i+1)个人叫 \(names[i])")
}

let enteredDoorCode = true
let passedRetinaScan = false
if enteredDoorCode || passedRetinaScan {
    print("Welcome")
}else {
    print("ACCESS DENIED")
}

var emptyString = ""
var anotherEmptyString = String()//初始化方法   两个字符串均为空并等价

if emptyString.isEmpty {
    print("Nothing to see here")
}

var varialeString = "House"
varialeString += "  and carriage"
let constantString = "Highlander"
//constantString += "  and another Highlander"//常量不可以被修改

for character in "Dog! s".characters {
    print(character)
}

let exclamationMark: Character = "!"

let catCharacters: [Character] = ["C", "a", "t", "!", " ", "6"]
let catString = String(catCharacters)
print(catString)

let string1 = "123"
let stirng2 = "456"
var welcome = string1 + stirng2

var instruction = "look over"
instruction += stirng2

let exclamationMark2: Character = "!"
welcome.append(exclamationMark)
let multipiler = 3
let message = "\(multipiler) times 2.5 is \(Double(multipiler)*2.5)"

//Unicode标量（Unicode Scalars）
//Swift 的String 类型是基于Unicode 标量建立的。Unicode标量是对应字符的唯一21位数字或者修饰符，例如 U+0061 表示小写的拉丁字母（LATIN SAMLL LETTER A)("a"), U+1F425表示小鸡表情（FRONT-FACING BABY CHICK）("🐥")
/**
 *  注意： Unicode码位(code poing)的范围是U+0000 到U+D7FF或者U+E000到U+10FFFF。Unicode标量不包括Unicode代理项（surrogate pair）码位，其范围是 U+D8000到U+DFFF。
 */
/**
 *  注意： 不是所有的21位Unicode标量都代表一个字符，因为有一些标量是保留给未来分配的。已经代表一个典型字符的标量都有自己的名字，例如上面例子中的LATIN SAMLL LETTER A和FRONT-FACING BABY CHICK。
 */
//字符串字面量可以包含以下特殊字符：
//    1、转义字符  \0（空字符)、 \\(反斜线)、 \t(水平制表符)、 \n(换行符)、 \r(回车符)、 \"(双引号)、 \'(单引号)。
//    2、Unicode 标量，写成 \u{n}(u为小写)，其中n为任意一到八位十六进制数且可用Unicode位码
let wiseWords = "\"Imagination is more important than knowledge\" -Einstein"
let dollarSign = "\u{24}"
let blackHeart = "\u{2665}"
let sparkLingHeart = "\u{1F496}"
let hahaTest = "\u{1234F}"

let eAcute: Character = "\u{E9}"
let combinedEAcute: Character = "\u{65}\u{302}"

let enclosedEScute: Character = "\u{E9}\u{20DD}"

let regionalIndicatorRorUS:Character = "\u{1F1FA}\u{1F1F8}"
let regionalIndicatorRorC:Character = "\u{1F1E8}\u{1F1F3}"
let regionalIndicatorRorc:Character = "\u{1F222}"


let precomposed:Character = "\u{D55C}"
let decomposed:Character = "\u{1112}\u{1161}\u{11AB}"

let unusualMenagerie = "Koala   , Snail    , Penguin    , Dromedary   "
print("unusualMenageris has \(unusualMenagerie.characters.count) characters")

var word = "cafe"
print("the number of characters in \(word) is \(word.characters.count)")
word += "\u{301}"
print("the number of characters in \(word) is \(word.characters.count)")

let greenting3 = "Guten Tag"
greenting3[greenting3.startIndex]
greenting3[greenting3.endIndex.predecessor()]
greenting3[greenting3.startIndex.successor()]
//let index = advance(greenting3.startIndex, 7)
//greenting3[index]
//greenting3[greenting3.endIndex]
//greenting3[greenting3.startIndex]

for index in greenting3.characters.indices {
//    print("\(greenting3[index]) ", appendNewline:false)
}

var welcome3 = "hello"
welcome3.insert("!", atIndex: welcome3.endIndex)
//welcome3.splice("there ".characters, atIndex:welcome3.endIndex.predecessor())

welcome3.removeAtIndex(welcome3.endIndex.predecessor())

//let range = advance(welcome3.endIndex, -6)..<welcome3.endIndex
//welcome3.removeRange(range)

let quotation = "We're a lot alike, you and I."
let sameQuotation = "We're a lot alike, you and I."
if quotation == sameQuotation {
    print("These two string are considered equal.")
}

let eAcuteQuestion = "\u{E9}"
let combinedEAcuteQuestion = "\u{65}\u{301}"
if eAcuteQuestion == combinedEAcuteQuestion {
    print("considered equal")
}

let latinCapitalLetterA: Character = "\u{41}"
let cyrillicCapitaLetterA: Character = "\u{0410}"
if latinCapitalLetterA != cyrillicCapitaLetterA {
    print("not equivalent")
}

let romeoAndJuliet = [
                        "Act 1 Scene 1: Verona, A public place",
                        "Act 1 Scene 1: Verona, A public pla"
                        ]
var act1SceneCount = 0
for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 1 "){
    ++act1SceneCount
    }
    print(scene)
}

var mansionCount = 0
var cellCount = 0
for scene in romeoAndJuliet {
    if scene.hasSuffix("A public place") {
        ++mansionCount
    } else if scene.hasSuffix("pla"){
        ++cellCount
    }
}
print("\(mansionCount) mansion scene; \(cellCount) cell scene")

let dogString = "Dog!! "
for codeUnit in dogString.utf8 {
//    print("\(codeUnit) ", appendNewline:false)
}
print("")

for scalar in dogString.unicodeScalars {
//    print("\(scalar.value)", appendNewline:false)
}
print("")

for scalar in dogString.unicodeScalars {
    print("\(scalar)")
}

//数组 
var someInts = [Int]()
print("someInt is of type [Int] with \(someInts.count) items.")

someInts.append(3)
someInts = []

var threeDoubles = [Double](count: 3, repeatedValue:0.0)

var anotherThreeDoubles = Array(count: 3, repeatedValue:2.5)
var sixDoubles = threeDoubles + anotherThreeDoubles

var shoppingList2: [String] = ["eggs", "Milk"]
var shoppingList3 = ["eggs", "Milk"]

//可以使用append方法在数组后面添加新的数据 或者使用加法赋值运算符（+=）
shoppingList2.append("Flour")
shoppingList2 += ["Baking Powder"]
shoppingList2 += ["Chocolate Spread", "Cheese", "Butter"]

var firstItem = shoppingList2[0]
shoppingList2[0] = "Six eggs"
shoppingList2[4...6] = ["Bananas", "Apples"]
shoppingList2
shoppingList2.insert("Maple Syruo", atIndex: 0)

let mapleSyrup = shoppingList2.removeAtIndex(0)
let apples2 = shoppingList2.removeLast()
for item in shoppingList2 {
    print(item)
}

for (index, value) in shoppingList2.enumerate() {
    print("Item \(String(index + 1)): \(value)")
}
//集合
var letters = Set<Character>()
print("letter is of type Set<Character> with \(letters.count) items.")
letters.insert("a")
letters = []

var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]

var favoriteGenres2: Set = ["Rock", "Classical", "Hip hop"]

favoriteGenres2.insert("Jazz")

if let removedGenre = favoriteGenres2.remove("Rock") {
    print("\(removedGenre)? I'm over it.")
} else {
    print("I never much cared for that.")
}

if favoriteGenres2.contains("Funk") {
    print("I get up on the good foot")
} else {
    print("It's too funky in here.")
}
for genre in favoriteGenres2 {
    print("\(genre)")
}
for genre in favoriteGenres2.sort() {
    print("\(genre)")
}

var btn = UIButton()
btn.frame = CGRectMake(0, 0, 100, 100)
btn.backgroundColor = UIColor.redColor()
btn.layer.cornerRadius = 10;

btn

let oddDigits: Set = [1,3,5,7,9]
let evenDigits: Set = [0,2,4,6,8]
let singleDigitPrimeNumbers: Set = [2,3,5,7]
oddDigits.union(evenDigits).sort()
oddDigits.subtract(singleDigitPrimeNumbers).sort()
oddDigits
oddDigits.exclusiveOr(singleDigitPrimeNumbers).sort()

//字典
var nameOfIntegers = [Int:String]()
nameOfIntegers[16] = "sixteen"
nameOfIntegers = [:]

var airports: [String: String] = ["YYZ":"Toronto", "DUB": "DUblin"]
airports["LHR"] = "London"

if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
    print("The old value for DUB was \(oldValue).")
}
if let airportName = airports["DUB"] {
    print("The name of the airports is \(airportName)")
}else {
    print("that airport is not in the airports dictionary")
}
airports["APL"] = "Apple Internation"
airports["APL"] = nil

if let removedValue = airports.removeValueForKey("DUB") {
    print("The removed airports name is \(removedValue)")
} else {
    print("The airports dictionary does not contain a value for DUB.")
}
for (airportCode, airportName) in airports {
    print("\(airportCode):\(airportName)")
}
for airportCode in airports.keys {
    print("airportCode:\(airportCode)")
}
for airportName in airports.values {
    print("airportName:\(airportName)")
}
let airportCodes = Array(airports.keys)
let airportNames = Array(airports.values)

for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}
let base = 2
let power = 10
var answer = 1
for _ in 1...power {
  answer *= base
}
print("\(base) to the power of \(power) is \(answer)")

let names2 = ["Anna", "Alex", "Brian", "Jack"]
for name in names2 {
    print("Hello, \(name)")
}
let numberOfLegs = ["spider":8, "ant": 6, "cat": 4]
for (animalName, legCount) in numberOfLegs {
    print("\(animalName)s have \(legCount) legs")
}
for var index = 0; index < 3; ++index {
    print("index is \(index)")
}

let grade = "B"
 switch grade {
     case "A": break
    
     case "B":
             print("良好等级")
     default:
             print("未知等级")
     }

let finalSquare = 25
var board = [Int](count: finalSquare + 1, repeatedValue: 0)

var square = 0
var diceRoll = 0
while square < finalSquare {
    if ++diceRoll == 7 { diceRoll = 1 }
    square += diceRoll
    if square < board.count {
        square += board[square]
    }
}
print("Game Over")

//repeat {
//    square += board[square]
//    if ++diceRoll == 7 { diceRoll = 1 }
//    square += diceRoll
//} while square < finalSquare
//    print("Game Over!")

let someCharacter: Character = "e"
switch someCharacter {
    case "a", "e", "i", "o", "u":
        print("\(someCharacter) is a vawel")
    case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "w","x", "y", "z":
        print("\(someCharacter) is consonant")
    default:
        print("\(someCharacter) is not a vowel or consonant")
}

let approximateCount = 62
let countedThings = "moos orbiting Saturn"
var naturalCount: String
switch approximateCount {
case 0:
    naturalCount = "no"
case 1..<5:
    naturalCount = "a few"
case 5..<12:
    naturalCount = "several"
case 12..<100:
    naturalCount = "dozens of"
case 100..<1000:
    naturalCount = "hundreds of"
default:
    naturalCount = "many"
}
print("There are \(naturalCount) \(countedThings).")

let somePoint = (1, 1)
switch somePoint {
case (0, 0):
    print("(0, 0) is at the origin")
case (_, 0):
    print("(\(somePoint.0), 0) is on the x-axis")
case (0, _):
    print("(0,\(somePoint.1)) is on the y-axis")
case (-2...2, -2...2):
    print("(\(somePoint.0), \(somePoint.1)) is inside the box")
default:
    print("(\(somePoint.0), \(somePoint.1)) is outside of the box")
}

let anotherPoint = (2, 0)
switch anotherPoint {
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
case (0, let y):
    print("on the y-axis with an y value of \(y)")
case let (x, y):
    print("somewhere else at (\(x), \(y))")
}

let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y :
    print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y :
    print("(\(x), \(y)) is on the line x == -y")
case let (x, y):
    print("(\(x), \(y)) is just some aribitrary point")
}

let puzzleInput = "great minds think alike"
var puzzleOutput = ""
//for Character in puzzleInput {
//    switch Character {
//    case "a", "e", "i", "o", "u", " ":
//        continue
//    default:
//        puzzleOutput.append(Character)
//    }
//}
print(puzzleOutput)

let numberSysbol: Character = "三"
var possibleIntegerValue: Int?
switch numberSysbol {
    case "1", "¡", "一", "ª":
    possibleIntegerValue = 1
    case "2", "™", "二", "º":
    possibleIntegerValue = 2
    case "3", "£", "三", "ª":
    possibleIntegerValue = 3
default:
    break
}

//提前退出
//像if语句样，guard的执行取决于一个表达式的布尔值。我们可以使用guard语句来要求条件为真时，以执行guard语句的代码
func greet(person: [String: String]) {
    guard let name = person["name"] else {
        return
    }
    print("Hello \(name)")
    guard let location = person["location"] else {
        print("I hope the weather is nice near you.")
        return
    }
    print("I hope the weather is nice in \(location).")
}
greet(["name":"John"])
greet(["name":"Jane", "location":"Cupertion"])

//检测API是否可用
//Swift有内置支持去检查接口的可用性，这可以确保我们不会不小心地使用对于当前部署目标不可用的API
//编译器使用SDK中的可用信息来验证在我们在可用部署目标指定项目的代码中所有的API调用。如果我们尝试使用一个不可用的API，Swift会在编译期报错。
//我们使用一个可用性条件在一个if或guard语句中去有条件的执行一段代码，这取决于我们想要使用的API是否咋运行时是可用的。编译器使用从可用性条件语句中获取的信心，这时他会去验证咋代码块中调用的API是否都可用
if #available(iOS 9, OSX 10.10, *) {
    //在 iOS 使用 iOS 9 APIS，并且在 OS X 使用 OS X v10.10 APIs
} else{
    //会滚至早前的 iOS and OS X 的API
}
//以上可用性条件指定在iOS， if段的代码仅仅在iOS9及更高可运行；在OS X，仅在OS v10.10及更高可运行。最后一个参数， *，是必须的并且指定在任何其他平台上，if段的代码在最小可用部署指定项目中执行。
//if #available('platform name' 'version', '...', *) {
//    'statements to execute if the APIs are available'
//} else {
//    'fallback statements to execute if the APIs are unavailable'
//}

//函数
//函数是用来完成特定任务的独立代码块。

func sayHello(personName:String) -> String {
    let greeting = "Hello, " + personName + "!"
    return greeting
}
print(sayHello("Anna"))

func halfOpenRangeLength(start: Int, end: Int) -> Int {
    return end - start
}
print(halfOpenRangeLength(1, end: 10))

func sayHelloWorld() -> String {
    return "HelloWorld"
}
print(sayHelloWorld())

func sayHello(personName: String, alreadyGreeted: Bool) -> String {
    if  alreadyGreeted {
        return sayHello(personName)
    } else {
        return sayHello(personName)
    }
}
print(sayHello("Tim", alreadyGreeted: true))

func sayGoodbye(personName: String) {
    print("Goodbye, \(personName)!!!")
}
sayGoodbye("Dave")

func printAndcount(stringToPrint: String) -> Int {
    print(stringToPrint)
    return stringToPrint.characters.count
}
printAndcount("Hello, world")
func printWithoutCounting(stringToPrint: String) {
    printAndcount(stringToPrint)
}
printWithoutCounting("Hello, world")

func minMax(array: [Int]) -> (min:Int, max: Int)? {
    if array.isEmpty{ return nil }
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}
let bounds = minMax([8, -6, 2, 100, 3, 171])
print("min is \(bounds!.0) and max is \(bounds!.max)")

func someFunction(firstParameterName: Int, secondParameterName: Int) {
    
}
someFunction(11, secondParameterName: 2)
//一般情况下，第一个参数省略其外部参数名，第二个以后的参数使用其本地参数名作为自己的外部参数名。所有参数需要有不同的本地参数名，但可以共享相同的外部参数名

//可以在本地参数名前指定外部参数名，中间以都空格分隔
func someFunction(externalParameterName localParameterName: Int) {
    
}
func sayHello(to person: String, and anotherPerson: String) -> String {
    return "Hello \(person) and \(anotherPerson)!"
}
print(sayHello(to: "Bill", and: "Ted"))
//为每个参数指定外部参数名，在你调用函数时两个参数都必须被标记出来

//如果不想为第二个及后续的参数设置参数名，用下划线（ _ ）代替一个明确的参数名
func someFunction(firstParameterName: Int, _ secondParamterName: Int) {
    
}
someFunction(1, 2)
//因为第一个参数默认忽略其外部参数名称，明确写下划线时多余的

func someFunction(paramterWithDefault: Int = 13) {
    print(paramterWithDefault)
}
someFunction(12)
someFunction()

//可变参数
//一个可变参数可以接受零个或多个值。函数调用时，你可以用可变参数来传入不确定数量的输入参数。通过在变量类型名后面加入（...）的方式来定义可变参数
//传入可变参数的值在函数体内当做这个类型的一个数组。例如，一个叫做 numbers 的 Double... 型可变参数，在函数体内可以当做一个叫 numbers 的 Double[] 型的数组常量。
func airthmeticMean(numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
airthmeticMean(1,2,3,4,5)
//如果函数有一个或多个带默认值的参数，而且还有一个可变参数，那么把可变参数放在参数表的最后

func alignRight(var string: String, totalLength: Int, pad: Character) -> String {
    let amountToPad = totalLength - string.characters.count
    if amountToPad < 1 {
        return string
    }
    let padString = String(pad)
    for _ in 1...amountToPad {
        string = padString + string
    }
    return string
}
let originalString = "Hello"
let paddedString = alignRight(originalString, totalLength: 6, pad: "-")

