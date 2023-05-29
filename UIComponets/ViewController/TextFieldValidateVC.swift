//
//  TextFieldValidateVC.swift
//  UIComponets
//
//  Created by Rajan Patel on 04/05/23.
//

import UIKit

class TextFieldValidateVC: BaseViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var txtfPassword: UITextField!
    @IBOutlet private weak var txtfPincode: UITextField!
    @IBOutlet private weak var txtfUserName: UITextField!
    @IBOutlet private weak var txtfEmail: UITextField!
    @IBOutlet private weak var btnSubmit: UIButton!
    @IBOutlet private weak var lblPincodeInvalid: UILabel!
    @IBOutlet private weak var lblUserNameInvalid: UILabel!
    @IBOutlet private weak var lblPasswordInvalid: UIView!
    @IBOutlet private weak var lblEmailInvalid: UILabel!
    
    // MARK: - Life cycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
        lblEmailInvalid.isHidden = true
        lblPincodeInvalid.isHidden = true
        lblUserNameInvalid.isHidden = true
        lblPasswordInvalid.isHidden = true
        btnSubmit.isEnabled = false
    }
    
    // MARK: - IBActions
    @IBAction func btnSubmitClicked(_ sender: Any) {
        print("submit Button Clicked")
    }
    
    // MARK: - IBActions
    @IBAction func txtfEmailChange(_ sender: UITextField) {
        if Validator.shared.isEmailValid(email: sender.text) {
            lblEmailInvalid.isHidden = true
        } else {
            lblEmailInvalid.isHidden = false
        }
        isSubmitBtnEnable()
    }
    
    // MARK: - IBActions
    @IBAction func txtfUserNameChange(_ sender: UITextField) {
        if sender.text != nil && sender.text != ""{
            lblUserNameInvalid.isHidden = true
        } else {
            lblUserNameInvalid.isHidden = false
        }
        isSubmitBtnEnable()
    }
    
    
    // MARK: - IBActions
    @IBAction func txtfPincodeChange(_ sender: UITextField) {
        if Validator.shared.isPincodeValid(pincode: sender.text ) {
            lblPincodeInvalid.isHidden = true
        } else {
            lblPincodeInvalid.isHidden = false
        }
         isSubmitBtnEnable()
        }

    // MARK: - IBActions
    @IBAction func txtfPasswordChange(_ sender: UITextField) {
        if Validator.shared.isPasswordValid(password: sender.text ) {
            lblPasswordInvalid.isHidden = true
        }else {
            lblPasswordInvalid.isHidden = false
        }
        isSubmitBtnEnable()
    }
    
    // MARK: - FUNCTION
    private func isSubmitBtnEnable() {
        if isAllInputValid() {
            btnSubmit.isEnabled = true
        } else {
            btnSubmit.isEnabled = false
        }
    }
    
    // MARK: - FUNCTION
    private func isAllInputValid() -> Bool {
        if Validator.shared.isPasswordValid(password: txtfPassword.text ) && Validator.shared.isEmailValid(email: txtfEmail.text ) && Validator.shared.isPincodeValid(pincode: txtfPincode.text ) && !(txtfUserName.text?.isEmpty ?? false)  {
            return true
        } else {
            return false
        }
    }
    
}

