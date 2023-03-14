import UIKit

var greeting = "Hello, playground"

protocol FullyNamed {
     var fullName: String { get }
}

struct Person: FullyNamed {
     var fullName: String
    
    
}

//Person.fullName


var person = Person(fullName: "rajan patel")
person.fullName
person.fullName = "patel"
person.fullName

class Starship: FullyNamed {
    var prefix: String?
    var name: String
    init(name: String, prefix: String? = nil) {
        self.name = name
        self.prefix = prefix
    }
    var fullName: String {
        return (prefix != nil ? prefix! + " " : "") + name
    }
}
var ncc1701 = Starship(name: "Enterprise", prefix: "USS")
ncc1701.fullName
// ncc1701.fullName is "USS Enterprise"

protocol togglable {
   mutating func toggle()
}

enum Switch : togglable {
    case on , off
   mutating func toggle() {
        switch self {
        case .on : self = .off
        case .off : self = .on
        }
    }
}

var toggleSwitch = Switch.off
toggleSwitch
toggleSwitch.toggle()
toggleSwitch

//protocol SomeProtocol {
//    init(someParameter: Int)
//}
//
//class SomeClass: SomeProtocol {
//     required init(someParameter: Int) {
//        // initializer implementation goes here
//    }
//}

protocol SomeProtocol {
    init()
}

class SomeSuperClass {
    init() {
        // initializer implementation goes here
    }
}

class SomeSubClass: SomeSuperClass, SomeProtocol {
    // "required" from SomeProtocol conformance; "override" from SomeSuperClass
    required  override init() {
        // initializer implementation goes here
    }
}

