//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var emptyArray = [String]()
var emptyDic   = [String: Float]()

var optionalSting: String? = "Hello"
print(optionalSting == nil)

var optionalNameString: String? = "john"
var greeting = "Hello"
if let name = optionalNameString {
    greeting = "Hello*  \(name)"
}
let nickName: String? = nil
let fullName: String = "appleName"
let informationName = "Hi \(nickName ?? fullName)"

let vegetable = " red pepper"
switch vegetable {
case "aaa":
    print("匹配aaa值")
case "black":
    print("匹配black")
case let x where x.hasSuffix("pepper"):
    print("匹配了后缀pepper")
default:
    print("默认匹配值")
}

let interestingNumbers = [
    "aaa": [1, 3, 5, 7, 9],
    "bbb": [2, 4, 6, 81, 0],
    "ccc": [12, 13, 15, 9, 10]
]
var largest = 0
var largestKind = "aaa"
for (kinds, numbers) in interestingNumbers {
    for number in numbers {//先取aaa中比较最大值赋给largest,再取bbb依次与largest比较...
        if number > largest {
            largest = number
            largestKind = kinds
        }
    }
}
print("最大的数为:\(largest) -- \(largestKind)")

var n = 2
while n < 100 {
    n = n*2
}
print("终止循环时n的值为 \(n)")
var m = 2
repeat {
    m = m*2
} while m < 100
print("终止循环时m的值为 \(m)")

var total = 0
for i in 0 ..< 4 { // 0 1 2 3  (..< 不包含临界值)
    total += i
}
print("结果为 \(total)")
var total2 = 0
for i in 0 ... 4 { // 0 1 2 3 4  (... 包含临界值)
    total2 += i
}
print("结果为 \(total2)")

print("*******************函数和闭包*******************")
func greet(person: String, day: String) -> String {
    return "Hello \(person), today is \(day)"
}
greet(person: "zhangsan", day: "2017-06-14")

func greetReset(_ person: String, time day: String) ->String {
    return "Hi \(person), today is \(day)"
}
greetReset("Lisi", time: "2017/06/14")

func caculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    for score in scores {
        if score > max {
            max = score
        }else if score < min {
            min = score
        }
        sum += score
    }
    return (min, max, sum)
}
caculateStatistics(scores: [72, 81, 99, 100, 60])
let caculate = caculateStatistics(scores: [72, 80, 99, 100, 60])
print("最大值为：\(caculate.max), 最小值为：\(caculate.min), 总和为：\(caculate.sum)")

func sumOf(numbers: Int ...) -> Int { //可变个参数
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum
}
sumOf()
sumOf(numbers: 1, 2, 3, 4)

func sumOf2(numbers: Int ...) -> (sum: Int, average: Double) { //可变个参数
    var sum = 0
    var i   = 0
    var average: Double = 0.0
    for number in numbers {
        sum += number
        i   += 1
    }
    if i == 0 { //因为参数是可变的，也就要考虑是否会传入0个参数，
        average = 0
    }else {
        average = Double(sum/i)
    }
    return (sum, average)
}
sumOf2()
let sumAndAverage = sumOf2(numbers: 1, 2, 3, 4)
print("传入参数总和为：\(sumAndAverage.sum), 平均数为：\(sumAndAverage.average)   ")

func nestFunc() -> Int {
    var y = 10
    func addFive() {
        y += 5
    }
    addFive()//调用
    return y
}
print("嵌套函数返回y值为：\(nestFunc())  ")

func makeIncrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return number
    }
    return addOne
}
let incrementer = makeIncrementer()
incrementer(10)
print("一个函数做为另一函数的返回值： \(incrementer(10))  ")

func hasAnyMatche(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}
func lessThanTen(number: Int) -> Bool {
    return number < 10
}
hasAnyMatche(list: [11, 31, 16, 18], condition: lessThanTen)
print("一个函数作为另一个函数的参数   ")

