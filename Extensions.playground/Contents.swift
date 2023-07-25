import UIKit

var greeting = "Hello, playground"

extension Double {
    var km: Double { return self * 1_000.0 }
    var m: Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084 }
    var twise: Double { return self * 2 }
}
let oneInch = 25.4.mm
print("One inch is \(oneInch) meters")
// Prints "One inch is 0.0254 meters"
let threeFeet = 3.ft
print("Three feet is \(threeFeet) meters")
// Prints "Three feet is 0.914399970739201 meters"
4.twise


struct Size {
    var width = 0.0, height = 0.0
}
struct Point {
    var x = 0.0, y = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
}

let defaultRect = Rect()
let memberwiseRect = Rect(origin: Point(x: 2.0, y: 2.0),
    size: Size(width: 5.0, height: 5.0))

extension Rect {
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

let centerRect = Rect(center: Point(x: 4.0, y: 4.0),
    size: Size(width: 3.0, height: 3.0))
// centerRect's origin is (2.5, 2.5) and its size is (3.0, 3.0)


extension Int {
    func repetitions(task: () -> Void) {
        for _ in 0..<self {
            task()
        }
    }
}

3.repetitions {
    print("Hello!")
}
// Hello!
// Hello!
// Hello!

extension Int {
    mutating func square() {
        self = self * self
    }
}
var someInt = 3
someInt.square()
// someInt is now 9

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
// returns 5
746381295[1]
// returns 9
746381295[2]
// returns 2
746381295[8]
// returns 7

extension Int {
    enum Kind {
        case negative, zero, positive
    }
    var kind: Kind {
        switch self {
        case 0:
            return .zero
        case let x where x > 0:
            return .positive
        default:
            return .negative
        }
    }
}

func printIntegerKinds(_ numbers: [Int]) {
    for number in numbers {
        switch number.kind {
        case .negative:
            print("- ", terminator: "")
        case .zero:
            print("0 ", terminator: "")
        case .positive:
            print("+ ", terminator: "")
        }
    }
    print("")
}
printIntegerKinds([3, 19, -27, 0, -6, 0, 7])
// Prints "+ + - 0 - 0 + "

extension Double {
    
    enum Kind {
        case positive , zero , nagative
    }
    
    var kind: Kind {
        switch self {
        case 0 : return .zero
        case let x where x > 0 : return .positive
        default: return .nagative
        }
    }
    
}

var value = 2.3
value.kind
value = -2.3
value.kind
value = 0
value.kind


class Student {
    var name: String
    var physics = 87
    var chamistry = 67
    var maths = 89
    init(name: String) {
        self.name = name
    }
    
}

extension Student {
    var totelMarks: Int {
        return physics + chamistry + maths
    }
    
    convenience init(name: String , phy: Int,cham: Int,math: Int){
        self.init(name: name)
        self.physics = phy
        self.chamistry = cham
        self.maths = math
    }
    
    subscript(subject: String) -> Int {
        get {
                if subject.elementsEqual("physics") {
                      return self.physics
                  }else if subject.elementsEqual("Chemistry") {
                      return self.chamistry
                  }else if subject.elementsEqual("maths") {
                      return self.maths
                  }
          
                  return 0
        }
        set {
            if subject.elementsEqual("physics") {
                self.physics = newValue
              }else if subject.elementsEqual("chemistry") {
                  self.chamistry = newValue
              }else if subject.elementsEqual("maths") {
                  self.maths = newValue
              }
      
              
        }
        
//        if subject.elementsEqual("physics") {
//            return self.physics
//        }else if subject.elementsEqual("Chemistry") {
//            return self.chamistry
//        }else if subject.elementsEqual("maths") {
//            return self.maths
//        }
//
//        return nil
    }
    
}

var student = Student(name: "rajan",phy: 23,cham: 13,math: 32)
student.physics
student.maths
student.chamistry
student.totelMarks
student["maths"]
student["maths"] = 39
student["maths"]

extension Student {
    
    func changeValue(value: Int) {
        self.maths = value
        self.chamistry = value
        self.physics = value
    }
}
student.changeValue(value: 33)
student.physics
student.maths
student.totelMarks

