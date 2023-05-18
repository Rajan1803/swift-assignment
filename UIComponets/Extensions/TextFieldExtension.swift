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
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: padding + 5, height: self.frame.size.height))
        let leftImage = UIImageView(frame: CGRect(x: 5, y: 5, width: padding-10, height: self.frame.height - 10.0))
        
        leftImage.contentMode = .center
        leftImage.image = image
        leftView.addSubview(leftImage)
        leftImage.clipsToBounds = true
        self.leftView = leftView
        self.leftViewMode = .always
    }
    
    func setTextFieldRightImage(padding: Double = 30, image: UIImage?){
        let rightView = UIView(frame: CGRect(x: 0, y: 0, width: padding, height: self.frame.size.height))
        let rightImage = UIImageView(frame: CGRect(x: 5, y: 5, width: padding-10, height: self.frame.height - 10.0))
        rightImage.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(rightImageClickEvent))
        rightImage.addGestureRecognizer(tap)
        rightImage.contentMode = .center
        rightImage.image = image
        rightView.addSubview(rightImage)
        rightImage.clipsToBounds = true
        self.rightView = rightView
        self.rightViewMode = .always
    }
    
    @objc func rightImageClickEvent(_ sender: UIGestureRecognizer) {
        self.text = ""
    }
    
}
