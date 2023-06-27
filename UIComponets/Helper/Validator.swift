//
//  Validator.swift
//  UIComponets
//
//  Created by Rajan Patel on 08/05/23.
//

import Foundation

// MARK: - Helper Class For Input Validation
class Validator {
    
    private init() {
    }
    
    static let shared = Validator()

    func isPincodeValid(pincode: String?) -> Bool {
        let postalcodeRegex = Constants.Regex.postalVarificationRegex
               let pinPredicate = NSPredicate(format: "SELF MATCHES %@", postalcodeRegex)
        return  pinPredicate.evaluate(with: pincode ?? "")
        
    }
    
    func isEmailValid(email: String?) -> Bool {
        let regulerExpression = Constants.Regex.emailVarificationRegex
        let predicate = NSPredicate(format: "SELF MATCHES %@", regulerExpression)
        return predicate.evaluate(with: email ?? "")
    }
    
    func isPasswordValid(password: String?) -> Bool {
        let regulaerExpression = Constants.Regex.passwordVarificationRegex
        let predicate = NSPredicate(format: "SELF MATCHES %@",  regulaerExpression)
        return predicate.evaluate(with: password ?? "")
    }
    
}
