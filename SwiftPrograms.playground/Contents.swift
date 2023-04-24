//4. Above average
/*You are given three grades obtained by 3 students in a class stored in variables grade1, grade2, grade3 of typeDouble.
 You are also given your grade in the class stored in a variable yourGrade of type Double.
 Print above average if your grade is greater than the class average or below average” otherwise.
  Note: the average of the class includes your grade.*/

var grade1 = 7.0
var grade2 = 9.0
var grade3 = 5.0
var yourGrade = 8.0

var avgGrade = (grade1 + grade2 + grade3 + yourGrade )/4

if yourGrade > avgGrade {
    print("above Average")
}else {
    print("below Average")
}



//5. Tipping
/*You have the cost of a meal at a restaurant stored in a variable mealCost of type Double.
 You would like to leave a tip of a certain percentage. The percentage is stored in a variable tip of type Int.
 Print the total cost of the meal.*/

var mealCost:Double = 3.5
var tip : Int = 20

print("totel cost is \(mealCost+mealCost*20/100)")




//1. Breakfast
/* You are working on a smart-fridge. The smart-fridge knows how old the eggs and bacon in it are. You know that eggs spoil after 3 weeks (21 days) and bacon after one week (7 days).
Given baconAge and eggsAge(in days) determine if you can cook bacon and eggs or what ingredients you need to throw out.
If you can cook bacon and eggs print you can cook bacon and eggs.
If you need to throw out any ingredients for each one print a line with the text throw out <ingredient> (where <ingredient> is bacon or eggs) in any order.
 */
var baconAge = 35
var eggAge = 22

if baconAge<7 && eggAge<21 {
    print("you can cook bacon and eggs")
}else {
    if baconAge>7{
        print("throw Out bacon")
    }
    if eggAge>21{
        print("throw out eggs")
    }
}



// leap year
var year = 1900

if year%4 == 0 && (year%100 != 0 || year%400 == 0){
    print("\(year) is leap year")
}else{
    print("\(year) is not leap year")
}



// 3.Hitpoints
/*You are working on a videogame where the character has a certain number of hitpoints(HP) ranging from 0 to 100.
 100 represents full health
 0 represents dead.
You want to add regenerating health to the game using the following rules:

HP always regenerates up to numbers of the form X0 (75 -> 80 , 32 -> 40 …)

When HP is below 20 it regenerates up to 20 (13 -> 20, 5 -> 20, …)

If the character has 0 HP then he doesn’t regenerate life (he’s dead)

Given the current hp of the character stored in a variable hp print the hp the player will have after regenerating life. */



var hp = 68

if hp < 20 {
    hp = 20
}else if hp%10==0{
   //dont need to do anything
}else{
    hp+=10-hp%10
}
print(hp)


//Print Hello World in swift Play Ground
print("hello world")



//Create variables of different types and print it
var number = 34
type(of: number)
var number_2:Int = 38
type(of: number_2)
var string = "good morning"
type(of: string)
var string_2 : String = "good night"
type(of: string_2)
var floatNumber = Float(33.24)
type(of: floatNumber)
var floatNumber_2:Float = 32.45
type(of: floatNumber_2)
var doubleNumber = 43.65
type(of: doubleNumber)
var doubleNumber_2:Double = 322.6453
type(of: doubleNumber_2)
var bool = true
type(of: bool)
var bool_2:Bool = false
type(of: bool_2)
var letter:Character = "d"
type(of: letter)


//Create one integer and perform addition with 5 to that and print values
var intNumber:Int = 10
intNumber+=5
print(intNumber)

//There is one constant with value of interest rate (15%) create one playground for calculate interest for given amount and duration
let intrest_rate = 15
var amount = 2000
var duration = 2

var intrest = (amount*duration*15)/100
print(intrest)


//Create example for String concate using operators
var firstName = "patel"
var lastName = "Rajan"
var fullName = firstName+" "+lastName
print(fullName)

//Create one example for show usage of operator's addition, multiplication, division for integers and floats

var num_one=22
var num_two=34

var fnum_one = 23.43
var fnum_two = 23.6

var num_three = num_one+num_two
var num_four = num_two-num_one
var num_five = num_one*num_two
var num_six = num_two/num_one

var fnum_three = fnum_one+fnum_two
var fnum_four = fnum_two-fnum_one
var fnum_five = fnum_one*fnum_two
var fnum_six = fnum_two/fnum_one


//What is turnery operator and show example of usage?
// turnery operator is alternative to if else it requeres less code compare to if else

var age = 18
print(age<18 ? "not adult":"adult" )

//Write a Swift program to create a new string made of a copy of the first two characters of a given string. If the given string is shorter than length 2, return whatever there is.