var numbers = [1, 3, 6, 19]
numbers.map({
    (number: Int) -> Int in
    let result = 3 * number
    return result
})
print("匿名闭包函数  ")
let mappedNumber = numbers.map({
    (number: Int) -> Int in
    if number%2 == 0 {
        return 0
    }
    return 1
})
print("重写闭包，对所有奇数返回 0：\(mappedNumber)   ")
let mappedNumbers = numbers.map({ number in 3 * number })
print("简洁闭包： \(mappedNumbers)    ")

let sortNumbers = numbers.sorted (by: {
    //    (n1: Int, n2: Int) -> Bool in
    (n1, n2) -> Bool in     //闭包可以不用指定参数类型
    return n1 < n2
})
print(sortNumbers)

let numbers2 = [1, 4, 2, 3]
let res = numbers2.sorted { $0 < $1 }
print("排序：\(res)")
let res2 = numbers2.sorted(by: { $0 < $1 })
print("排序2：\(res2)")


let arr = [1, 2, 4]
let brr = arr.filter { //用 filter 方法，来对数组元素进行某种规则的过滤
    $0 % 2 == 0
}
print("过滤：\(brr)                ")


let array = [1, 2, 4]
let brray = arr.map { //用 map 方法来对数组元素进行某种规则的转换
    "No." + String($0)
}
print("遍历：\(brray)              ")


let arr2 = [1, 2, 4]
let brr2 = arr2.reduce(0) { //用 reduce 方法，来对数组元素进行某种规则的求和
    (prevSum: Int, element: Int) in
    return prevSum + element
}
let crr2 = arr2.reduce("") {
    if $0 == "" {
        return String($1)
    } else {
        return $0 + " " + String($1)
    }
}
print("拼接： \(crr2)              ")

let arr3 = [1, 2, 4]
arr3.forEach {
    print($0)
}


class Clock {
    var count: Int = 0
    func getCount() -> Int {
        count += 1
        return count;
    }
}

let c1 = Clock()
c1.getCount() // 得到 1
c1.getCount() // 得到 2
let c2 = Clock()
c2.getCount() // 得到 1

//
//func getClock() -> () -> Int {
//    var count1: Int = 0
//    let getCount = { () -> Int in
//        count1 += 1
//    }
//    return getCount
//}
//
//let c3 = getClock()
//c3()  // 得到 1
//c3()  // 得到 2
//let c4 = getClock()
//c4()  // 得到 1


let arr4 = [1, 3, 2]
let res4 = arr4.reduce([]) {
    (a: [Int], element: Int) -> [Int] in
    var t = Array(a)
    t.append(element * 2)
    return t
}
print("用数组的 reduce 方法实现 map 的功能： \(res4)")


let arr5 = [1, 3, 2, 4]
let res5: (Int, Int) = arr5.reduce((0, 1)) {
    (a :(Int, Int), element: Int) -> (Int, Int) in
    if element % 2 == 0 {
        return (a.0, a.1 * element)
    } else {
        return (a.0 + element, a.1)
    }
}
print("用 reduce 方法一次求出数组中奇数的和、以及偶数乘积： \(res5)   ")

let arr6 = [1, 3, 2, 4]
let res6 = arr6.filter {
    $0 % 2 == 0
    }.map {
        $0 * $0
    }.reduce(0) {
        $0 + $1
}
print("求一个数组中偶数的平方和： \(res6)   ")

let a: Int? = 1   // ? == option<Int> 可选类型
let b: Int?? = a
let c: Int??? = b

print("************************对象和类***************************")
class Shape {
    var numberOfSides = 0
    let numberOfFaces = 6
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) side "
    }
    func numberOfCountFunc(faceNumber: Int) -> String {
        return "A Shape has \(faceNumber) face "
    }
}
var shape = Shape()
shape.numberOfSides = 8
var shapeDescription = shape.simpleDescription()
var shapeDescription2 = shape.numberOfCountFunc(faceNumber: 8)


class NameShape {
    var numberOfSides = 0
    var name: String
    init(name: String) {
        self.name = name
    }
    
