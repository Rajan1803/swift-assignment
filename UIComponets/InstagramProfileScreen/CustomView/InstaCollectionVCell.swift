//
//  InstaCollectionVCell.swift
//  UIComponets
//
//  Created by Rajan Patel on 02/06/23.
//

import UIKit

class InstaCollectionVCell: UICollectionViewCell {

    // MARK: - IBOutlets
    @IBOutlet weak var imgPost: UIImageView!
    
    // MARK: - Life cycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // set cell data
    public func setData(data: UIImage?) {
        self.imgPost.image = data
    }

}
