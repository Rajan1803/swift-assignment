//
//  RecomendScreenSectionHeader.swift
//  UIComponets
//
//  Created by Rajan Patel on 06/06/23.
//

import UIKit

class RecomendScreenSectionHeader: UIView {

    // MARK: - IBOutlets
    @IBOutlet private weak var lblTime: UILabel!
    @IBOutlet private weak var lblDistance: UILabel!
    @IBOutlet private weak var lblRatting: UILabel!
    @IBOutlet private weak var lblSubtitle: UILabel!
    @IBOutlet private weak var lblTitle: UILabel!
    @IBOutlet private weak var imgRestaurant: UIImageView!
    @IBOutlet private weak var containerView: UIView!
    
    // MARK: - Set up
    func setUpViews(data: RecomandedSection) {
        self.containerView.applyCornerRadius(radius: 16)
        containerView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        lblTitle.text = data.title
        lblTime.text = data.time
        lblRatting.text = data.ratting
        lblDistance.text = data.distance
        lblSubtitle.text = data.subtitle
        imgRestaurant.image = data.image
    }
    
}