    func simpleDescription2() -> String {
        return "返回值： \(numberOfSides) "
    }
}
class Square: NameShape {
    var sideLength: Double
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() -> Double {
        return sideLength * sideLength
    }
    //重写 父类中的方法  ++前缀override
    override func simpleDescription2() -> String {
        return "A square with sides of length \(sideLength)."
    }
}
let test = Square(sideLength: 5.2, name: "my test square")
test.area()
test.simpleDescription2()

//继承
class Person {
    var name: String
    var age: Int
    var blog = "null"
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}
class Son: Person {
    var interesting: String
    
    override init(name: String, age: Int) {
        self.interesting = "swift"
        super.init(name: name, age: age)
        self.blog = "volleyball"
    }
}
var programer = Son(name: "zhangsan", age: 21)
print("继承调用：\(programer.name) \(programer.age) \(programer.interesting) \(programer.blog)"   )
var programer2 = Person(name: "lishi", age: 11)
print("继承调用：\(programer2.name) \(programer2.age) \(programer2.blog)")
//getting && setting
class SonSon: Son {
    
    var like: String
    
    override init(name: String, age: Int) {
        self.like = "baseketball"
        super.init(name: name, age: age)
    }
    
    var ageGetSet: Int {
        set {
            age = newValue+1
        }
        get {
            return (age+2)
        }
    }
}
var sonson = SonSon(name: "john", age: 18)
print("set调用之前： \(sonson.age)")
sonson.ageGetSet = 10
print("setget调用后： \(sonson.age)")


print("***********************枚举和结构体*************************")
enum PersonIndetity: String {
    case Teacher = "Teacher_Id"
    case Student = "Student_Id"
}
//类
class PersonClass {
    var indetity: PersonIndetity
    var name: String
    var age: String
    
    init(name: String, age: String, id: PersonIndetity) {
        self.name = name
        self.age = age
        self.indetity = id
    }
    
    func hello(){
        print("父类的方法")
    }
    class func helloClassFunc() {
        print("父类的-类方法")
    }
}
var personclass = PersonClass(name: "阿三", age: "33", id: PersonIndetity.Teacher)
personclass.indetity.hashValue //当前分支
personclass.indetity.rawValue  //当前分支值
//继承
class SonClass: PersonClass {
    //子类的属性
    var classOfNumber: Int = 20
    
    init(name: String, age: String, id: PersonIndetity, classOfNumber: Int) {
        
        super.init(name: name, age: age, id: id)
        self.classOfNumber = classOfNumber
    }
    //重写父类方法
    override func hello() {
        print("子类重写了父类的方法")
    }
    override class func helloClassFunc() {
        print("子类重写了父类的类方法")
    }
}
var personClass = PersonClass(name: "父类", age: "48", id: PersonIndetity.Teacher)
personClass.hello()
PersonClass.helloClassFunc()
var sonClass = SonClass(name: "子类", age: "16", id: PersonIndetity.Student, classOfNumber: 88)
sonClass.hello()
SonClass.helloClassFunc()

//协议
protocol OneProtocal {
    func typeFunc0()
    static func typeFunc1()
    mutating func typeFunc2()
}
//类和结构体实现协议方法的时候 需要根据本身的语法规则做出调整
class NewStudent: OneProtocal {
    
    func typeFunc0() {
        print("方法0")
    }
    class func typeFunc1() {
        print("方法1")
    }
    func typeFunc2() {
        print("方法2")
    }
}
struct NewStruct: OneProtocal {
    func typeFunc0() {
        print("方法--0")
    }
    static func typeFunc1() {
        print("方法--1")
    }
    mutating func typeFunc2() {
        print("方法--2")
    }
}
// 类同时继承父类和协议的时候 父类必须写在前面
//class StudentNew:Person, OneProtocol {
//}
//注意:当协议中方法使用optional 声明可选方法时 协议必须声明成@objc 此时的协议为类协议 不能被结构体继承
@objc protocol SecondProtocol {
    @objc optional func hello()
}

