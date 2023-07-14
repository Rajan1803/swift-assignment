//
//  CollectionViewCell.swift
//  UIComponets
//
//  Created by Rajan Patel on 17/05/23.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    // MARK: - IBOutlets
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    // MARK: - Set up
    func setData(image: UIImage?,name: String){
        imgView.image = image
        lblName.text = name
        backgroundColor = .green
    }
    
}
