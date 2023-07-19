//
//  FoodTableHeader.swift
//  UIComponets
//
//  Created by Rajan Patel on 05/06/23.
//

import UIKit

class FoodTableHeader: UIView {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var walletContainerView: UIView!
    @IBOutlet private weak var payContainerView: UIView!
    @IBOutlet private weak var topUpContainerView: UIView!
    
    override func awakeFromNib() {
        setUpViews()
    }
    
    // MARK: - Set up
    private func setUpViews() {
        [walletContainerView,payContainerView,topUpContainerView].forEach {
            $0?.applyCornerRadius(radius: 8)
        }
    }

}
