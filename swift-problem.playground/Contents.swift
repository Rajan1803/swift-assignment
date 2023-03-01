import UIKit

var greeting = "Hello, playground"

var v: String?
v="56"


if let d = v as? String{
    print(d)
}else{
    print("non")
}


var t = (1,3)

switch t {
case (1,2) : print("its 1 and 2")
case (1,3) : print("its 1 and 3")
default : print("default")
}

typealias rajan = String
var rr : rajan = "rajan"
type(of: rr)


var number: Int? = 50

number = (number ?? 0) + 1
print(number ?? 0)

var str: String? = "50"

if let str {
    print(Int(str) ?? 0)
}

var dict: [String: Any] = ["name": "rajan", "age":24, "lastName": "asdfjkl"]



for (_, value) in dict {
    
    print(value)
}

class xyz{
    
}

var a = xyz()

var arr2: [Any?] = []
arr2.append(2)
arr2.append("dsub")
arr2.append(34.22)
arr2.append(Int(54.67))
arr2.append(xyz())

var dictUser: [String: Any] = ["name": 20,"age":"namebv"]
dictUser["name"] = "abc"
dictUser["age"] = 23
dictUser["history"] = arr2

var arr1: [Any?] = []
arr1.append(2)
arr1.append("dsub")
arr1.append(63.54)
arr1.append(Int(54.32))
arr1.append(xyz())
arr1.append(dictUser)


for element in arr1 {
    if let e = element as? [String: Any] {
        print(e)
        
        if let ee = e["history"] as? [Any?] {
            for i in ee {
                if let ii = i as? Int{
                    print("\(ii) is Int")
                }
                if let ii = i as? String {
                    print("\(ii) is String")
                }
                if let ii = i as? Double {
                    print("\(ii) is Double")
                }
                if let ii = i as? xyz {
                    print("\(ii) is XYZ")
                }
                
            }
        }
       
        
    }
}


class Xyz {
    
}

var arr11: [Any?] = []
arr11.append(22)
arr11.append("rajan")
arr11.append(45.22)
arr11.append(Int(32.54))
arr11.append(Xyz())

var dict11: [String: Any?] = [:]
dict11["firstName"] = "Rajan"
dict11["lastName"] = "patel"
dict11["age"] = 22
dict11["history"] = arr11

var arr22: [Any?] = []
arr22.append(22)
arr22.append("myName")
arr22.append(43.23)
arr22.append(Int(32.343))
arr22.append(dict11)


for ele in arr22 {
    if let ele1 = ele as? [String:Any?]{
      //  print(ele1)
        
        if let ele3 = ele1["history"] as? [Any?] {
            for ele2 in ele3 {
                
               
                if let e = ele2 as? String{
                    print("\(e) is String")
                }else if let e = ele2 as? Int{
                    print("\(e) is Int")
                }
            }
        }
    }
}



var dictMain: [String: Any?]? =
["page": 2,
"per_page": 6,
"total": 12,
"total_pages": 2,
"data": [

        [

            "id": 7,

            "email": "michael.lawson@reqres.in",

            "first_name": "Michael",

            "last_name": "Lawson",

            "avatar": "https://reqres.in/img/faces/7-image.jpg"

        ],

        [

            "id": 8,

            "email": "lindsay.ferguson@reqres.in",

            "first_name": "Lindsay",

            "last_name": "Ferguson",

            "avatar": "https://reqres.in/img/faces/8-image.jpg"

        ],

        [

            "id": 9,

            "email": "tobias.funke@reqres.in",

            "first_name": "Tobias",

            "last_name": "Funke",

            "avatar": "https://reqres.in/img/faces/10-image.jpg"

        ],

        [

            "id": 10,

            "email": "byron.fields@reqres.in",

            "first_name": "Byron",

            "last_name": "Fields",

            "avatar": "https://reqres.in/img/faces/10-image.jpg"

        ],

        [

            "id": 11,

            "email": "george.edwards@reqres.in",

            "first_name": nil,

            "last_name": "Edwards",

            "avatar": "https://reqres.in/img/faces/11-image.jpg"

        ],

        [

            "id": 12,

            "email": "rachel.howell@reqres.in",

            "first_name": "Rachel",

            "last_name": nil,

            "avatar": "https://reqres.in/img/faces/12-image.jpg"

        ]

    ],

    "support": [

        "url": "https://reqres.in/#support-heading",

        "text": "To keep ReqRes free, contributions towards server costs are appreciated!"

    ]

]

//print(dictMain)

if let dictMain {
    dictMain["data"]
    type(of: dictMain["data"])
    
    if let dict = dictMain["data"] as? [Any?]{
        for d in dict{
            if let dd = d as? [String: Any?]{
                print(dd["first_name"] as? String ?? "")
            }
        }
    }
}


if let  dictMain {
    dictMain["data"]
    type(of: dictMain["data"])
    
    if let dict = dictMain["data"] as? [Any?]{
        for d in dict{
            if let dd = d as? [String: Any?]{
                print("\(dd["first_name"] as? String ?? "")  \(dd["last_name"] as? String ?? "")")
            }
        }
    }
}


if let  dictMain {
    dictMain["data"]
    type(of: dictMain["data"])
    
    if let dict = dictMain["data"] as? [Any?]{
        for d in dict{
            if let dd = d as? [String: Any?]{
                if (dd["id"] as? Int ?? 0)%2 == 0{
                    print("id is \(dd["id"] as? Int ?? 0) and name is \(dd["first_name"] as? String ?? "")  \(dd["last_name"] as? String ?? "")")
                }
                
            }
        }
    }
}


