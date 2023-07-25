//: [Previous](@previous)

import Foundation


protocol Delegate: AnyObject {
    
    func passData(name: String)
    
}

class Person: Delegate {
    
    func passData(name: String) {
        print(name)
    }
    
}

class People {

    var name = "rajan"
    weak var delegate: Delegate?
   
    func callDelegate() {
        delegate?.passData(name: name)
    }
    
}

var screenOne = Person()
var second = People()
second.delegate = screenOne
second.callDelegate()