//扩展
var value: String = ""
extension PersonClass {
    
    func helloWorld() {
        print("HelloWorld")
    }
    
    //如果扩展属性，只能为计算属性
    var stu: String {
        get{
            return value
        }
        set {
            value = newValue
        }
    }
    
    //扩展构造器
    convenience init(name: String, age: String, id: PersonIndetity, stu:String){
        self.init(name: name, age: age, id: id)
        self.stu = stu
    }
    
}
var person_one = PersonClass(name: "Tom", age: "20", id: PersonIndetity.Student, stu: "aaa")
person_one.stu         //调用get方法
person_one.stu = "set" //调用set方法
person_one.stu         //调用get方法

enum PrinterError: Error {
    case OutOfPaper
    case NoToner
    case OnFire
}
func send(job: Int, toPrinter printerName: String) throws -> String {
    if printerName == "Never Has Toner" {
        throw PrinterError.NoToner
    }
    return "Job sent"
}
do {
    let printerResponse = try send(job: 1040, toPrinter: "Bi Sheng")
    print(printerResponse)
} catch {
    print(error)
}
//扩展嵌套类型
extension Character {
    enum Kind {
        case Vowel, Consonant, Other    //元音 辅音 其它
    }
    
    var kind:Kind {
        switch String(self).lowercased() {  //小写
        case "a", "e", "i", "o", "u":
            return .Vowel
        case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n",
             "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
            return .Consonant
        default:
            return .Other
        }
    }
}
let Characters: Character = "c"
print(Characters.kind)

print("***********************泛型**********************")
func repeatingItem<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {
    var result = [Item]()
    for _ in 0..<numberOfTimes {
        result.append(item)
    }
    return result
}
var repeating = repeatingItem(repeating: "abcdefg", numberOfTimes: 3)
print("泛型事例：\(repeating)")

enum optionValue<T> {
    case None
    case some(T)
}
var possibleInteger : optionValue<Int> = .None
possibleInteger = .some(100)

enum optionValue2 <T> {
    case Null
    case other(T)
}
var possibleString : optionValue2<String> = .Null
possibleString = .other("empty")

//var name: String? = "Bob"
//name = nil // Set name to nil, the absence of a value
//if name != nil {
//    print("There is a name")
//}
//if name == nil { // Could also use an "else"
//    print("Name has no value")
//}
//var red: String = "Red"
////red = nil // error: nil cannot be assigned to type 'String'

//var name: String? = "Bob"
//let unwrappedName: String = name!
//print("Unwrapped name: \(unwrappedName)")
//
//name = nil
//let nilName: String = name! // Runtime crash. Unexpected nil.

func anyCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> Bool
    where T.Iterator.Element: Equatable, T.Iterator.Element == U.Iterator.Element {
        for lhsItem in lhs {
            for rhsItem in rhs {
                if lhsItem == rhsItem {
                    print("---\(lhs)")
                    print("+++\(rhs)")
                    return true
                }
            }
        }
        return false
}
anyCommonElements([1, 2, 3], [2])
//<T: Equatable> 等价 <T where T: Equatable>
//修改 anyCommonElements(_:_:) 函数来创建一个函数，返回一个数组，内容是两个序列的共有元素
func backArray<T: Sequence, U: Sequence> (_ lhs: T, _ rhs: U) -> [Int]
    where T.Iterator.Element: Equatable, T.Iterator.Element == U.Iterator.Element {
        var backArr = [Int]()
        for lhsItem in lhs {
            for rhsItem in rhs {
                if lhsItem == rhsItem {
                    print("---\(lhsItem)")
                    print("+++\(rhsItem)")
                    backArr.append(rhsItem as! Int)
                }
            }
        }
        return backArr
}
var back = backArray([1, 2, 3], [3, 4, 1, 2, 1])
print("返回一个数组,两个序列的共有元素： \(back)      ")

func 方法一() {
    print("中文方法名")
}
方法一()

