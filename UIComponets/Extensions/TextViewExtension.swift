//
//  TextViewExtension.swift
//  UIComponets
//
//  Created by Rajan Patel on 09/05/23.
//

import UIKit

// MARK: - Extension for adjusting height of textview dynamically
extension UITextView {
    
    func adjustUITextViewHeight() {
        self.translatesAutoresizingMaskIntoConstraints = true
        self.sizeToFit()
        self.isScrollEnabled = false
    }
    
}
