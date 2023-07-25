//: [Previous](@previous)

import Foundation

// 1. Create a password validation program. If length of password is less than 8 characters, it throws “Password too short” exception and if password is empty, throw “Empty password” exception.


enum PasswordErrors: Error {
    case passwordTooShort
    case emptyPassword
}

var password = "rajan"

func validatePassword(pass: String) throws {
    if pass.isEmpty {
        throw PasswordErrors.emptyPassword
    }
    if pass.count < 8 {
        throw PasswordErrors.passwordTooShort
    }
}

do{
    try validatePassword(pass: password)
}catch PasswordErrors.emptyPassword{
    print("password is empty")
}catch PasswordErrors.passwordTooShort {
    print("password is too short")
}

// 2. Create a program for shopping cart. If desired quantity for an item is not available, throw exception.

enum ShoppingList: Error {
    case lowQuantity
    case itemNotAvailable
}

func shop(name: String, quantity: Int) throws {
    var items = ["table": 100 , "smartPhones": 30]
    
    if let itemCount = items[name] {
        if itemCount < quantity {
            throw ShoppingList.lowQuantity
        }
        return
    }
    throw ShoppingList.itemNotAvailable
}

do {
    try shop(name: "table", quantity: 200)
    
}catch ShoppingList.lowQuantity{
    print("low quantity")
}catch ShoppingList.itemNotAvailable{
    print("item Not Available")
}
