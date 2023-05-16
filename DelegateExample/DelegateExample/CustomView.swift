//
//  CustomView.swift
//  DelegateExample
//
//  Created by Rajan Patel on 28/03/23.
//

import Foundation
import UIKit

class CustomView: UIView {
    
    // MARK: - Variables And Declarations
    weak var delegate: TextTransferProtocol?
    
    // MARK: - IBOutlets
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var textField: UITextField!
   
    // MARK: - IBActions
    @IBAction func changeTextPressed(_ sender:UIButton) {
       guard let delegate = delegate else { return }
       delegate.transferText(text: textField.text!)
        
    }
   
}

// MARK: - Protocol
protocol TextTransferProtocol: AnyObject {
    func transferText(text: String) 
}

