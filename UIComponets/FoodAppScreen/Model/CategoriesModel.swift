//
//  CategoriesModel.swift
//  UIComponets
//
//  Created by Rajan Patel on 05/06/23.
//


import UIKit

struct Categories {
    let image: UIImage?
    let text: String
    
    static let data = [Categories(image: UIImage(named: Constants.Img.nearest), text: "Nearest"), Categories(image: UIImage(named: Constants.Img.newLogo), text: "New Foods"), Categories(image: UIImage(named: Constants.Img.badgeIcon), text: "Best Seller"), Categories(image: UIImage(named: Constants.Img.healthy), text: "Healthy")]
}
