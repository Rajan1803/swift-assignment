//
//  CategoriesCell.swift
//  News
//
//  Created by Rajan Patel on 14/07/23.
//

import UIKit

class CategoriesCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var lblCategory: UILabel!
    @IBOutlet weak var imgview: UIImageView!
    
    // MARK: - Life cycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func prepareForReuse() {
        self.backgroundColor = .none
    }
    
     // MARK: - Set up
    func setData(category: Category){
        lblCategory.text = category.name.uppercased()
        imgview.image = category.image
    }

}
