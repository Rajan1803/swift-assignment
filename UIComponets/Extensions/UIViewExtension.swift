//
//  UIViewExtension.swift
//  UIComponets
//
//  Created by Rajan Patel on 08/05/23.
//

import Foundation
import UIKit

// MARK: - Extension for new attributes of view like corner radius , border color etc...
extension UIView {
    
        @IBInspectable
        var cornerRadius: CGFloat {
            get {
                return layer.cornerRadius
            }
            set {
                layer.cornerRadius = newValue
            }
        }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }
    
    @IBInspectable
        var borderWidth: CGFloat {
            get {
                return layer.borderWidth
            }
            set {
                layer.borderWidth = newValue
            }
        }
    
    @IBInspectable
       var shadowRadius: CGFloat {
           get {
               return layer.shadowRadius
           }
           set {
               layer.shadowRadius = newValue
           }
       }
       
    @IBInspectable
        var shadowOpacity: Float {
            get {
                return layer.shadowOpacity/10
            }
            set {
                layer.shadowOpacity = newValue/10
            }
        }
    
       @IBInspectable
       var shadowColor: UIColor? {
           get {
               if let color = layer.shadowColor {
                   return UIColor(cgColor: color)
               }
               return nil
           }
           set {
               if let color = newValue {
                   layer.shadowColor = color.cgColor
               } else {
                   layer.shadowColor = nil
               }
           }
       }
    
    func applyGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.red.cgColor,UIColor.green.cgColor]
        gradientLayer.cornerRadius = layer.cornerRadius
        
        gradientLayer.frame = self.bounds
        self.layer.addSublayer(gradientLayer)
    }
    
    func applyCornerRadius(radius: Int) {
        layer.cornerRadius = CGFloat(radius)
        clipsToBounds = true
    }
    
    func applyBorderColor(borderColor: CGColor, borderWidth: Float) {
        layer.borderColor = borderColor
        layer.borderWidth = CGFloat(borderWidth)
    }
    
}
