//
//  DiscountSectionHeader.swift
//  UIComponets
//
//  Created by Rajan Patel on 05/06/23.
//

import UIKit

class DiscountSectionHeader: UIView {

    // MARK: - IBOutlets
    @IBOutlet private weak var containerView: UIView!
    
    override func awakeFromNib() {
        setUpViews()
    }
    // MARK: - Set up
    private func setUpViews() {
        containerView.applyCornerRadius(radius: 16)
        containerView.applyBorderColor(borderColor: UIColor.lightGray.cgColor, borderWidth: 0.5)
    }
}
