//: [Previous](@previous)

import Foundation


// 13. Create one example of subscript using array. Create one array of weekdays and one subscript func which takes int as argument and returns day of week.
//  Output: WeekDays.subscript(day: 1) // will return Sunday Note: Handle invalid input.

struct WeekDays {
    var days = ["sunday","monday","tuesday","wednesday","thursday","friday","saturday"]
    
    subscript(day: Int) -> String {
        return day > 7 ?  "invalid input" :  days[day - 1]
    }
    
}

var weekDays = WeekDays()
weekDays[1]

// 14. Create a swift program to show usage of subscript in string. I pass int argument and it returns the character at given position.

var str = "rajan"
str[str.index(str.startIndex, offsetBy: 2)]
class AccessString {
    
    var name:String = "Rajan"
    subscript(index: Int) -> Character {
        return name[name.index(name.startIndex, offsetBy: index)]
        
    }
    
}

var accessString = AccessString()
accessString[2]

// 15. Create one swift subscript program which takes range as input and returns the string between the ranges.

class AccessByRange {
    var aString = "i am rajan"

    subscript(range: Range<Int>) -> String {
        var start = aString.index(aString.startIndex, offsetBy: range.startIndex - 1)
        var end = aString.index(start, offsetBy: range.endIndex - 1)
        return String(aString[start..<end])
    }
}



var accessByRange = AccessByRange()
accessByRange[1..<4]

// 16. I have one integer array and create one function which takes range as input and returns all elements between the range.


struct AccessArray {
    
    let array = [32,23,56,2,56,9]
    
    func returnRange(range: Range<Int>) -> [Int] {
        return Array(array[range])
    }
    
}

let accessArray = AccessArray()
accessArray.returnRange(range: 2..<6)




struct ArrayOfDict {
    
    let array =  [[1: "Hello"], [2: "Hi.."]]
    
    subscript(at: Int) -> String {
        
        for dict in array {
            if let value = dict[at] {
                return value
            }
        }
        return "invalid subscript input"
        
    }
    
}

var arrayOfDict = ArrayOfDict()
arrayOfDict[2]

// 18. Create one array of type Person and create one subscript function which takes person name as input and returns person info like name, age, birthdate etc.

struct Person {
    var name: String
    var age: Int
    var Birthday: String
}

struct PersonArray {
    
    var arrayOfPerson = [
            Person(name: "PD", age: 20, Birthday: "20/03/2023"),
            Person(name: "SD", age: 20, Birthday: "21/03/2023"),
            Person(name: "AD", age: 20, Birthday: "20/05/2023")
        ]


    subscript(name: String) -> Person? {
            for each in arrayOfPerson {
                if each.name == name {
                    return each
                }
            }
            return nil
        }
    
}

let person = PersonArray()
print(person["Sd"] ?? "No Such Person")

// 19. Create one base class of type Song and create subclasses of music types (Hip-Hop, classical) and show usage of inheritance.
// Here Music class have property singer, composer

class Song {
   
    var Name: String
    
    
    init(name: String) {
        self.Name = name
        
    }
    
}

class HipHop: Song {
    
    var singer: String
    var composer: String
    
    init(name: String, singer: String, composer: String) {
        self.singer = singer
        self.composer = composer
        super.init(name: name)
    }
    
}

class Classical: Song {
    
    var singer: String
    var composer: String
    
    init(name: String, singer: String, composer: String) {
        self.singer = singer
        self.composer = composer
        super.init(name: name)
    }
    
}


let hipHopSinger = HipHop(name: "Aaja", singer: "Arjit", composer: "Hasan")
print(hipHopSinger.singer)
let classicalSinger = Classical(name: "Aaja", singer: "Arjit", composer: "Hasan")
print(classicalSinger.Name)

// 20. Create a swift class with properties which can be read-write outside of class.

class Fan {
    
    var company: String
    var speed: Int
    
    init(company: String, speed: Int) {
        self.company = company
        self.speed = speed
    }
    
}

let sonyFan = Fan(company: "Sony", speed: 200)
print(sonyFan.company)
print(sonyFan.speed)
sonyFan.speed = 500
print(sonyFan.speed)