var og_string = "simform";

if og_string.count<2 {
    var copy_string = og_string
    print(copy_string)
}else{
    var copy_string = og_string.prefix(2)
    print(copy_string)
 
}

// Write a Swift program to create a new string without the first and last character of a given string. The string length must be at least 2.

var aString = " simform    "

if aString.count>=2 {
    let bString = aString.dropLast(1).dropFirst(1)
    print(bString)
}else{
    print("String length is less than 2")
}


// Write a Swift program that accept two strings and return their concatenation, except the first char of each string. The given strings length must be at least 1.

var string_one = "swift"
var String_two = "Example"

if string_one.count>=1 && String_two.count>=1 {
    print("\(string_one.dropFirst(1)+String_two.dropFirst(1))")
}else {
    print("String length is less than 1")
}


//Write a Swift program to test if a given string starts with "Sw".

var string_1 = "Swift"
if string_1.count>=2 {
    print(string_1.hasPrefix("Sw"))
}


//Write a Swift program to create a new string made of the first and last n chars from a given string. The string length will be at least n.

var string_7 = "simform solutios"
var n = 3
if string_7.count>=n{
    print(string_7.prefix(n)+string_7.suffix(n))
}

//Write a Swift program to check whether the first element and the last element of a given array of integers are equal. The array length must be 1 or more.
var arr1 = [1,2,3,1]
if arr1.count != 0 {
    print(arr1[0]==arr1[arr1.count-1])
}

// Write a Swift program to create a new array with double the length of a given array of integers and its last element is the same as the given array. The given array will be length 1 or more. By default, a new integer array contains all 0's.
var arr2 = [1,2,3,4]
var arr3 = [0];
var counter = 0
while(arr2.count*2 != counter+1){
    arr3.append(0)
    counter+=1
}
arr3[counter]=arr2[arr2.count-1]
print(arr3)

// Write a Swift program to create a new array, taking first two elements from a given array of integers. If the length of the given array is less than 2 use the single element of the given array

var arr4 = [0,1,2,3]
var arr5: [Int] = []

if(arr4.count == 1){
    arr5.append(arr4[0])
    arr5.append(arr4[0])
}else if arr4.count==0 {
    print("empty array")
}else{
    
    arr5.append(arr4[0])
    arr5.append(arr4[1])

}
print(arr5)


//Write a Swift program to take one array and find out maximum number from that array
var arr6 = [0,50,100,20,80,150]
var max = 0
for number in arr6 {
    if max<number {
        max = number
    }
}
print(max)


//Write a Swift program to take one array and sort it in descending order.
var arr7 = [0,5,6,2,10]

for i in 0...arr7.count-1 {
    for j in 0...arr7.count-1{
        if(arr7[i]>arr7[j]){
            var temp = arr7[i]
            arr7[i] = arr7[j]
            arr7[j] = temp
        }
    }
}
print(arr7)

// Print all the numbers from listOfNumbers that are divisible by at least one number from divisors

var listOfNumbers = [1, 2, 3, 10, 100]
var divisors = [2,5]

for number in listOfNumbers {
    if(number%divisors[0]==0 || number%divisors[1]==0){
        print(number)
    }
}



//  Print the powers of 2 that are less than or equal to N.
var N : Int? = 100
var pow = 2

if let N{
    while pow<=N {
        print(pow)
        pow = pow*2
        
    }
}

// Given an integer N draw a square of N x N asterisks. Look at the examples
var n_one = 3
for _ in 0...n_one-1{
    for _ in 0...n_one-1{
        print("*", terminator: "")
    }
    print()
}


//Given an integer N draw a triangle of asterisks. The triangle should have N lines, the i-th line should have i asterisks on it.

let n_two = 4
var i = 1
while i <= n_two {
    print(String(repeating: "*", count: i))
    i += 1
}


//Given an integer N draw a pyramid of asterisks. The pyramid should have N lines. On the i-th line there should be N-i spaces followed by i*2-1 asterisks.


//You are given a number. Print "prime" if the number is a prime and "not prime" otherwise. A number is a prime if it has exactly 2 distinct divisors (1 and itself).
var number_two : Int?
number_two = 9

var prime = true
if let number_two{
    for i in 2...number_two/2{
        if number_two%i==0{
            prime = false
            break
        }
        
    }
}
(prime ? print("prime") : print("non prime"))

/*
You are given a dictionary code of type [String:String] which has values for all lowercase letters. The codedictionary represents a way to encode a message. For example if code["a"] = "z" and code["b"] = "x" the encoded version if "ababa" will be "zxzxz". You are also given a encodedMessage which contains only lowercase letters and spaces. Use the codedictionary to decode the message and print it. Write a Swift program to decode the message and print final output string
                                                                                */


