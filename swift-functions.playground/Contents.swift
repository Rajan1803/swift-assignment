import UIKit

var greeting = "Hello, playground"

func greet(person: String) -> String {
    return "Good Moring \(person)"
}

print(greet(person: "rajan"))

func greet(person: String,alreadyGreeted: Bool) {
    if alreadyGreeted {
        print("already Greeted")
    }else {
        print(greet(person: person))
        
    }
}

greet(person: "sagar",alreadyGreeted: false)


// multiple return values

var arr1 = [6,4,7,2,8,9,1]

func findMinMax(array: [Int]) -> (min:Int,max:Int)? {
    if array.isEmpty{ return nil }
    var min = array[0]
    var max = array[0]
    
    for ele in array {
        if ele < min {
            min = ele
        }else {
            max = ele
        }
    }
    return (min,max)
}

if let minMaxT2 = findMinMax(array: arr1){
    print("min is \(minMaxT2.min) and max is \(minMaxT2.max)")
}
//
//var minMaxT = findMinMax(array: arr1)
//print("min is \(minMaxT.min) and max is \(minMaxT.max)")
//
//
func aGreet(person: String) -> String {
    "good Morning \(person)"
}

print(aGreet(person: "RR"))


func addition(_ number1: Int,with number2: Int = 10) -> Int {
     number1+number2
}

print(addition( 3))


//variadic parameters

func findAVG(values array: Int...) -> Double {
    var sum = 0
    for ele in array{
        sum = sum + ele
        
    }
    return Double(sum)/Double(array.count)
}
print(findAVG(values: 2,4,6,10))

var a = 20
var b = 10

func swap(_ number1:inout Int , _ number2:inout Int) {
    var temp = number1
    number1 = number2
    number2 = temp
}

a
b
swap(&a, &b)
a
b

func printName(name: String) -> String {
    "\(name)"
}

printName(name: "RR")
var printName2 = printName
print(printName2("rajan"))


func addTwoInts(number1: Int,number2: Int) -> Int {
    number1 + number2
}

func mulTwoInts(number1: Int,number2: Int) -> Int {
    number1*number2
}

func divTwoInts(number1: Int,number2: Int) -> Double {
    Double(number1)/Double(number2)
}

print(addTwoInts(number1: 2, number2: 4))
print(mulTwoInts(number1: 2, number2: 4))
print(divTwoInts(number1: 6, number2: 5))

func math(calculate: ((Int,Int) -> Int)... , a:Int , b:Int) -> Int {
    calculate[0](a,b)
}

math(calculate: addTwoInts, a: 2, b: 9)
math(calculate: mulTwoInts, a: 2, b: 8)

func moveForword(number:inout Int) {
    number+=1
    
}

func moveBackword(number:inout Int) {
    number-=1
}

func chooseFun(forword: Bool) -> (inout Int) -> () {
    forword ? moveForword : moveBackword
}

var nn = 3

var moveNearZero = chooseFun(forword: nn < 0)
moveNearZero(&nn)
moveNearZero = chooseFun(forword: nn < 0)
moveNearZero(&nn)
moveNearZero = chooseFun(forword: nn < 0)
moveNearZero(&nn)
moveNearZero = chooseFun(forword: nn < 0)
moveNearZero(&nn)
moveNearZero = chooseFun(forword: nn < 0)
moveNearZero(&nn)
nn

func variadicDemo(numbers: Int..., numbers2: inout Int) {
    print(numbers)
    print(numbers2)
}
var nnn = 26
variadicDemo(numbers: 2,3,4,5,6, numbers2: &nnn)

//
//var array2 = ["b","a","d","ten","xex"]
//
//var sort = { (s1: String, s2: String) -> Bool in return s1 < s2}
//
//
//print(array2.sorted(by: { (s1: String, s2: String) -> Bool in return s1 < s2} ))
//array2
//print(array2.sorted(by: {s1,s2 in return s1 > s2}))


func main() -> (firstF: () -> () ,secondF: () -> () ) {
    
    func first(){
        print("first Function")
    }
    func second(){
        print("second function")
    }
    return (first,second)
}

var tt = main()
tt.firstF()
tt.secondF()





