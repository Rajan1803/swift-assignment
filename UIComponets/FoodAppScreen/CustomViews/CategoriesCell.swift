//
//  CategoriesCell.swift
//  UIComponets
//
//  Created by Rajan Patel on 05/06/23.
//

import UIKit

class CategoriesCell: UICollectionViewCell {

    // MARK: - IBOutlets
    @IBOutlet private weak var lblText: UILabel!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var containerForImage: UIView!
    
    // MARK: - Life cycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpViews()
    }
    
    // MARK: - Set up
    private func setUpViews() {
        containerForImage.applyCornerRadius(radius: 14)
        containerForImage.applyBorderColor(borderColor: UIColor.lightGray.cgColor, borderWidth: 0.1)
    }
    
    // set data to cell
    func setUpData(data: Categories) {
        imageView.image = data.image
        lblText.text = data.text
    }

}
