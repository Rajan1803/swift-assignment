//
//  RecomendScreenTblVCell.swift
//  UIComponets
//
//  Created by Rajan Patel on 06/06/23.
//

import UIKit

class RecomendScreenTblVCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet private weak var lblPrice: UILabel!
    @IBOutlet private weak var lblSubTitles: UILabel!
    @IBOutlet private weak var lblTitle: UILabel!
    @IBOutlet private weak var imgFood: UIImageView!
    
    // MARK: - Life cycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
       setUpViews()
    }
    
    // MARK: - Set up
    private func setUpViews() {
        imgFood.applyCornerRadius(radius: 12)
    }
    
    // set cell data
    func setData(data: RecomandedFoods) {
        imgFood.image = data.image
        lblPrice.text = data.price
        lblTitle.text = data.titleText
        lblSubTitles.text = data.subTitleText
    }
    
}
