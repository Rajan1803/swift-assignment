//: [Previous](@previous)

import Foundation

// 1. Create one structure of type Work, which have some properties like work location, work hours and one string array of project names. And create a function inside structure which returns all project names for the person.

struct Work {
    
    var location: String
    var hours: Int
    var projectNames: [String]
    
    func getProjectNames() {
        projectNames.forEach {
            print($0)
        }
    }
    
}

let work = Work(location: "ahm", hours: 8, projectNames: ["develop app","develop site"])

work.getProjectNames()

// 2. Create a structure example which demonstrates use of initializer in structures.

struct Monitor {
    
    var screenSize: Int
    
    init(size: Int) {
        self.screenSize = size
    }
    
}

var monitor = Monitor(size: 10)
monitor.screenSize

// 4. Create one structure which have initializer which takes array of int as input returns  two arrays one of all even numbers and another is all odd numbers.
//Input: [1, 3, 5, 6, 8, 10, 9, 7, 8, 12]
//Output: even numbers are: [6, 8, 10, 8, 12]
//Odd numbers are: [1, 3, 5, 9, 7]

struct ArrayOfInt {
    
    var numbers: [Int]
    
    init(numbers: [Int]) {
        self.numbers = numbers
    }
    
    func getEvenOddArray() -> (even: [Int],odd: [Int]) {
        var evenArray: [Int] = []
        var oddArray: [Int] = []
        
        for element in numbers {
            if element%2 == 0 {
                evenArray.append(element)
            }else {
                oddArray.append(element)
            }
        }
        return (evenArray, oddArray)
    }
    
}

var arrayofint = ArrayOfInt(numbers: [3,54,65,34,3,6,3])
var twoArrays = arrayofint.getEvenOddArray()
print("even numbers are",twoArrays.even)
print("odd numbers are",twoArrays.odd)



// 5. Create one swift structure program for person that contains basic details like name, age, gender. Then create one array of person with all details. Print all details of that array.
// Consider two persons array for Joe and Harry. But in your code Its size can be vary.
//Output be like: Name: Joe, Gender: Male, Age: 27
//      Name: Harry, Gender: Male, Age: 21


struct Person {
    
    var name: String
    var age: Int
    var gender: String
    
    init(name: String, age: Int, gender: String) {
        self.name = name
        self.age = age
        self.gender = gender
    }
    
}

var arrayOfPerson = [Person(name:"rajan" ,age: 22, gender: "male"),Person(name: "sagar",age: 21, gender: "male" ),Person(name: "priyanshu",age: 21, gender: "male")]

for person in arrayOfPerson {
    print("name:",person.name,"age:",person.age,"gender:",person.gender)
}



// 6. Perform same example given in class question no 10 and check output using structure. Try to find difference between these two outputs and try to figure out the reason for that output.
// Try to figure out basic difference between class and structures and give a demo for same.

struct Table {
    
    var height: Int
    var width: Int
    
}

var small_table = Table(height: 50, width: 50)
small_table.height
small_table.width
var table = small_table
table.height = 10
table.height
table.width
small_table.height // this value will not change becouse table = small table create new structure and copy its values so structure is value type
small_table.width