let minValue8 = UInt8.min
let maxValue8 = UInt8.max

let greeting2 = "Guten Tag!"
print(greeting2[greeting2.startIndex])
// G
//print(greeting2[greeting2.endIndex])
//
print(greeting2[greeting2.index(before: greeting2.endIndex)])
// !
print(greeting2[greeting2.index(after: greeting2.startIndex)])
// u
let index = greeting2.index(greeting2.startIndex, offsetBy: 7)
print(greeting2[index])
// a

//fatalError()


let names = ["zhangsan", "lisi", "wangwu", "mao", "jiang"]
func backward (_ s1: String, _ s2: String) -> Bool {
    return s1 < s2
}
var rearsNames = names.sorted(by: backward)
rearsNames = names.sorted(by: {(s1: String, s2: String) -> Bool in
    return s1 > s2
})//闭包表达式
rearsNames = names.sorted(by: {(s1: String, s2: String) -> Bool in return s1 < s2})
rearsNames = names.sorted(by: {s1, s2 in return s1 > s2})//根据上下文推断类型
rearsNames = names.sorted(by: {s1, s2 in s1 > s2})//单表达式闭包隐式返回
rearsNames = names.sorted(by: {$0 > $1}) //参数名称缩写
rearsNames = names.sorted(by: > )//运算符方法

rearsNames = names.sorted(){ $0 > $1 }
rearsNames = names.sorted{ $0 > $1 }//如果闭包表达式是函数或方法的唯一参数，则当使用尾随闭包表达式可以将（）省略

let digitNames = [0: "zero", 1: "One", 2: "Two", 3: "Three", 4: "Four", 5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"]
let Numbers = [16, 58, 510]
let strings = Numbers.map{
    (number) -> String in
    var number = number
    var output = ""
    repeat{
        output = digitNames[number % 10]! + output
        number /= 10
    }while number > 0
    return output
}
print("使用尾随闭包将Int类型数组转换为包含对应String类型的值的数组 \(strings)  ")

//值捕获
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}
let incrementerByTen = makeIncrementer(forIncrement: 10)
incrementerByTen()
incrementerByTen()
incrementerByTen()
let incrementerBySeven = makeIncrementer(forIncrement: 7)
incrementerBySeven()
incrementerByTen()
//闭包和函数是引用类型
let alsoIncrmenterByTen = incrementerByTen
alsoIncrmenterByTen()
//逃逸闭包
var completionHandlers: [() -> Void] = []
func someFuncWithEscapingClosure (completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}
func someFuncWithNoneEscapingClosure (closure: () ->Void) { //非逃逸闭包
    closure()
}
class SomeClass {
    var x = 10
    func doSomething(){
        someFuncWithEscapingClosure { self.x = 100 }
        someFuncWithNoneEscapingClosure { x = 200 }
    }
}
let instance = SomeClass()
instance.doSomething()
print(instance.x)
completionHandlers.first?()
print(instance.x)

//自动闭包  延时求值
var customerInLine = ["aaa", "bbb", "ccc", "ddd", "eee"]
print(customerInLine.count)

let customerProvider = { customerInLine.remove(at: 0) }
print(customerInLine.count)
print("New string \(customerProvider())!")
print(customerInLine.count)
func serve(customer customerProvider: () -> String) {
    print("\(customerProvider())!")
}
serve(customer: { customerInLine.remove(at: 0) } )
func serve(customer customerProvider: @autoclosure () -> String) {
    print("\(customerProvider())!")
}
serve(customer: customerInLine.remove(at: 0))

var customerProviders:[() -> String] = []
func collectCustomerProdividers(_ customerProvider: @autoclosure @escaping () -> String ) {
    customerProviders.append(customerProvider)
}
collectCustomerProdividers(customerInLine.remove(at: 0))
collectCustomerProdividers(customerInLine.remove(at: 0))
print("Collected \(customerProviders.count) closures.")
for customerProvider in customerProviders {
    print("Now serving \(customerProvider())!")
}

