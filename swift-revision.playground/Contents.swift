import UIKit
import Foundation
var greeting = "Hello, playground"

let age = 30
//assert(age >= 0, "A person's age can't be less than zero.")
// This assertion fails because -3 isn't >= 0.

//assert(age >= 0)

if age > 10 {
    print("You can ride the roller-coaster or the ferris wheel.")
} else if age >= 0 {
    print("You can ride the ferris wheel.")
} else {
    assertionFailure("A person's age can't be less than zero.")
}

precondition(age>10, "age should be greater than 10")


// functions

func printInfo(firstname: String,lastname lastName: String, age: Int = 22,_ marks:Int ) -> (age:Int , name: String) {
    
    print("name: \(firstname + lastName) age: \(age) marks: \(marks)")
    
    return (age,firstname + lastName)
    
}

printInfo(firstname: "rajan",  lastname: "patel", age: 29, 70)

func addition(numbers:Int...,name:String) -> (sum: Int,name: String) {
    
    var sum = 0
    
    
    for number in numbers {
        sum+=number
    }
    
    return (sum,name)
}

addition(numbers: 2,3,4,5,6, name: "rajan")

// inout func
func swapTwoInts(_ a: inout Int, _ b:inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")
// Prints "someInt is now 107, and anotherInt is now 3"


// functions as arguments and return types

func swap(swapfunc: (inout Int,inout Int) -> Void , number1: inout Int , number2:inout Int) {
    swapfunc(&number1,&number2)
}
var f = 20
var s = 30
swap(swapfunc: swapTwoInts, number1: &f, number2: &s)
print(f,s)


// Closure

var array = [2,3,4,5,1,2,3,6,7,8]
array.sorted(by:{ (number1: Int, number2:Int) -> Bool in
    return number1 < number2 } )

array
array.sorted(by: { number1 , number2 in number1<number2 })
print(array.sorted(by: <))


// closures are referance types

func makeIncrementer(value: Int ) -> () -> Int{
    var resultValue = value
    func increment() -> Int {
        resultValue += value
        return resultValue
    }
    return increment
}

var incrementByFive = makeIncrementer(value: 5)
incrementByFive()
incrementByFive()

var increment5 = incrementByFive
increment5()


class Task {
    
    var cl: (() -> Void)? = nil
    func doWork(onComplete:@escaping () -> Void ){
        cl = onComplete
    }
    
    func onComplete(){
        cl?()
    }
}

var task = Task()
task.doWork {
    print("i am closure")
}

task.onComplete()


func passClosure(closure:@autoclosure ()->Void){
    
}
passClosure(closure: print("yy"))

var arrayOfInt = [5,3,2,5,1,8,9]

print(arrayOfInt.map({(number) in number*2 }))

arrayOfInt

var dict = [
    "one": 1, "two": 2
]
type(of: dict)
var keys = dict.map({ $0.key })
keys
var values = dict.map({ $0.value })
values
var dictionary = dict.map({$0})
dictionary

type(of: dictionary)

dict.map { ($0.key.uppercased()) }
dict

// enum

//
//var somePlanet = Planet.earth
//
//switch somePlanet {
//case .earth: print("earth")
//default: print("default")
//}
//
//Planet.allCases
//for ele in Planet.allCases {
//    print(ele)
//}
//
//// associative values
//
//
//

let numbersWithNil = [5, 15, nil, 3, 9, 12, nil, nil, 17, nil]
let doubledNums = numbersWithNil.map( { (number) -> Int? in
    if let number {
        return number*2
    }else {
        return nil
    }
} )

doubledNums

var xyz = numbersWithNil.compactMap({ $0 != nil ?  $0! * 2 :  -1})
xyz
var withoutNil = numbersWithNil.compactMap({ $0 })
withoutNil

let marks = [[3, 4, 5], [2, 5, 3], [1, 2, 2], [5, 5, 4], [3, 5, 3]]

//let allMarks = marks.flatMap { (array) -> [Int] in
//    return array
//}

let allMarks1 = marks.flatMap { $0 }

print(allMarks1)


var numbers = [5, 9, 15, 12, 8, 17, 20, 11]

var filtered = numbers.filter( {number -> Bool in
    number > 10
}
)

filtered

var product = numbers.reduce(1) { (partialResult, number) -> Int in
    return partialResult * number
}
product

//var sum = numbers.reduce(0){
//    (partialResult,number) -> Int in
//    return partialResult+number
//}

var sum = numbers.reduce(0, *)
sum

let friendsAndMoney = ["Alex": 150.00, "Tim": 62.50, "Alice": 79.80, "Jane": 102.00, "Bob": 94.20]

let allMoney = friendsAndMoney.reduce(0, { $0 + $1.value })
allMoney

numbers.forEach({ (number) in
    print(number)
})

var hasLessThan5 = numbers.contains(where: { (number) in
    number < 5
})

//numbers.removeAll( { (number) -> Bool in
//    return number < 15
//} )

numbers.removeAll(where: { (number) in
    return number<15
} )


numbers.append(2)
numbers.append(4)
numbers
numbers.sorted( by: { $0 < $1 } )
numbers

var myName = "my name is rajan patel"

//myName.split(separator: { char in
//    char == " "
//})

var strArray = myName.split(maxSplits: 20, omittingEmptySubsequences: true , whereSeparator: { c in
    return c == " "
} )

strArray
type(of: strArray)

// enum


 enum Person {
    case sad(Int,Int,Int)
    case happy(String,Int)
    case fine(String)
     indirect case newCase(Person,Person)
}

var persionMood = Person.happy("rajan", 100)

switch persionMood {
case .happy(let name ,let age): print("hello \(name)", "age is \(age)")
case .sad(_, _, _): print("hello2")
case .fine(_): print("hello3")
default : print("default")
}

enum Fan: Int {
    case slow , fast , medium
}

var fan = Fan.fast
var fan2 = Fan(rawValue: 2)



class FirstClass{
    var age = 20
    var second = SecondClass()
//    second.closure = {}
    
    func getData() {
        print(1)
        second.closure = { print("jkla",$0)
            return self.age
        }
    }
    
}

class SecondClass {
    var name: String = "rajan"
    
    var closure: ((String) -> Int)?
    
    func passData() {
        self.closure?(name)
    }
}

var first = FirstClass()
first.getData()
first.second.passData()

// error handling

enum ShoppingError: Error {
    case itemNotAvailable
    case lowBalance
}

func shop(balace: Int, item: Int) throws -> Int{
    
    guard item > 0 else {
        throw ShoppingError.itemNotAvailable
    }
    
    guard balace > 10 else {
        throw ShoppingError.lowBalance
        
    }
    return 0
}

do {
    try shop(balace: 100, item : 10)
    print("done")
}catch ShoppingError.itemNotAvailable{
    print("error item")

}catch ShoppingError.lowBalance{
    print("error balance")
}

var shopValue = try? shop(balace: 20, item: 10)
print(shopValue)

class Vehicle {
    var numberOfWheels = 4
    
    
    
}

class Bycycle: Vehicle {
    override init() {
        super.init()
        numberOfWheels = 2
    }
}


var bicycle = Bycycle()
bicycle.numberOfWheels

class Food {
    var name: String
    init(name: String) {
        self.name = name
    }
    convenience init() {
        self.init(name: "[Unnamed]")
    }
}

let namedMeat = Food(name: "Bacon")
// namedMeat's name is "Bacon"

let mysteryMeat = Food()
// mysteryMeat's name is "[Unnamed]"

class RecipeIngredient: Food {
    var quantity: Int
    init(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
    }
    override convenience init(name: String) {
        self.init(name: name, quantity: 1)
    }
}

let oneMysteryItem = RecipeIngredient()
oneMysteryItem.quantity

let oneBacon = RecipeIngredient(name: "Bacon")
let sixEggs = RecipeIngredient(name: "Eggs", quantity: 6)

class ShoppingListItem: RecipeIngredient {
    var purchased = false
    var description: String {
        var output = "\(quantity) x \(name)"
        output += purchased ? " ✔" : " ✘"
        return output
    }
}

// failable init


var failable = Failable(name: "")

struct FailableStruct {
    var name: String
    init?(name: String) {
        if name.isEmpty {return nil}
        self.name = name
    }
}

var failableStruct = FailableStruct(name: "")

enum FailableEnum {
    case invalidInput
    case lowBalance
    
    init?(number: Int) {
        switch number {
        case 1: self = Self.invalidInput
        case 2: self = Self.lowBalance
        default: return nil
        }
    }
}

extension FailableEnum {
    
}
var failableEnum = FailableEnum(number: 1)
//print(failableEnum)

class Failable {
    var name: String?
    init(){}
    init?(name: String) {
        if name.isEmpty {return nil}
        self.name = name
    }
}

class NotFailable: Failable {
    
    override init(name: String) {
        super.init()
        self.name = name
    }
}

var notFailable = NotFailable(name: "rajan")
notFailable.name

//required init
class SomeClass {
    required init() {
        // initializer implementation goes here
    }
}

class SomeSubclass: SomeClass {
    var name: String
     init(name: String) {
        self.name = name
         
    }
    required init() {
        self.name = ""
    }
    
}

extension Double {
    
    var km: Double { return self * 1_000.0 }
    var m: Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084 }
}


