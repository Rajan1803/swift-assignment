//
//  SignUpVC.swift
//  UIComponets
//
//  Created by Rajan Patel on 30/05/23.
//

import UIKit

class SignUpVC: UIViewController {
    
    // MARK: - Life cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBActions
    @IBAction func btnSignUpClicked(_ sender: UIButton) {
        UserDefaultHelper.isLogedIn = true
        guard let userScreenVC = storyboard?.instantiateViewController(withIdentifier: Constants.ViewController.userScreenVC) else {return}
        navigationController?.pushViewController(userScreenVC, animated: true)
        
    }
    
    @IBAction func btnLoginClicked(_ sender: UIButton) {
        guard let loginVC = storyboard?.instantiateViewController(withIdentifier: Constants.ViewController.loginVC) else { return }
        navigationController?.pushViewController(loginVC, animated: true)
    }
    
}
