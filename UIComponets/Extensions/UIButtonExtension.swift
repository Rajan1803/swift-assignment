//
//  UIButtonExtension.swift
//  UIComponets
//
//  Created by Rajan Patel on 24/05/23.
//

import UIKit

// MARK: Extension for UIButton - adding image to left of button
extension UIButton {
    
    func setImageToLeftOfButton(image: String) {
        let imgView = UIImageView(frame: CGRect(x: 0, y: 5, width: self.frame.width/5, height: self.frame.height - 10))
        imgView.image = UIImage(named: image)
        imgView.contentMode = .scaleAspectFit
        self.addSubview(imgView)
    }
    
}
