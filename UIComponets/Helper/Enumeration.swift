//
//  Enumeration.swift
//  UIComponets
//
//  Created by Rajan Patel on 10/05/23.
//

import UIKit


// MARK: - Enum for Order
enum SegmentedTypes : Int {
    
    case first, second, third, fourth
    func getValue() -> String {
        switch self {
        case .first: return "First"
        case .second: return "Second"
        case .third: return "Third"
        case .fourth: return "Fourth"
            
        }
    }
    
}


// MARK: - Enum for languages
enum LanguageSegmentTypes: Int {
    
    case c, java, swift
    func getValue() -> String {
        switch self {
        case .c: return "C"
        case .java: return "java"
        case .swift: return "Swift"
        }
    }
    
}

