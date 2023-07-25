import UIKit


/* if string contains even number of each characters it follows pettern or not following pattern
ex . var s = "abcbca" - follows pattern
     var s = "rajan" - not following pttern
*/


var str = "absabs"
var str2 = str.sorted()


var i = 0
var flag = true
while i < str2.count {
    if str2[i] != str2[i+1] {
        flag = false
        break
    }
    i+=2
    
}
if flag == true {
    print("pattern followed")
}else{
    print("pattern not followed ")
}




/* Update Lorem with your name from below paragraph */



var str66 = """
Lorem ipsum dolor sit amet. Sed nihil nemo et eius aperiam hic natus quidem sit impedit fuga et sint nostrum. Eum incidunt rerum quo adipisci laboriosam et amet magnam eos eligendi tempore. Qui eveniet similique vel alias itaque At placeat velit ea accusantium natus sed ipsa Lorem  obcaecati.In quod magnam non harum impedit est fugiat deserunt sit expedita repellat et dolores porro. Ea Quis optio est optio voluptatem et dolor excepturi. Id aperiam architecto qui magnam dolor sit voluptatibus placeat u Lorem t nostrum porro. Qui modi illo aut quia reprehenderit quo dolores voluptates?Non excepturi optio vel nobis quis est temporibus galisum eos placeat ipsam? Et molestiae similique aut reiciendis necessitatibus vel re Lorem iciendis quibusdam id iure pro Lorem  vident nam ipsam facilis 33 suscipit recusandae. Hic incidunt magni a officiis enim vel assumenda alias!
"""

print(str66.replacingOccurrences(of: "Lorem", with: "rajan"))



let number1 = 52.089479
Int(number1*100)
let flNumber = Double(Int(number1*100))/100


let user1 = "Shilpriya,shah,simform,ahmedabad"
let user2 = "Shilpriya,shah,simform,ahmedabad"
let user3 = "shilpriya,shah,simform,ahmedabad"
let user4 = "shilpriya,shah,simform,ahmedabad"

let user1Components = user1.split(separator: ",")
let user2Components = user2.split(separator: ",")
let user3Components = user3.split(separator: ",")
let user4Components = user3.split(separator: ",")



let user1Dict = ["firstName": String(user1Components[0]), "lastName": String(user1Components[1]), "company": String(user1Components[2]), "city": String(user1Components[3])]
let user2Dict = ["firstName": String(user2Components[0]), "lastName": String(user2Components[1]), "company": String(user2Components[2]), "city": String(user2Components[3])]

let user3Dict = ["firstName": String(user3Components[0]), "lastName": String(user3Components[1]), "company": String(user3Components[2]), "city": String(user3Components[3])]
let user4Dict = ["firstName": String(user4Components[0]), "lastName": String(user4Components[1]), "company": String(user4Components[2]), "city": String(user4Components[3])]
let usersArray = [user1Dict, user2Dict,user3Dict,user4Dict]

print(usersArray)



/*

1. Convert this to an Array of dictionary:  User1 = “”Shilpriya,shah,simform,ahmedabad”User2 = “”Shilpriya,shah,simform,ahmedabad”User3= “”Shilpriya,shah,simform,ahmedabad”User4 = “”Shilpriya,shah,simform,ahmedabad”


*/





let user11 = "rajan,patel,simform,ahmedabad"
let user22 = "rajan,patel,simform,ahmedabad"
let user33 = "rajan,patel,simform,ahmedabad"
let user44 = "rajan,patel,simform,ahmedabad"

let user11Array = user11.split(separator: ",")
let user22Array = user22.split(separator: ",")
let user33Array = user33.split(separator: ",")
let user44Array = user44.split(separator: ",")

var user11D = ["firstName":user11Array[0],"lastName":user11Array[1],"company":user11Array[2],"city" : user11Array[3]]

var user22D = ["firstName" : user22Array[0] , "lastName" : user22Array[1] , "company" : user22Array[2] , "city" : user22Array[3]
]



var companydata : String?
var userData : [String?] = [ "Shilpriya,shah,simform,ahmedabad" , "Rajan,Patel,\(companydata),ahmedabad", "Sagar,Ajudiya,ahmedabad", "Priyanshu,Desai,simform,ahmedabad" ]
var userDictionary : [[(String): (String)]] = Array()
for index in 0...userData.count-1 {
    if let data  = userData[index]?.split(separator: ",") {
        var firstName = "", lastName = "", company = "", city = ""
        for indexOfData in 0..<data.count {
            switch indexOfData {
                case 0:
                firstName = String(data[0])
                case 1:
                lastName = String(data[1])
                case 2:
                company = String(data[2])
                case 3:
                city = String(data[3])
                default :
                print("Too Much data!!")
                
            }
            
        }
        let aDictionary = [            "firstName":firstName,            "lastName":lastName,            "company":company,            "city":city        ]
        userDictionary.append(aDictionary)
        
    }
    
}
for user in userDictionary {
    print("User Data: ----")
    print("FirstName: \(user["firstName"] ?? "")")
    print("LastName: \(user["lastName"] ?? "")")
    print("Company: \(user["company"] ?? "")")
    print("City: \(user["city"] ?? "")")
    
    
}
print(userDictionary)


/*. Find starting index of word : e.g Simform Solutions first index of solutions*/

var str44 : String? = "Simform Solutions"
if str44 != nil{
    if str44!.contains("Solutions"){
        let index = str44!.firstRange(of: "Solutions")
        let iii : Int = str44!.distance(from: str44!.startIndex, to: index!.lowerBound)
        print(iii) // starting idex of Solutions
    }else {
        print("String Does Not Contain \"Solutions\"")
    }
}else {
    print("string is nil")
}
//
//print(str44[index!.lowerBound])
//print(str44[index!.lowerBound..<index!.upperBound])



/*  10.50909 => “10.50”: get only two digit decimal value*/

let dd = 345.334464563

String(format: "%.2f", dd)