//枚举 递归  (5 + 4) * 2
indirect enum ArithmeticExpression {
    case number(Int)
    case addition(ArithmeticExpression, ArithmeticExpression)
    case multiplication(ArithmeticExpression, ArithmeticExpression)
}
let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))
func evaluate(_ expression: ArithmeticExpression) -> Int {
    switch expression {
    case let .number(value):
        return value
    case let .addition(left, right):
        return evaluate(left) + evaluate(right)
    case let .multiplication(left, right):
        return evaluate(left) * evaluate(right)
    }
}//该函数如果遇到纯数字，就直接返回该数字的值。如果遇到的是加法或乘法运算，则分别计算左边表达式和右边表达式的值，然后相加或相乘。
print(evaluate(product))


//结构体的可变方法
struct Point {
    var x = 0.0, y = 0.0
    mutating func moveToX (deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
        
//        self = Point(x: x+deltaX, y: y+deltaY)//与上面等价
    }
}
var somePoint = Point(x: 1.0, y: 1.0)
somePoint.moveToX(deltaX: 2.0, y: 3.0)
print("x= \(somePoint.x)  y= \(somePoint.y)")
let fixPoint = Point(x: 3.0, y: 3.0)
//fixPoint.moveToX(deltaX: 6.0, y: 8.0)//报错 - 可变的必须使用 var 声明

//枚举的可变方法
enum stateSwitch {
    case Off, Low, Height
    mutating func next() {
        switch self {
        case .Off :
            self = .Low
        case .Low :
            self = .Height
        case .Height :
            self = .Off
        }
    }
}
var ovenLight = stateSwitch.Low
ovenLight.next()
ovenLight.next()
ovenLight.next()


//下标选项
//struct Matrix {
//    let rows: Int, columns: Int
//    var gird: [Double]
//    init(rows: Int, columns: Int) {
//        self.rows = rows
//        self.columns = columns
//        gird = Array(counts: rows * columns, repeatedValue: 0.0)
//    }
//    func indexIsValidForRow(row: Int, column: Int) -> Bool {
//        return row > 0 && row < rows && column > 0 && column < columns
//    }
//    subscript(row: Int, column: Int) -> Double {
//        get {
//            assert(indexIsValidForRow(row: row, column: column), "Index out of range")
//            return gird[(row * columns) + column]
//        }
//        set {
//            assert(indexIsValidForRow(row: row, column: column), "Index out of range")
//            gird[(row * columns) + column] = newValue
//        }
//    }
//}

