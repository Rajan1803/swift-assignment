//: [Previous](@previous)

import Foundation

// 1. Create an example using swift to demonstrate use of get only properties. Create a class with a property which value cannot be set outside of class.
// Output: for example, your class Demo has one property of string type then you can be able to set it within a class. If I try set it outside of class it must give an error.


class Person {
    
    private(set) var name: String = "rajan"
    
    func changeName(newName: String) {
        name = newName
    }
}

var person = Person()
person.name
//person.name = "sagar"
// error
person.changeName(newName: "sagar")
person.name


// 2. Create a swift program to demonstrate usage of computed properties using getter and setter.


class Peoples {
    private var privateName: String
    var name: String {
        get {
            return privateName
        }
        set {
            privateName = newValue
        }
    }
    
    init(name: String) {
        privateName = name
    }
}

var people = Peoples(name: "rajan")
people.name
people.name = "sagar"
people.name


// 3. Create a swift program to show usage of stored properties.

struct Bike {
    var speed: Int
}
var bike = Bike(speed: 100)
bike.speed

// 4. Create a swift program which has private properties which cannot directly be accessed. Means we cannot directly read or write it.

class Moter {
    private var price: Int = 100
    var model: String = "model 1"
}

var moter = Moter()
moter.model
//moter.price it will give error becouse price is private


// 5. Create one swift class which have two properties name and id, the class must have one initializer to set that properties. And create one array of that class types.
// Output: My class is Person and properties are id and name, then create an array of person. And print all elements of that array.


class Human {
    
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
}
    
var arrayOfHuman = [Human(name: "rajan", age: 22), Human(name: "sagar", age: 21), Human(name: "priyanshu", age: 21)]

for element in arrayOfHuman {
    print(element.name, "is", element.age)
}

// 6. Create one example of usage of willSet and didSet.

class Observe {
    var value: Int = 0 {
        willSet {
            print("upcomming value: ",newValue,"value now:",value)
        }
        didSet {
            print("old value:",oldValue , "currentValue:",value)
        }
    }
}

var observe = Observe()
observe.value = 2

// 7. Create one lazy stored property in a class and show usage of it.



class Name {
    var first_name: String
    var last_name: String
    lazy var full_name: String = first_name + " " + last_name
    
    init(first_name: String,last_name: String) {
        self.first_name = first_name
        self.last_name = last_name
    }
}

var name = Name(first_name: "rajan",last_name: "patel")
name.full_name

// 8. Create one class as Base type Person which has common properties like name, occupation, etc. Create two child classes from the person which are Student, Employee and this two-child classes must have base properties and some other properties also. Example, student have college, but Employee have company. And demonstrate the usage of inheritance.


class PersonClass {
    var name: String
    var occupation: String
    
    init(name: String, occupation: String) {
        self.name = name
        self.occupation = occupation
    }
}

class StudentClass: PersonClass {
    
    var college: String
    
    init(college: String,name: String) {
        self.college = college
        super.init(name: name,occupation: "student")
    }
    
}

class Employee: PersonClass {
    
    var company: String
    
    init(company: String, name: String) {
        self.company = company
        super.init(name: name, occupation: "Employee")
    }
    
}

var student = StudentClass(college: "GEC modasa",name: "rajan")
student.name
student.college
student.occupation

var employee = Employee( company: "simform", name: "rajan")
employee.name
employee.company
employee.occupation

// 9. Create one structure to show usage of mutating function in swift.

struct Mutate {
    
    var name: String
    var age: Int
    
   mutating func changeInfo(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
}


// 10. Create one class inheritance demo to show usage of method overriding.

class Base {
    
    func printGreeting(name: String) {
        print("hello,",name)
    }
    
}

class Child: Base {
    override func printGreeting(name: String) {
        print("hii,",name)
    }
}

var childInstance = Child()
var baseInstance = Base()
baseInstance.printGreeting(name: "rajan") //hello, rajan
childInstance.printGreeting(name: "rajan") // hi, rajan

// 11. Create one swift class to show usage of type methods.
// 12. Create one swift class which is having class method and static method. Then in one child class try to override that methods and check the output/ error. (you will learn difference between class and static)

class Office {
    
    var name: String
    var address: String
    static var headCount: Int = 5
    init(name: String,address: String) {
        self.name = name
        self.address = address
        
    }
    
    static func getHeadCount() -> Int{
        return headCount
    }
    
    class func getHeadCounts() -> Int {
        return headCount
    }
    
}

Office.headCount
Office.getHeadCount()
Office.getHeadCounts()
class SubOffice: Office {
//    override func getHeadCount() -> Int{
//        return 0
//    }
    // throws error
    
    override class func getHeadCounts() -> Int {
        return headCount
    }
}

SubOffice.getHeadCounts()
