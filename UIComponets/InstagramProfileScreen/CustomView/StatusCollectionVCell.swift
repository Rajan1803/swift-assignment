//
//  StatusCollectionVCell.swift
//  UIComponets
//
//  Created by Rajan Patel on 02/06/23.
//

import UIKit

class StatusCollectionVCell: UICollectionViewCell {

    // constants used in this file
    private enum Constant {
        static let imgStatusBorderWidth = 3
    }
    
    // MARK: - IBOutlets
    @IBOutlet private weak var lblTitle: UILabel!
    @IBOutlet private weak var imgStatus: UIImageView!
    
    // MARK: - Life cycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpViews()
    }

    // MARK: - Set up
    private func setUpViews() {
        imgStatus.applyCornerRadius(radius: Int(imgStatus.frame.height/2))
        imgStatus.applyBorderColor(borderColor: UIColor.gray.cgColor, borderWidth: Float(Constant.imgStatusBorderWidth))
    }
    
    // set data
    internal func setData(data: InstaStory) {
        self.imgStatus.image = data.image
        self.lblTitle.text = data.storyTitle
    }
    
}
