//
//  RecomandationSectionModel.swift
//  UIComponets
//
//  Created by Rajan Patel on 06/06/23.
//


import UIKit

struct RecomandedSection {
    let image: UIImage?
    let title: String
    let subtitle: String
    let ratting: String
    let distance: String
    let time: String
    
    static let data = [RecomandedSection(image:UIImage(named: Constants.Img.restaurant), title: "Bamboo Restaurant", subtitle: "Rice, chicken & duck, Snacks", ratting: "4.5", distance: "0.1 km", time: "13 min"), RecomandedSection(image:UIImage(named: Constants.Img.familyRestaurant), title: "Family Restaurant", subtitle: "Friend chicken, Snacks", ratting: "4.7", distance: "0.2 km", time: "20 min")]
}
