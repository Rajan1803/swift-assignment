//
//  UIImageViewExtension.swift
//  UIComponets
//
//  Created by Rajan Patel on 10/05/23.
//

import UIKit

//MARK: - Extension to set Animation on UIImageView
extension UIImageView {
    
    func setAnimation(variadic imgArray: [UIImage],duration: Int, repeatCount: Int) {
        self.animationImages = imgArray
        self.animationDuration = TimeInterval(duration)
        self.animationRepeatCount = repeatCount
        self.startAnimating()
    }
    
}
