//
//  GetStartedVC.swift
//  UIComponets
//
//  Created by Rajan Patel on 30/05/23.
//

import UIKit

class GetStartedVC: BaseViewController {

    // MARK: - Life cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBAction
    @IBAction func btnGetStartedClicked(_ sender: UIButton) {
        guard let signUpVC = storyboard?.instantiateViewController(withIdentifier: Constants.ViewController.signUpVC) else { return }
        navigationController?.pushViewController(signUpVC, animated: true)
    }
    
}
