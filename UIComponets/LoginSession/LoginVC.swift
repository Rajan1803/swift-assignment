//
//  LoginVC.swift
//  UIComponets
//
//  Created by Rajan Patel on 30/05/23.
//

import UIKit

class LoginVC: BaseViewController {

    // MARK: - Life cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBActions
    @IBAction func btnLogInClicked(_ sender: Any) {
        UserDefaultHelper.isLogedIn = true
        guard let userScreenVC = storyboard?.instantiateViewController(withIdentifier: Constants.ViewController.userScreenVC) else {return}
        navigationController?.pushViewController(userScreenVC, animated: true)
    }
    
    @IBAction func btnSignUpClicked(_ sender: UIButton) {
        guard let signUpVC = storyboard?.instantiateViewController(withIdentifier: Constants.ViewController.signUpVC) else {return}
        navigationController?.pushViewController(signUpVC, animated: true)
    }
    
}
