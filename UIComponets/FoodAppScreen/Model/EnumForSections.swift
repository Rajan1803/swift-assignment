//
//  EnumForSections.swift
//  UIComponets
//
//  Created by Rajan Patel on 05/06/23.
//

import UIKit

enum FoodSection: Int {
    case categories, recommendations, discountSection, cheapFood
    
    func getHeightForHeaderInSection() -> CGFloat {
        switch self {
        case .categories: return 40
        case .recommendations: return 70
        case .discountSection: return 70
        case .cheapFood: return 65
        }
    }
    
    func getheightForRow() -> CGFloat {
        switch self {
        case .categories: return 120
        case .recommendations: return 222
        case .discountSection: return 160
        case .cheapFood: return 222
        }
    }
    
    func getNumbersOfItemsInSection() -> Int {
        switch self {
        case .categories: return Categories.data.count
        case .recommendations: return FoodModel.data.count
        case .discountSection: return 1
        case .cheapFood: return 1
        }
    }
    
}
