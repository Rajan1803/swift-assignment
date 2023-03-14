import UIKit

var greeting = "Hello, playground"

class Student{
    var name: String
    
    required init(name: String){
       
        self.name =  name
    }
    
    deinit {
        self.name = ""
        print("student is deallocated")
    }
}

var student: Student? = Student(name: "rajan")

student?.name
var nilStudent = Student(name: "")
student = nil

class Teacher: Student {
    var teacherName: String
    required init(name: String) {
        self.teacherName = name
        super.init(name: name)
    }
}

//deinit


class Temperature {
    var celsius: Float = 0.0
    var fahrenheit: Float {
        get {
            return ((celsius * 1.8) + 32.0)
        }
        set {
            celsius = (newValue - 32)/1.8
        }
    }
}


let temp = Temperature()
temp.fahrenheit = 99
print (temp.celsius)
//
//struct TestLazy {
//    var name: String
//
//   lazy var description: String = {
//        "my name is \(name)"
//    }()
//}
//var test1 = TestLazy(name: "Rajan")
//test1.description
//


struct Object {
    var name: String
    
     mutating func setName() {
         self.name = "rajan"
    }
}

var object = Object(name: "")
object.setName()
object.name

enum Students: Int {
    case name = 2 , marks = 3 , address = 4
    
    mutating func setName() {
        self = .marks
    }
}
var students = Students.marks
students
students.setName()
students
//st2.rawValue = 30
students.rawValue

class Teachers {
    static var name: String = "rajan"
    
//    init(){
//        name = "rajan"
//    }
//
    static func printName() {
        print(name)
    }
}

Teachers.printName()

class Element {
    static var name: String = "rajan"
    
    
}
struct Station {
    var name = "patel"
}

var element_one = Element()
var elemet_two = Element()
Element.name

