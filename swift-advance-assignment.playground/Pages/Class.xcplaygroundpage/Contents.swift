import UIKit

//Create a swift program to demonstrate swift class. Which has two variables inside class body. Access (Set its values and get its value.) these variables by creating one instance of class.

class Fan {
    
    var company: String = "Sony"
    var speed: Int = 24
    
}

var sonyFan = Fan()
print("speed is",sonyFan.speed," and company is",sonyFan.company)

//Create a swift program to demonstrate usage of swift class for usage of multiple initializers. Create one initializer with two parameters your name and college and another initializer with your name and department. You can be able to access these properties using instance of class.

class Student {
    
    var name: String
    var collage: String
    var department: String
    
    init(name: String , collage: String , department: String) {
        self.name = name
        self.collage = collage
        self.department = department
    }
    
   convenience init(name: String, collage: String){
       self.init(name: name, collage: collage, department: "Computer Engineering")
        
    }
    
    convenience init(name: String,department: String) {
        self.init(name: name, collage: "GEC Modasa", department: department)
       
    }
    
    
    
}

var student = Student(name: "rajan", collage: "GEC Modasa")
var otherStudent = Student(name: "rajan", department: "Computer Engineering")


print("name:",student.name , "college:",student.collage,"department:",student.department)

print("name:",otherStudent.name ,"collage:",otherStudent.collage, "department:",otherStudent.department)

//
//Create a swift class without initializers and access (write, read) its properties using instance of class.
//

class Chair {
    var color: String?
}

var chair = Chair()
chair.color = "red"
if let color = chair.color {
    print(color)
}


//Create a swift class which is having code to return square of given number and access this code using class instance.

class Maths {
    
    func square(number: Int) -> Int{
        return number*number
    }
}

var math = Maths()
math.square(number: 4)

//    Create a swift class example to show use of swift inheritance. Your base class has some property access this property. In two different child classes and show its usage using the instances of both child classes.

class Parant {
    
    var name: String = "Parent"
    
}

class ChildClass: Parant {
    
    private var childName: String = ""
    
    override var name: String {
        get {return childName}
        set { childName = newValue }
    }
    
}
class OtherChildClass: Parant {
    
    private var otherChildName: String = ""
    
    override var name: String {
        get{ return otherChildName }
        set { otherChildName = newValue }
    }
    
}

var child = ChildClass()
child.name = "rajan"
child.name

//Create a swift class example to show use of swift base class which have some implementation inside any method. Now demonstrate usage of overriding that method implementation.

class BaseClass {
    
    func printMessege(){
        print("i am Base Class")
    }
}

class ExtendedClass: BaseClass {
    override func printMessege() {
        print("i am Extended Class")
    }
}

var extended = ExtendedClass()
extended.printMessege()
//i am Extended Class


//Create a swift class with an initializer in a manner that you can create this class using initializing value. And one function which takes int input and returns the power of class instance.
//example:  let instance = Example(value: 5)
//    let result = instance.doPower(power: 3)
//then it should return 5's 3 power (125)



class Meth {
    
    var number: Int
    
    init(value: Int) {
        self.number = value
    }
    
    func doPower(power: Int) -> Int {
        
        var result = 1
        for _ in 1...power {
            
            result = result*number
            
        }
        return result
    }
}

var instance = Meth(value: 5)
var result = instance.doPower(power: 3)

//Create a swift class example which has a parent class for vehicles, and child classes for two different vehicles e.g. (bike & car). You need to use common properties and method in the parent class and inside child class, there will be some different property which is not common.

class Vehicle {
    
    var numberOfWheels: Int
    
    init(numberOfWheels: Int) {
        
        self.numberOfWheels = numberOfWheels
        
    }
    
}

class Bike: Vehicle {
    
    var price: Int
    
    init(price: Int ) {
        self.price = price
        super.init(numberOfWheels: 2)
    }
    
}

class Car: Vehicle {
    
    var price: Int
    
    init(price: Int){
        self.price = price
        super.init(numberOfWheels: 4)
    }
    
}

var car = Car(price: 4000000)
car.numberOfWheels
car.price

var bike = Bike(price: 70000)
bike.numberOfWheels
bike.price

//Create a person swift class with person name initializer and create one function to greet that person.
//Example: let person1 = Person(name: Joe)
//  Person1.greet() // This should print “Hello Joe”


class Person {

    var name: String
    init(name: String) {
        self.name = name
    }
    
    func greet(){
        print("Hello",name)
    }
    
}

var person = Person(name: "rajan")
person.greet()


//Create a swift class with some property. And then set its value using initializer of class, then perform below actions.
//let example1 = Example()
//Example1.a = “Hello”
//let example2 = example1
//example2.a = “Hi”
//print(example1.a)
//print(example2.a)
//// Consider ‘a’ as string property of example class.
//--> Check these two print outputs and try to find out the reason for that output.


class Example {
    var a : String = "rajan"
}

let example_one = Example()
example_one.a = "Hello"

let example_two = example_one
example_two.a = "Hi"
example_one.a
example_two.a

