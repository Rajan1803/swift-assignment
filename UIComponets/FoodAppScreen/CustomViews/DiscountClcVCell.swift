//
//  DiscountClcVCell.swift
//  UIComponets
//
//  Created by Rajan Patel on 05/06/23.
//

import UIKit

class DiscountClcVCell: UICollectionViewCell {
    
    // MARK: - IBActions
    @IBOutlet private weak var lblDiscountPercent: UILabel!
    @IBOutlet private weak var lblShoppingDiscount: UILabel!
    
    // MARK: - Life cycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpViews()
    }
    
    // MARK: - Set up
    private func setUpViews() {
        lblShoppingDiscount.textColor = .white
        let button = UIButton(frame: CGRect(x: lblDiscountPercent.frame.width - 11, y: 0, width: 16, height: 16))
        button.setImage(UIImage(named: Constants.Img.percent), for: .normal)
        lblDiscountPercent.addSubview(button)
    }

}
