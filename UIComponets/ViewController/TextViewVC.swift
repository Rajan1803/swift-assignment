//
//  TextViewVC.swift
//  UIComponets
//
//  Created by Rajan Patel on 28/04/23.
//

import UIKit

class TextViewVC: BaseViewController {

    // MARK: - IBOutlets
    @IBOutlet private var txtvAddress: UITextView!
    
    // MARK: - Life cycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
        txtvAddress.adjustUITextViewHeight()
        txtvAddress.delegate = self
        setPlaceholderInTextView(placeholderText: Constants.String.address, textfield: txtvAddress)
    }
    
    // MARK: - FUNCTION
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        txtvAddress.resignFirstResponder()
        view.endEditing(true)
        print(#function)
    }
    
    // MARK: - Set up
    private func setPlaceholderInTextView(placeholderText: String,textfield: UITextView) {
        textfield.text = placeholderText
        textfield.textColor = .lightGray
        
    }

}



// MARK: - Extensions
extension TextViewVC: UITextViewDelegate {
    
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        if txtvAddress.textColor == .lightGray {
            txtvAddress.text = nil
            txtvAddress.textColor = .black
        }
        return true
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if txtvAddress.text.isEmpty {
            setPlaceholderInTextView(placeholderText: Constants.String.address, textfield: txtvAddress)
        }
    }
    
}


// MARK: - Extensions
extension UITextField {
    
    // MARK: - FUNCTION
    open override func endEditing(_ force: Bool) -> Bool {
        resignFirstResponder()
    }
    
}
