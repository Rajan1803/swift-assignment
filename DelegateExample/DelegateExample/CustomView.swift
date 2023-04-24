//
//  CustomView.swift
//  DelegateExample
//
//  Created by Rajan Patel on 28/03/23.
//

import Foundation
import UIKit

class CustomView: UIView {
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var textField: UITextField!
    
    weak var delegate: TextTransferProtocol?
    
    @IBAction func changeTextPressed(_ sender:UIButton) {
        
       guard let delegate = delegate else { return }
       delegate.transferText(text: textField.text!)
        
    }

   
}

protocol TextTransferProtocol: AnyObject {
    func transferText(text: String) 
}

