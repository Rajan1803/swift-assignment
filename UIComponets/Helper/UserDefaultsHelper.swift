//
//  UserDefaultsHelper.swift
//  UIComponets
//
//  Created by Rajan Patel on 30/05/23.
//

import Foundation

struct UserDefaultHelper {
    
    static var isLogedIn: Bool {
        get {
            UserDefaults.standard.bool(forKey: #function)
        }
        set {
            return UserDefaults.standard.set(newValue, forKey: #function)
        }
    }

}

