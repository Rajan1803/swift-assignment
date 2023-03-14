import UIKit

var greeting = "Hello, playground"


struct Point {
    var x = 0.0, y = 0.0
}
struct Size {
    var width = 0.0, height = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}
var square = Rect(origin: Point(x: 0.0, y: 0.0),
    size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center
square.center.x
square.origin.x
square.origin.y
// initialSquareCenter is at (5.0, 5.0)
square.center = Point(x: 15.0, y: 15.0)
square.center.x
square.origin.x
square.origin.y
print("square.origin is now at (\(square.origin.x), \(square.origin.y))")
// Prints "square.origin is now at (10.0, 10.0)"

struct Student {
    var firstName: String
    var lastName: String
    
    var fullName: String {
        get {
            return firstName + " " + lastName
        }
        set {
            var nn = newValue.split(separator: " ")
            var names = Array(nn)
            
            type(of: names)
            firstName = String(names[0])
            lastName = String(names[1])
        }
    }
}


var student = Student(firstName: "rajan", lastName: "patel")
student.fullName
student.fullName = "priyanshu desai"
student.fullName
student.firstName
student.lastName


struct StepCounter {
    
   
    var totelSteps: Int {
        
        willSet {
            print("new value of totel steps will be \(newValue) and steps now: \(totelSteps)")
        }
        didSet {
            print("old value : \(oldValue) and new value: \(totelSteps)")
        }
    }
    
    init(steps: Int) {
        totelSteps = steps
    }
}

var steps = StepCounter(steps: 50)
steps.totelSteps = 100
PassClass(steps)
func PassClass(_ stepcounter: StepCounter) {
    stepcounter.totelSteps
}

@propertyWrapper
struct LessThanTwelve {
    private var number : Int = 0
    
    var wrappedValue : Int {
        
        get {
            return number
        }
        set(newValue) {
            if newValue > 12 {
                number = 12
            }else {
                number = newValue
            }
        }
    }
}


@propertyWrapper
struct LessThan {
    private var number: Int = 0
    private var maximum: Int = 10
    var projectedValue = false
    var wrappedValue: Int {
        get {
            number
        }
        set(newValue) {
            number = min(newValue, maximum)
            if newValue > maximum {
                projectedValue = true
            }
        }
    }
    
    init() {
        number = 0
        maximum = 10
    }

    init(num: Int, MaxValue: Int) {
        number = num
        maximum = MaxValue
    }

}

class Element {
   @LessThanTwelve var height: Int
   @LessThanTwelve var width: Int
    
    @LessThan(num: 3, MaxValue: 120) var value1 : Int
    @LessThan var value2 : Int
    
}

var element = Element()
element.height
element.height = 10
element.height
element.height = 300
element.height
element.$value1
element.value2
element.value1 = 20
element.value1



enum Sized {
    case small
    case large
    
    mutating func change() {
        switch self {
        case .small : self = .large
        case .large : self = .small
        }
    }
    
}

var ss = Sized.small
ss.change()
ss

struct SizedClass {
    @LessThan var height : Int
    @LessThan var width: Int
   mutating func setWidthHight(size: Sized) {
        switch size {
        case .small :
            self.height = 5
            self.width = 5
        
        case .large : self.height = 100
                      self.width = 100
        }
    }
}

var sized = SizedClass()
sized.width
sized.setWidthHight(size: Sized.small)
sized.width
sized.$width
sized.setWidthHight(size: Sized.large)
sized.width
sized.$width

struct someStruct {
    static var scoreLimit: Int = 100
    static var maxScore: Int = 0
    
    var currentScore: Int = 0 {
        didSet {
            if currentScore > someStruct.maxScore {
                someStruct.maxScore = currentScore
            }
            if currentScore > someStruct.scoreLimit {
                currentScore = someStruct.scoreLimit
            }
            
        }
    }
    
    
}

var struc = someStruct()
struc.currentScore = 50
someStruct.maxScore

struct Multiple {
    var multiplier: Int = 1
    
    subscript(value: Int) -> Int {
        get {
            return multiplier * value
        }
        set {
            multiplier = newValue
        }
    }
}

var threeMultiply = Multiple()
threeMultiply[5]
threeMultiply[5] = 2
threeMultiply[5]
threeMultiply[20]

//
//struct Multiple {
//   static var multiplier: Int = 1
//
//   static subscript(value: Int) -> Int {
//        get {
//            return multiplier * value
//        }
//        set {
//            multiplier = newValue
//        }
//    }
//}
//
//Multiple[4]

class Man {
    var age = 21
    var name = "rajan"
    
    subscript(parameter: String) -> Any? {
        
        get {
            if parameter == "age" {
                return age
                
            }else if parameter == "name" {
                return name
            }
            return nil
        }
        
        
    }
}

var man = Man()
var age = man["age"] as? Int

if let age {
    var agesum = age + age
    print(agesum)
}
type(of: age)
man["name"]


// Access Control

class People {
    private var name: String = "rajan"
     var age: Int = 22
    
    
}

var people = People()
//people.name


private class PrivateClass {
    
}

public class PublicClass {
    
}

internal class InternalClass {
    
}

private func work() -> (InternalClass , PrivateClass) {
    return (InternalClass(),PrivateClass())
}

private func work(_ i: InternalClass , _ p: PrivateClass) {
    
}

private var tuple = work()

private enum CompassPoint {
    case north
    case south
    case east
    case west
}

private var enumElement = CompassPoint.south


//private func fun() {
//    private var num = 10
//    print(num)
//}
//fun()
//

private class Class {
    private var num = 10
     func Function(){
        
    }
}
private var classObject = Class()
classObject.Function()


