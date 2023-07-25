//
//  ViewController.swift
//  UITextFieldValidate
//
//  Created by Rajan Patel on 05/05/23.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet var txtEmail: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // MARK: - IBAction
    @IBAction func emailValueChanged(_ sender: UITextField) {
        print(isEmailValid(email: sender.text))
        if isEmailValid(email: sender.text){
            setTextFieldBorderColor(textfield: txtEmail, color: .gray)
        }else{
            setTextFieldBorderColor(textfield: txtEmail, color: .red)
        }
    }
    
    // MARK: - IBAction
    @IBAction func btnSubmit(_ sender: Any) {
        print(#function)
    }
    
    // MARK: - FUNCTIONS
    func isEmailValid(email: String?) -> Bool{
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

            let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            return emailPred.evaluate(with: email ?? "")
        
    }
    
    func setTextFieldBorderColor(textfield: UITextField,color: UIColor){
        textfield.layer.borderWidth = 2
        textfield.layer.borderColor = color.cgColor
    }
   
}

