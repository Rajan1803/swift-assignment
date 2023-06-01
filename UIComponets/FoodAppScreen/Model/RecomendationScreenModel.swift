//
//  RecomendationScreenModel.swift
//  UIComponets
//
//  Created by Rajan Patel on 06/06/23.
//

import UIKit

struct RecomandedFoods {
    let image: UIImage?
    let titleText: String
    let subTitleText: String
    let price: String
    
    static var bambooFoods = [RecomandedFoods(image: UIImage(named: Constants.Img.recomendationFood), titleText: "Super Family Package", subTitleText: "2 Chicken Wings, 2 Rice, ...", price: "$12.00"), RecomandedFoods(image: UIImage(named: Constants.Img.recomendationFood), titleText: "Super Family Package", subTitleText: "2 Chicken Wings, 2 Rice, ...", price: "$12.00"), RecomandedFoods(image: UIImage(named: Constants.Img.recomendationFood), titleText: "Super Family Package", subTitleText: "2 Chicken Wings, 2 Rice, ...", price: "$12.00"), RecomandedFoods(image: UIImage(named: Constants.Img.recomendationFood), titleText: "Super Family Package", subTitleText: "2 Chicken Wings, 2 Rice, ...", price: "$12.00"), RecomandedFoods(image: UIImage(named: Constants.Img.recomendationFood), titleText: "Super Family Package", subTitleText: "2 Chicken Wings, 2 Rice, ...", price: "$12.00")]
    
    static var familyFoods = [RecomandedFoods(image: UIImage(named: Constants.Img.familyFood), titleText: "Super Family Package", subTitleText: "2 Chicken Wings, 2 Rice, ...", price: "$12.00"), RecomandedFoods(image: UIImage(named: Constants.Img.familyFood), titleText: "Super Family Package", subTitleText: "2 Chicken Wings, 2 Rice, ...", price: "$12.00"), RecomandedFoods(image: UIImage(named: Constants.Img.familyFood), titleText: "Super Family Package", subTitleText: "2 Chicken Wings, 2 Rice, ...", price: "$12.00"), RecomandedFoods(image: UIImage(named: Constants.Img.familyFood), titleText: "Super Family Package", subTitleText: "2 Chicken Wings, 2 Rice, ...", price: "$12.00"), RecomandedFoods(image: UIImage(named: Constants.Img.familyFood), titleText: "Super Family Package", subTitleText: "2 Chicken Wings, 2 Rice, ...", price: "$12.00")]
    
}
