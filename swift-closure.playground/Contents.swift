import UIKit

var greeting = "Hello, playground"

var birthday = {
    print("happy Birthday")
}

birthday()

var advBirthday:(String) -> () = {
    (name: String) -> () in
    print(name)
}

advBirthday("rajan")


var closure: (String , String) -> () = {
//    (time:String , name: String) -> () in
//    print("good \(time) \(name)")
//    time , name in
//    print("good \(time) \(name)2")
    print("good \($0) \($1)")
}
closure("morning","rajan")

// scope
var c = 34
var closure2 = {
    print("value of c is \(c)")
}
closure2()


func scopeClosure(points: Int) -> Int {
    var score = 20
    
    var closure3 = {
        return score+points
    }
    
    return closure3()
}

print(scopeClosure(points: 23))

func function1(closure: (Int) -> Int,number: Int){
    var c = closure(number)
    print(c)
}

function1(closure: { $0+1 }, number: 6)


// functions

func outerFunction() -> (() -> (() -> Int?)?)? {
    
    func middleFunction() -> (() -> Int? )? {
        
        func innerFunction() -> Int? {
            return 1
        }
        
        return innerFunction
    }
    return middleFunction
    
}

var function2 = outerFunction()

if let function2{
    var function3 = function2()
    if let function3{
        var value = function3()
        print(value ?? 0)
    }
    
}


func incremement(number: Int) -> () -> Int {
    var ans = 0
    func inc() -> Int {
        ans += number
        return ans
    }
    
    return inc
   // return { Value + number}
}

var incrementByThree = incremement(number: 3)
var incrementByFour = incremement(number: 4)
//type(of: incrementByFour)
incrementByThree()

incrementByThree()



//closure

func f1(closure: (Int,Int)->Int, num1: Int, num2: Int) -> Int {
    return closure(num1,num2)
}

print(f1(closure: { $0+$1 }, num1: 2, num2: 4))
// ARC

class Person {
    let name: String
    
    init(name: String) {
        self.name = name
       // print("new instance of name \(name) is created")
    }
    deinit {
       // print("instance with name \(name) is deallocated")
    }
}

var person1: Person?
var person2: Person?
var person3: Person?

person1 = Person(name: "rajan")
person2 = Person(name: "sagar")

person3 = person1

person2 = person1

person1 = nil
person2 = nil
person3 = nil

class Traveller {
    var name: String
    var account: Account?
    init(name: String) {
        self.name = name
        print("traveller is initialized with name \(self.name)")
    }
    deinit {
        print("traveller is deinitialized with name \(self.name)")
    }
}

class Account {
    var id : Int
    unowned var traveller: Traveller
    
    func justPrint(){
        print(#function)
    }
    
//    init(num: Int){
//        self.id = num
//        print("account is initialized by value \(self.id)")
//    }
//
    init(num: Int , trav: Traveller){
        self.id = num
        self.traveller = trav
        print("account is initialized by both")
    }
    
    deinit {
        print("account is deinitialized with value \(self.id)")
    }
    
}

var traveller: Traveller? = Traveller(name: "rajan")
var account: Account? = Account(num: 1,trav: traveller!)
if let traveller , let account {
    
    traveller.account = account
  // a1.traveller = t1
   // print(a1.traveller!.name)
    print(account.traveller)
    type(of:  account.traveller)
    
}

traveller = nil
//print(a1?.traveller)
account = nil
//
//class TaskManager
//{
//var onTaskFinished:(() -> Void)?
//
//func startLengthyTask(completionHandler: @escaping () -> Void)
//{
//// Store completion handler for later
//onTaskFinished = completionHandler
//
//// Do lengthy task
//// …
//}
//
//func onLengthyTaskFinished() {
//onTaskFinished?() // Call completion handler
//}
//}
//
//let task = TaskManager()
//task.startLengthyTask(completionHandler: {
//// Do this when task has finished…
//})
////
////
//class Student {
//    var storeClosure:(() -> Void)?
//
//    func onLengthyTask(complitionHandler: @escaping () -> Void){
//        print(type(of: complitionHandler))
//        storeClosure = complitionHandler
//    }
//
//    func onCompletion() {
//        storeClosure!()
//    }
//
//}
//
//
//var student1 = Student()
//
//student1.onLengthyTask(complitionHandler: {
//    print("closure called")
//})
//student1.onCompletion()

//var a: Int? = nil
//
//print(a!)

class Student {
    var name: String
    var teacher: Teacher?
    
    init(name: String) {
        self.name = name
        
        print("Student Created")
    }
    
    deinit {
        print("student Deleted")
    }
    
}

class Teacher {
    var name: String
    weak var student : Student?
    init(name: String, student: Student?) {
        self.name = name
        self.student = student
        print("Teacher Created")
    }
    
    deinit {
        print("teacher Deleted")
    }
}

var student: Student? = Student(name: "Rajan")
var teacher: Teacher? = Teacher(name: "sagar", student: student)
//student?.teacher = teacher



student = nil
teacher?.student
teacher = nil



// AutoClosure
func closureDemo(_ autoClosure: @autoclosure () -> Void ) {
    autoClosure()
}
closureDemo( { print("AC called") }() )


class Place {
    var name : String
    
    init(name:String) {
        self.name = name
    
        print("place is created")
    }
    
    func printName(closure: ()->()){
       
        
    }
    
    func printPlace(){
        
    }
    deinit {
        print("place is deallocated")
    }
}

class Persion {
    var name: String
    var place = Place(name: "T M")
    init(name: String) {
        self.name = name
        print("person created")
    }
    
    
    func perFunc(){
        place.printName { [ self]
            self.doSomething()
        }
    }
    
    func doSomething(){
        
    }
    
    
    deinit{
        print("person deallocated")
    }
    
    
        
}

var person: Persion? = Persion(name: "rajan")
person?.perFunc()
person = nil

// closure - class reference cycle
class Details {
    var name: String
    var closure: (() -> ())?
    
    init(name:String){
        self.name = name
        print("details is allocated")
        
        closure = { [unowned self] in
            self.name = ""
        }
    }
    deinit{
        print("DD details is deallocated")
    }
}

var d1: Details? = Details(name: "rajan")
d1 = nil
//d1 = nil
//class ll {
//    var cl: (() -> ())?
//    func a(){
//        var d: Details = Details(name: "add")
////        d = nil
//        cl = d.closure
//    }
//    deinit{
//        print("ll deallocated")
//    }
//}
//func abcd(){
//    var lla = ll()
//    lla.a()
//
//    lla.cl?()
//}
//abcd()
//
////var detail: Details? = Details(name: "rajan")
////detail?.closure()
////detail = nil
//
