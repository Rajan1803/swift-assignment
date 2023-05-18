//
//  CollectionViewCell.swift
//  UIComponets
//
//  Created by Rajan Patel on 17/05/23.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
//    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    func setData(image: UIImage,name: String){
        self.imgView.image = image
        self.lblName.text = name
        self.backgroundColor = .green
    }
    
}