class Person3 {
    let name: String
    init(name: String) {
        self.name = name
        print("name \(name) is being  initialized")
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}
var reference1: Person3?
var reference2: Person3?
var reference3: Person3?

reference1 = Person3(name: "john")
reference1 = nil

//错误处理
//表示并抛出错误
enum VendingMachineError: Error {
    case InvalidSelection                       //选择无效
    case InsufficientFunds(coinsNeeded: Int)    //金额不足
    case OutOfStock                             //缺货
}
//throw VendingMachineError.insufficientFunds(coinsNeeded: 5)//贩卖机抛出错误，还需要5个金币  此句会干扰下面的打印

struct Item {
    var price: Int
    var count: Int
}
class VendingMachine {
    var invertory = [
        "Candy Bar": Item(price: 12, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Pretzels": Item(price: 7, count: 11)
    ]
    var coinsDeposited = 0
    func dispenseSnack(snack: String) {
        print("dispese \(snack)")
    }
    func vend(itemNamed name: String) throws {  //抛出错误
        print("item =  \(invertory[name])")
        guard let item = invertory[name] else {
            throw VendingMachineError.InvalidSelection
        }
        guard item.count > 0 else {
            throw VendingMachineError.OutOfStock
        }
        guard item.price <= coinsDeposited else {
            throw VendingMachineError.InsufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }
        
        coinsDeposited = coinsDeposited - item.price
        var newItem = item
        newItem.count = newItem.count - 1
        invertory[name] = newItem
        print("Dispensing \(name)")
    }
}

let favoriteSnacks = ["Alice": "Chips", "Bob": "Licorite", "Eve": "Pretzels"]
func buyFavoriteSnack (person: String, vendingMachine: VendingMachine) throws {
    let snackName = favoriteSnacks[person] ?? "Candy Bar"
    print("snackName =  \(snackName)")
    try vendingMachine.vend(itemNamed: snackName)    //在能抛出错误的函数、方法或构造器前 添加try 关键字或try? try? 或 try！
}
//throwing构造器能像throwing函数一样传递错误
struct purchasedSnack {
    let name: String
    init(name: String, vendingMachine: VendingMachine) throws {
        try vendingMachine.vend(itemNamed: name)
        self.name = name
    }
}

//用 Do-Catch处理错误
var vendingMachine = VendingMachine()
vendingMachine.coinsDeposited = 8
do {
    try buyFavoriteSnack(person: "Alice", vendingMachine: vendingMachine)
} catch VendingMachineError.InvalidSelection {
    print("无效的选择")
} catch VendingMachineError.OutOfStock {
    print("缺货")
} catch VendingMachineError.InsufficientFunds(let coinsNeeded) {
    print("请投入 \(coinsNeeded) coins")
}

//将错误转换为可选值
func someThrowingFunc() throws -> Int  {
    let m = 2
    return m
}
//x 与 y 等价
let x = try? someThrowingFunc()
let y: Int?
do {
    y = try someThrowingFunc()
} catch {
    y = nil
}
func fetchData() -> Data? {
//    if let data = try? fetchDataFromDisk() { return data }
//    if let data = try? fetchDataFromServer() { return data }
    return nil
}
//禁止错误传递
func loadImage(imgUrl: String) -> String { return "图片路径" }
let photo = try! loadImage(imgUrl: "imagePath")

//指定清理操作
//func processFile(fileName: String) throws {
//    if exists(fileName) {
//        let file = open(fileName)
//        defer {
//           close(file)
//        } while let line = try file.readline(){
//            //处理文件
//        }
//        // close(file) 会在这里被调用，即作用域的最后。
//    }
//}

//扩展
extension Double {
    var km: Double { return self * 1_000.0 }
    var m : Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084 }
}
let oneInch = 25.4.mm
print("One inch is \(oneInch) meters")
let threeFeet = 3.ft
print("Three feet is \(threeFeet) meters")

//扩展  构造器
struct Size {
    var width = 0.0, height = 0.0
}
struct Point2 {
    var x = 0.0, y = 0.0
}
struct Rect {
    var origin = Point2()
    var size = Size()
}
let defaultRect = Rect()
let memberwiseRect = Rect(origin: Point2(x: 2.0, y: 2.0),
                          size: Size(width: 5.0, height: 5.0))
extension Rect {
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point2(x: originX, y: originY), size: size)
    }
}
//下标
extension Int {
    subscript(digitIndex: Int) -> Int {
        var decimalBase = 1
        for _ in 0..<digitIndex {
            decimalBase *= 10
        }
        return (self / decimalBase) % 10
    }
}
746381295[0]
746381295[6]
123456789[18]  //越界时返回 0

//嵌套类型
extension Int {
    enum Kind {
        case Negative, Zero, Positive
    }
    var kind: Kind {
        switch self {
        case 0:
            return .Zero
        case let x where x > 0:
            return .Positive
        default:
            return .Negative
        }
    }
}

//协议
protocol RandomNumberGenerator {
    func random() -> Double     //[0.0,1.0) 区间内的随机数
}
class LinearCongruentialGenerator: RandomNumberGenerator { //线性同余生成器 的伪随机数算法
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func random() -> Double {
        lastRandom = ((lastRandom * a + c) .truncatingRemainder(dividingBy: m))
        return lastRandom / m
    }
}
let generator = LinearCongruentialGenerator()
print("Here's a random number: \(generator.random())")
print("And another one: \(generator.random())")

