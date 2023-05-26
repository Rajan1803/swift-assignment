//
//  PickerViewEnum.swift
//  UIComponets
//
//  Created by Rajan Patel on 26/05/23.
//

import Foundation

enum Animal: Int {
    
    case dog,cat
    
    func getAnimalName() -> String {
        switch self {
        case .dog: return "Dog"
        case .cat: return "Cat"
        }
    }
    
    func getBreeds() -> [String]{
        switch self {
        case .dog: return AnimalsModel.animalsData["Dog"] ?? []
        case .cat: return AnimalsModel.animalsData["Cat"] ?? []
        }
    }
    
    func getCount() -> Int {
        switch self {
        case .dog: return AnimalsModel.animalsData["Dog"]?.count ?? 0
        case .cat: return AnimalsModel.animalsData["Cat"]?.count ?? 0
        }
    }
    
}

// MARK: - Enum for Managing Animal Components in picker view
enum AnimalComponents: Int {
    
    case animal, breads
    
    func getNumberOfRows() -> Int {
        switch self {
        case .animal: return AnimalsModel.animalsData.count
        case .breads: return AnimalsModel.animalsData["Dog"]?.count ?? 0
        }
    }
    
}
