import UIKit

var greeting = "Hello, playground"


enum Days: CaseIterable {
    case Monday
    case Tuesday
    case Wednesday
    case Thursday
    case Friday
    case Saturday
    case Sunday
}

var day = Days.Tuesday
type(of: day)
print(day)


switch day {
case .Monday : print("its monday")
case .Tuesday : print("its tuesday")
case .Wednesday : print("its wednesday")
default: print("its Default")
}


for element in Days.allCases {
    print(element)
}

enum Size : Int {
    case small = 10
    case medium = 20
    case large = 30
}

Size.small.rawValue

var size = Size.large
size
size.rawValue



enum Order {
    case first(Int)
    case second(String)
    case third(Bool)
}



var myOrder = Order.first(25)
print(myOrder)

enum Pizza {
    case small (Int, Int , String)
    case mediu(Int , String , String)
    case large(String , Int , Int)
}

var pizza = Pizza.large("largePizza", 20, 25)

print(pizza)

enum Student {
    case small(age: Int)
    case medium(age: Int)
    case large(age: Int,name: String)
}

var student = Student.large(age: 86, name: "rajan")
print(student)

switch student {
case .small(_) : print("its small")
//case  .medium(let age) : print("its medium \(age)")
case .large(let age,let  name) : print("its large and age is \(age) and name is \(name)")
default : print("default case")
}

// recursive enum

enum Math {
    case number(Int)
    indirect case addition(Math , Math)
    indirect case multiply(Math , Math)
    
}

var first = Math.number(2)
var second = Math.number(4)
var add = Math.addition(first, second)
var mul = Math.multiply(first, second)


func evaluate(math: Math) {

    switch math {
    case .number(let i) : print("value is \(i)")
    case let .addition(i, j) : print("addition is \(getValue(math: i) + getValue(math: j))")
    case .multiply(let i, let j) : print("multiple is \(getValue(math: i) * getValue(math: j))")
 //   default : print("its default")
    }
}

func getValue(math: Math) -> Int{
    
    switch math {
    case .number(let num) : return num
    default : print("default")
    }
    return 0
}

getValue(math: first)
evaluate(math: add)

enum Box : CaseIterable {
   
    case small
    case medium
    case large
}

print(Box.allCases)
type(of: Box.allCases)

for element in Box.allCases {
    print(element)
}