//协议作为类型
class Dice {
    let sides: Int
    let generator: RandomNumberGenerator
    init(sides: Int, generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1
    }
}

var d6 = Dice(sides: 6, generator: LinearCongruentialGenerator())
for _ in 1...5 {
    print("Random dice roll is \(d6.roll())")
}

//通过扩展添加协议的一致性
protocol TextRepresentable {
    var textualDescription: String { get }
}
extension Dice: TextRepresentable {
    var textualDescription: String {
        return "A \(sides)-sided dice"
    }
}
let d12 = Dice(sides: 12, generator: LinearCongruentialGenerator())
print(d12.textualDescription)

//协议类型的集合
let things: [TextRepresentable] = [d6, d12]
for thing in things {
    print(thing.textualDescription)
}

//泛型
//标准的 非泛型函数
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}
var someInt = 3
var anotherInt = 107
swap(&someInt, &anotherInt)
print("someInt = \(someInt)。 anotherInt = \(anotherInt)")

//泛型函数
func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
    let temporaryA = a
    a = b
    b = temporaryA
}
var someString = "hello"
var anotherStirng = "world"
swap(&someString, &anotherStirng)
print("someString = \(someString) . anotherString = \(anotherStirng)")

//非泛型版本的栈
struct IntStack {   //只能用于Int类型
    var items = [Int]()
    mutating func push(_ item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
         return items.removeLast()
    }
}
//泛型版本
struct Stack<Element> {
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
}
var stackOfString = Stack<String>()
stackOfString.push("0") //入栈
stackOfString.push("1")
stackOfString.push("2")
stackOfString.push("3")
print(stackOfString.items)
stackOfString.pop() //出栈
print(stackOfString.items)

//扩展一个泛型类型
extension Stack {
    var topItem: Element? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
}
if let topItem = stackOfString.topItem {
    print(topItem)
}

//类型约束
//类型约束语法
//func someFunction <T: SomeClass, U: SomeProtocol> (someT: T, someU: U) {
//    //函数体
//}

//类型约束实践
//非泛型函数
//该函数的功能是在一个 String 数组中查找给定 Str ing 值的索引。若查找到匹配的字符串，findIndex(ofString:in:) 函数返回该字符串在数组中的索引值，否则 返回 nil
func findIndex(ofString valueToFind: String, in array: [String]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}
let stringss = ["cat", "dog", "llama", "parakeet", "terrapin"]
if let foundIndex = findIndex(ofString: "llama", in: stringss) {
        print("The index of llama is \(foundIndex)")
}
//泛型版本
func findIndex<T: Equatable>(of valueToFind: T, in array: [T]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}
let doubleIndex = findIndex(of: 9.3, in: [3.1415, 0.5, 0.9])//doubleindex 类型为 Int? 9.3不存在数组中，返回nil
let stringIndex = findIndex(of: "swift", in: ["iOS", "Html", "swift"])//stirngIndex 类型为 Int?

//关联类型
//关联类型实践
protocol Container {
    associatedtype ItemType
    mutating func append(item: ItemType)
    var count: Int { get }
    subscript(i: Int) -> ItemType { get }
}

//泛型 where 语句
func allItemsMatch<C1: Container, C2: Container>
    (_ someContainer: C1, _ anotherContainer: C2) -> Bool
    where C1.ItemType == C2.ItemType, C1.ItemType: Equatable {
    
    //1. 检查两个容器含有相同数量的元素
    if someContainer.count != anotherContainer.count {
        return false
    }
    //2. 检查每一个元素是否相同
    for i in 0..<someContainer.count {
        if someContainer[i] != anotherContainer[i] {
            return false
        }
    }
    //匹配其余元素
    return true
}
var stackOfStrings = Stack<String>()
stackOfStrings.push("uno")
stackOfStrings.push("dos")
stackOfStrings.push("tres")
var arrayOfStrings = ["uno", "dos", "tres"]
//allItemsMatch(stackOfString, arrayOfStrings) //错误Error


//访问控制
//模块和源文件...