var code :[String:String]? = [

"a" : "b",

"b" : "c",

"c" : "d",

"d" : "e",

"e" : "f",

"f" : "g",

"g" : "h",

"h" : "i",

"i" : "j",

"j" : "k",

"k" : "l",

"l" : "m",

"m" : "n",

"n" : "o",

"o" : "p",

"p" : "q",

"q" : "r",

"r" : "s",

"s" : "t",

"t" : "u",

"u" : "v",

"v" : "w",

"w" : "x",

"x" : "y",

"y" : "z",

"z" : "a"

]

var encodedMessage :String?
encodedMessage = "this"

if let encodedMessage{
    for char in encodedMessage {
        if char==" "{
            print(" ",terminator: "")
        }else{
            if let code{
                if let value = code[String(char)] {
                    print("\(value)",terminator: "")
                }
            }
        }
        
    }
}
print()

/* You are given an array of dictionaries. Each dictionary in the array contains exactly 2 keys “firstName” and “lastName”. Create an array of strings called firstNames that contains only the values for “firstName” from each dictionary
 */

var people: [[String:String]]? = [

[

"firstName": "Calvin",

"lastName": "Newton"

],

[

"firstName": "Garry",

"lastName": "Mckenzie"

],

[

"firstName": "Leah",

"lastName": "Rivera"

],

[

"firstName": "Sonja",

"lastName": "Moreno"

],

[

"firstName": "Noel",

"lastName": "Bowen"

]

]
var arrDictionary = [String]()

if let people{
    for dictionary in people {
        if let firstNames = dictionary["firstName"]{
            arrDictionary.append(firstNames)
        }
        
    }
    print(arrDictionary)

}


/*  You are given an array of dictionaries. Each dictionary in the array contains exactly 2 keys “firstName” and “lastName”. Create an array of strings called fullNames that contains the values for “firstName” and “lastName” from the dictionary separated by a space.*/



var fullName1 = [String]()

if let people {
    for dictionary in people{
        
        if let firstNames = dictionary["firstName"] , let lastNames = dictionary["lastName"] {
            fullName1.append(firstNames + " " + lastNames)
            
        }
    }
    print(fullName1)
}




/* You are given an array of dictionaries. Each dictionary in the array describes the score of a person. Find the person with the lowest score and print his full name. */


var people2: [[String:Any]]? = [

[

"firstName": "Calvin",

"lastName": "Newton",

"score": 13

],

[

"firstName": "Garry",

"lastName": "Mckenzie",

"score": 12

],

[

"firstName": "Leah",

"lastName": "Rivera",

"score": 10

],

[

"firstName": "Sonja",

"lastName": "Moreno",

"score": 3

],

[

"firstName": "Noel",

"lastName": "Bowen",

"score": 16

]

]

//
//if let people2 {
//    var score = people2[0]["score"] as? Int ?? 0
//
//    for person in people2 {
//        if score > person["score"] as? Int ?? 0 {
//            score = person["score"] as? Int ?? 0
//        }
//    }
//    score
//
//
//}

if let people2{
    var sorted = people2.sorted(by: {($0["score"] as? Int ?? 0) < ($1["score"] as? Int ?? 0)})
    
    if let firstName_low = sorted[0]["firstName"] , let lastName_low = sorted[0]["lastName"]{
        print("\(firstName_low) \(lastName_low)")

        
    }
   
}

/* You are given an array of dictionaries. Each dictionary in the array describes the score of a person. Print the leaderboard in the following format:
 1. full name - score

 2. ...

 ...
 */

var people3: [[String:Any]]? = [

[

"firstName": "Calvin",

"lastName": "Newton",

"score": 13

],

[

"firstName": "Garry",

"lastName": "Mckenzie",

"score": 23

],

[

"firstName": "Leah",

"lastName": "Rivera",

"score": 10

],

[

"firstName": "Sonja",

"lastName": "Moreno",

"score": 3

],

[

"firstName": "Noel",

"lastName": "Bowen",

"score": 16

]

]

if let people3  {
    for dict in people3 {
        if let i = dict["firstName"] , let i2 = dict["lastName"], let i3 = dict["score"]{
            print("\(i) \(i2) - \(i3) ")
        }
    }
}
var numbers1 = [1, 2, 3, 2, 3, 5, 2, 1, 3, 4, 2, 2, 2]

var numbers2 = numbers1.sorted()
numbers1
var dictionary2 : [Int : Int] = [:]
for i in numbers2{
  dictionary2[i] = (dictionary2[i] ?? 0)+1
}
print(dictionary2)
for (key,value) in dictionary2{
    print("\(key) \(value)")
}

dictionary2.sorted(by: <)


