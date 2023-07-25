import UIKit

var greeting = "Hello, playground"


enum VendingMachineError: Error {
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}


struct Item {
    var price: Int
    var count: Int
}

class VendingMachine {
    var inventory = [
        "Candy Bar": Item(price: 12, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Pretzels": Item(price: 7, count: 11)
    ]
    var coinsDeposited = 500

    func vend(itemNamed name: String) throws {
        guard let item = inventory[name] else {
            throw VendingMachineError.invalidSelection
        }

        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }

        guard item.price <= coinsDeposited else {
            throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }

        coinsDeposited -= item.price

        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem

        print("Dispensing \(name)")
    }
}

var ventMachine = VendingMachine()
try ventMachine.vend(itemNamed: "Chips")

enum MyErrors: Error {
    case invalidname
    case lowBalance
    
}

class Perchase {
    var items = ["mango":10,"banana": 20,"apple": 25]
    var balance = 100
    func getItem(name: String) throws {
        guard let value = items[name] else {
            throw MyErrors.invalidname
        }
        
        guard balance >= items[name] ?? 0 else {
            throw MyErrors.lowBalance
        }
    }
}

var perchase = Perchase()

do {
    try perchase.getItem(name: "bananna")
} catch {
    print("error in catch",error)
}


private class Sagar {
    public func abc(){
        
    }
}


// defer

func captureTest() {
   var fullName = "Mohit Chouhan"
   defer {
       print("defer",fullName)
       print("second line")
       
       
   }
    defer {
        print("defer 2")
    }
    print("hello")
   fullName = "Mohit Sharma"
   print(fullName)
}
captureTest()


enum Errors: Error {
    case outOfStock
    case lowBalance(coinNeeded: Int)
    case invalidInput
}

func buyItem(balance: Int,name: String) throws -> Int{
    let minbalance = 10
    
    if balance < minbalance {
        
        throw Errors.lowBalance(coinNeeded: minbalance - balance)
        
    }
    
    guard !name.hasPrefix("d") else {
        throw Errors.invalidInput
    }
    
    return 1
    
    
}

 var returnedValue = try? buyItem(balance: 33, name: "rajan")
print(returnedValue ?? 0)

//print(returnedValue ?? 0)

do {
    try buyItem(balance: 55, name: "r")
   // "dame".hasPrefix("d")
    print("after ty")
}catch Errors.lowBalance(let coinNeeded){
    print("catched",coinNeeded)
}
defer {
    print("i am defer")
}


