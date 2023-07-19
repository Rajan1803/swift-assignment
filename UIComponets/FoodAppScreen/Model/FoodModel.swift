//
//  FoodModel.swift
//  UIComponets
//
//  Created by Rajan Patel on 06/06/23.
//


import UIKit

struct FoodModel {
    let image: UIImage?
    let distance: String
    let time: String
    let tilte: String
    let rating: String
    let ratingText: String
    let imgDiscount: UIImage?
    
    static let data = [FoodModel(image: UIImage(named: Constants.Img.food), distance: "1.02 km", time: "8 min", tilte: "Nasi Goreng  Dower, Rumbai", rating: "4.9", ratingText: "6rb+ ratings", imgDiscount: UIImage(named: Constants.Img.thirtyFiveOff)), FoodModel(image: UIImage(named: Constants.Img.chickenFood), distance: "1.02 km", time: "12 min", tilte: "Rocket Chicken Kayu Manis", rating: "4.8", ratingText: "3rb+ ratings", imgDiscount: UIImage(named: Constants.Img.fourtyOff)), FoodModel(image: UIImage(named: Constants.Img.food), distance: "1.02 km", time: "8 min", tilte: "Nasi Goreng  Dower, Rumbai", rating: "4.9", ratingText: "6rb+ ratings", imgDiscount: UIImage(named: Constants.Img.thirtyFiveOff)), FoodModel(image: UIImage(named: Constants.Img.chickenFood), distance: "1.02 km", time: "12 min", tilte: "Rocket Chicken Kayu Manis", rating: "4.8", ratingText: "3rb+ ratings", imgDiscount: UIImage(named: Constants.Img.fourtyOff))]
    
}
