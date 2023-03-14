import UIKit

var greeting = "Hello, playground"
print("hello")


protocol Interface {
     var name: String { get }
    init(name: String)
    mutating func changeName(name: String)
}

class Person1: Interface {
    
    required init(name: String) {
        privateName = name
    }
    
    private  var privateName: String = ""
    func changeName(name: String) {
        privateName = name
    }
//    class var name: String = "rrr"
    var name: String {
        get {privateName}
        set {
            privateName = newValue
        }
    }
}


var p1 = Person1(name: "String")

p1
print("hello")
print(type(of: p1))
//Person1.name = "rajan"
//print(Person1.name )
p1.name
p1.changeName(name: "rajan")
p1.name
//var interface: Interface = Person1()
//Person1.name

//interface.name = "rajan"

struct Structure: Interface {
     var name: String = ""
    
    mutating func changeName(name: String) {
        self.name = name
    }
    
}

var strucure = Structure()

strucure.name

protocol Togglable {
    mutating func toggle()
    var name: String {get}
}

enum OnOffSwitch: Togglable {
    case off, on
    var name: String {
        return "akjdshf"
    }
    mutating func toggle() {
        switch self {
        case .off:
            self = .on
        case .on:
            self = .off
        }
    }
}

var lightSwitch = OnOffSwitch.off
lightSwitch.toggle()
lightSwitch.name


//delegate

protocol MyDelegate: AnyObject {
    var name: String {get set}
    func changeName(name:String)
}

class WorkerClass: MyDelegate {
    var name: String = "rajan"
    
    func changeName(name: String) {
        print("name is \(name)")
    }
}

class MyWork {
    
    var myName: String = ""
    
    weak var delegate: MyDelegate?
    func setName(){
        delegate?.changeName(name: myName)
        
    }
    
}

var mywork = MyWork()
mywork.myName = "rajan"
var worker = WorkerClass()
mywork.delegate = worker
mywork.setName()

protocol Failable {
 //   init(name: String)
    func failableFunc()
}

class FailableInit: Failable {
    func failableFunc() {
        print("inside failablefunc")
    }
    

   // required init(name: String){}
    
}

extension Array: Failable where Element == Failable {
    func failableFunc() {
        
    }
    
    
}
//var f = FailableInit()

struct ST: Equatable {
    var x = 0 , y = 0 , z = 0
}

var st1 = ST(x: 2,y: 4,z: 6)
var st2 = ST(x: 2,y: 4,z: 6)

 st1 == st2

enum Category: Equatable {
    case beginners
    case intermediate
case expert(years: String)
}

var category1: [Category] = [Category.expert(years: "a"),Category.beginners,Category.expert(years: "b") ,Category.intermediate]

category1[0] == category1[2]
//category1.sorted()
//category1
//for element in category1.sorted() {
//    print(element)
//}

var arrayOfProtocol: [Failable] = [FailableInit(),FailableInit()]


protocol SomeProtocol {
    var someProtocolName: String {get set}
}
protocol OtherProtocol: SomeProtocol {
    var otherProtocolName: String {get set}
}



class someClass: OtherProtocol, SomeProtocol {
    
    var someProtocolName: String = "rajan"
    var otherProtocolName: String = "patel"
    
    
}


func composition(to compose: OtherProtocol & SomeProtocol ) {
    print("this is composion func")
}

var someclass = someClass()
composition(to: someclass)

protocol HasArea {
    var area: Double { get }
}

class Circle: HasArea {
    let pi = 3.1415927
    var radius: Double
    var area: Double { return pi * radius * radius }
    init(radius: Double) { self.radius = radius }
}
class Country: HasArea {
    var area: Double
    init(area: Double) { self.area = area }
}

class Animal {
    var legs: Int
    init(legs: Int) { self.legs = legs }
}

let objects: [AnyObject] = [
    Circle(radius: 2.0),
    Country(area: 243_610),
    Animal(legs: 4)
]

for object in objects {
    if let objectWithArea = object as? HasArea {
        print("Area is \(objectWithArea.area)")
    } else {
        print("Something that doesn't have an area")
    }
}
// Area is 12.5663708
// Area is 243610.0
// Something that doesn't have an area
