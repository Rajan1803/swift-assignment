//
//  UITextField.swift
//  UIComponets
//
//  Created by Rajan Patel on 27/04/23.
//

import UIKit

class UITextFieldVC: BaseViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var btnSubmit: UIButton!
    @IBOutlet private weak var txtUserName: UITextField!
    @IBOutlet private weak var txtPassword: UITextField!
    @IBOutlet private weak var txtPincode: UITextField!
    @IBOutlet private weak var txtAddress: UITextField!
    @IBOutlet private weak var txtEmail: UITextField!
    
    // MARK: - Life cycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegates()
        setBorderColor(UIColor.gray.cgColor)
        setRightImage(textField: txtPassword)
    }
    
    // MARK: - Set up
    private func setDelegates() {
        txtUserName.delegate = self
        txtAddress.delegate = self
        txtPassword.delegate = self
        txtPincode.delegate = self
        txtEmail.delegate = self
    }
    
    // MARK: - Set up
    private func setTextFieldImage() {
        txtUserName.setTextFieldLeftImage(image: UIImage(named: Constants.Img.userName))
        txtPassword.setTextFieldLeftImage(image: UIImage(named: Constants.Img.password))
        txtAddress.setTextFieldLeftImage(image: UIImage(named: Constants.Img.location))
        txtPincode.setTextFieldLeftImage(image: UIImage(named: Constants.Img.pincode))
        txtEmail.setTextFieldLeftImage(image: UIImage(named: Constants.Img.email))
    }
    
    // MARK: - Set up
    private func setBorderColor(_ color: CGColor) {
        txtUserName.layer.borderWidth = Constants.standardBorderWidth
        txtUserName.layer.borderColor = color
        
        txtPassword.layer.borderWidth = Constants.standardBorderWidth
        txtPassword.layer.borderColor = color
        
        txtAddress.layer.borderWidth = Constants.standardBorderWidth
        txtAddress.layer.borderColor = color
        
        txtPincode.layer.borderWidth = Constants.standardBorderWidth
        txtPincode.layer.borderColor = color
        
        txtEmail.layer.borderWidth = Constants.standardBorderWidth
        txtEmail.layer.borderColor = color
        
    }
    
    // MARK: - Set up
    private func setRightImage(textField: UITextField) {
        let rightView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: textField.frame.size.height))
        let button = UIButton(frame: CGRect(x: 5, y: 5, width: 20, height: textField.frame.height - 10))
        button.setImage(UIImage(named: Constants.Img.solidEye), for: .normal)
        rightView.addSubview(button)
        textField.rightView = rightView
        textField.rightViewMode = .always
        button.addTarget(self, action: #selector(passwordImageTouch), for: .touchUpInside)
    }
    
    // MARK: - Action
    @objc private func passwordImageTouch(_ sender: UIButton) {
        if txtPassword.isSecureTextEntry {
            sender.setImage(UIImage(named: Constants.Img.hidePassword), for: .normal)
        }else {
            sender.setImage(UIImage(named: Constants.Img.solidEye), for: .normal)
        }
        txtPassword.isSecureTextEntry = !txtPassword.isSecureTextEntry
        
        print(#function)
    }

    // MARK: - IBActions
    @IBAction private func submitClick(_ sender: UIButton) {
        print(#function)
    }
    
}

// MARK: - Extensions
extension UITextFieldVC: UITextFieldDelegate {
    
    // MARK: - Life cycle
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print(#function)
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(#function)
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        print(#function)
        
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(#function)
        if textField == txtPassword {
            submitClick(btnSubmit)
        }
        textField.resignFirstResponder()
        textField.superview?.viewWithTag(textField.tag+1)?.becomeFirstResponder()
        return true
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        print(#function)
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print(#function)
        if (txtPincode.text?.count) ?? 0 > 5 {
            return false
        }
        return true
    }
    
}
