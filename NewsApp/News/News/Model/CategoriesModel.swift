//
//  CategoriesModel.swift
//  News
//
//  Created by Rajan Patel on 15/07/23.
//

import UIKit

struct Category {

    let image: UIImage?
    let name: String
    
    static let categories = [Category(image: R.image.general(), name: R.image.general.name)
    ,Category(image: R.image.business(), name: R.image.business.name)
    ,Category(image: R.image.sports(), name: R.image.sports.name)
    ,Category(image: R.image.health(), name: R.image.health.name)
    ,Category(image: R.image.entertainment(), name: R.image.entertainment.name)
    ,Category(image: R.image.science(), name: R.image.science.name)
    ,Category(image: R.image.technology(), name: R.image.technology.name)
    ]

}
