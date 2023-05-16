//
//  UISliderExtention.swift
//  UIComponets
//
//  Created by Rajan Patel on 09/05/23.
//

import UIKit

// MARK: - EXTENSION for UISlider Corder
extension UISlider {
    
    func createBorder(color: CGColor,width: Int) {
        self.layer.borderWidth = CGFloat(width)
        self.layer.borderColor = color
    }
    
}
