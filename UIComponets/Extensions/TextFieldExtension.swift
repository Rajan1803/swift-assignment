//
//  TextFieldExtension.swift
//  UIComponets
//
//  Created by Rajan Patel on 09/05/23.
//

import UIKit

// MARK: - Extension to set padding and image on left side of textfield
extension UITextField {
    
    // MARK: - FUNCTION
    func setTextFieldLeftImage(padding: Double = 30,image: UIImage?) {
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: padding, height: self.frame.size.height))
        let leftImage = UIImageView(frame: CGRect(x: 5, y: 5, width: padding-10, height: self.frame.height - 10.0))
        leftImage.contentMode = .redraw
        leftImage.image = image
        leftView.addSubview(leftImage)
        self.leftView = leftView
        self.leftViewMode = .always
    }
    
}
