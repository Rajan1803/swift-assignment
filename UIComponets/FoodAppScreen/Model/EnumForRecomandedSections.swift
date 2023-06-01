//
//  EnumForRecomandedSections.swift
//  UIComponets
//
//  Created by Rajan Patel on 06/06/23.
//

import UIKit

enum RecomandedSections: Int {
    case bambooRestaurant, familyRestaurant
    
    func getItemCount() -> Int {
        switch self {
        case .bambooRestaurant: return RecomandedFoods.bambooFoods.count
        case .familyRestaurant: return RecomandedFoods.familyFoods.count
        }
    }
    
    func removeElement(index: Int) {
        switch self {
        case .bambooRestaurant: RecomandedFoods.bambooFoods.remove(at: index)
        case .familyRestaurant: RecomandedFoods.familyFoods.remove(at: index)
        }
    }
    
    func isSectionEmpty(section: Int) -> Bool {
        switch self {
        case .bambooRestaurant: return RecomandedFoods.bambooFoods.isEmpty
        case .familyRestaurant: return RecomandedFoods.familyFoods.isEmpty
        }
    }
}
