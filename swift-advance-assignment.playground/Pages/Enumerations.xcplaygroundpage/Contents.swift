//: [Previous](@previous)

import Foundation


//Write swift program using enumerations to check week day from given number. Consider Monday as 1 and Sunday as 7. We can be able to get day name as string in short form (sun, mon,...) and same full name (Sunday, Monday...) by given number of the day.
//Example. It should return Monday or mon if I pass parameter 1 for get day name.

enum DayOfWeek: Int {
    case monday = 1, tuesday , wednesday , thursday , friday ,saturday , sunday
    
   static func getDay(num: Int) -> String {
        switch num {
        case 1: print("monday")
            return "mon"
        case 2:print("tuesday")
            return "tue"
        case 3:print("wednesday")
            return "wed"
        case 4:print("thursday")
            return "thu"
        case 5:print("friday")
            return "fri"
        case 6:print("saturday")
            return "sat"
        case 7:print("sunday")
            return "sun"
        default:
            return "no such day"
        }
    }
    
}



DayOfWeek.getDay(num:2)


// 2. Create one enumeration program to return number of days in a month.
enum DaysInMonth {
    
    case jan, feb(leapYear: Bool), mar, apr, may, jun, jul, aug, sep, oct, nov, dec
    
    func daysOfMonth() -> Int {
        switch self {
        case .jan, .mar, .may, .jul, .aug, .oct, .dec:
            return 31
        case let .feb(leapYear):
            return leapYear ? 29 : 28
        default:
            return 30
        }
    }
    
}

let january = DaysInMonth.jan
let februaryLeap = DaysInMonth.feb(leapYear: true)
let FebNonLeap = DaysInMonth.feb(leapYear: false)
let april = DaysInMonth.apr
print(FebNonLeap.daysOfMonth())
print(january.daysOfMonth())
print(april.daysOfMonth())
print(februaryLeap.daysOfMonth())

// 3. Write a swift program using enumerations to demonstrate Int enums.

enum RawEnum: Int {
    
    case zero, one, two, three
    
}

RawEnum.init(rawValue: 1)
RawEnum.two


enum StringEnum: String {
    
    case zero, one, two, three // by default values will be same value as case name in String
    
}

StringEnum.init(rawValue: "zero")
StringEnum.two

// 6. Write a swift program using enumerations to get all cases as an array with use of CaseIterable(Optional) and without use of CaseIterable(Mandatory).

enum Subjects: Int , CaseIterable {
    case maths ,science , english , computer

    static func withoutCaseIteratable(value: Int) -> Subjects? {
        
        switch value {
        case 0: return Subjects.maths
        case 1: return Subjects.science
        case 2: return Subjects.english
        case 3: return Subjects.computer
        default: return nil
        }
        
    }
}

for subject in Subjects.allCases {
    print(subject)
}

for i in 0... {
    if let subject = Subjects.withoutCaseIteratable(value: i){
        print(subject)
    }else {
        break
    }
    
}


// 7. Write a swift program using enumerations for learn and demonsrate enum cases with parameters (Enum with associated values).

enum AssociatedEnum {
    
    case marks(Int, Int, Int, Int)
    case area(Int, Int, String)
    case age(Int)
    
}

// here are different assosiated values enum
let marks = AssociatedEnum.marks(2, 8, 4, 6)

let area = AssociatedEnum.area(10, 20, "rajan")
let age = AssociatedEnum.age(2023)

// 8. Create an enum with its rawValues of type String and show usage of case to print value of case.

enum Company: String {
    
    case small, medium , large = "simform"
    
}

print(Company.small.rawValue)
print(Company.large.rawValue)

