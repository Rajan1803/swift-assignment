import UIKit

var greeting = "Hello, playground"

var array = [3,2,7,1,9,4,6]

var newArray = array.map({$0*2})
print(newArray)
var array_two = array.map({ num in num % 2 == 0 })
print(array_two)

print(array.map({$0 % 2}))

var dict: [String: String] = [:]

dict["firstName"] = "rajan"
dict["lastName"] = "patel"
dict["city"] = "ahmedabad"

print(dict)

var dKeys = dict.map({ $0.key })
print(dKeys)
print(dict.map({ ($0.key, $0.value) }))
(dict.map({ print("0 \($0)"); print($1) }))
dict.map({ print($0.key)  })

print(dict.map({ ($0.uppercased(),$1.capitalized) }))

var dict2 = Dictionary( uniqueKeysWithValues: dict.map( { ( $0.key.uppercased() , $0.value.capitalized ) } ))

print(dict2)

print(dict)

print(dict.mapValues( { $0.capitalized } ))


class Tester {
    var name: String
    var age: Int
    
    init(name: String, age: Int){
        self.name = name
        self.age = age
    }
}

var testerArr = [Tester(name: "rajan", age: 22 ), Tester(name: "sagar", age: 21 ) , Tester(name: "PD", age: 29)]

print(testerArr.map( { ( $0.name ) } ))

var arr1 = [5,2,76,12,4,9,34]

print(arr1.map( { ($0 != nil ? $0 : -1) } ))
print(arr1.compactMap( { $0 } ))

var arrayOfArray = [[3,4,5],[1,6,2],[7,8,9]]
print(arrayOfArray.flatMap( { $0  } ))

print(arr1.filter( {

        return $0 % 2 == 0
  
}))


class Person {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
        
    }
    
    
}

var persons = [Person(name: "rajan", age: 22) , Person(name: "sagar", age: 21) , Person(name: "PD", age: 29),Person(name: "rajan2", age: 24) , Person(name: "sagar2", age: 23) , Person(name: "PD2", age: 32)]

var personArr = persons.filter( { $0.age > 22 && $0.name.hasPrefix("s") } )
personArr


var arr = [1,67,3,2,6,7,1,7]

print(arr.reduce(0, { $0 + $1 } ))

print(arr.contains(where: {$0 > 50}))

arr.removeAll(where:{ $0 > 50 })

print(arr.sorted{ $0 > $1 })
print(arr)

var str = " i am      rajan "
var splitStr = str.split( omittingEmptySubsequences: true ,whereSeparator: { $0 == " " } )
type(of: splitStr)
print(splitStr)
var typeC = splitStr.map( { String($0) } )
type(of:  typeC )

print(arr)
arr.forEach( { $0 > 5 ? print("greater than 5") : print("less than 5") } )
 
