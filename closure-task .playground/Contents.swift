import UIKit

var greeting = "Hello, playground"


class Information {
    var name: String = "rajan"
    
    var remainingInfo: RemainingInfo = RemainingInfo()
    
    func passData() {
        remainingInfo.closure = { age in
            print(age)
            return self.name
            
        }
        
        remainingInfo.passValue()
    }
}

class RemainingInfo {
    var age = 22
    
    var closure:((Int) -> String)?
    
    func passValue() {
        
        print(closure?(age) ?? "")
        
    }
}

var info = Information()
info.passData()
