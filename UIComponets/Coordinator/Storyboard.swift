//
//  Storyboard.swift
//  UIComponets
//
//  Created by Rajan Patel on 01/07/23.
//

import UIKit

enum Storyboard: String {
    case news = "News"
    case webService = "WebServiceMain"
    case apiScreen = "APIScreens"
    case main = "Main"
}

protocol Storyboarded {
    static func instantiate(from storyboard: Storyboard) -> Self
}


extension Storyboarded where Self: UIViewController {
    
    static func instantiate(from storyboard: Storyboard) -> Self {
        
        let fullName = NSStringFromClass(self)
        
        let className = fullName.components(separatedBy: ".")[1]
        
        let storyboard = UIStoryboard(name: storyboard.rawValue, bundle: Bundle.main)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: className) as? Self else {return Self()}
        return viewController
    }
    
}
