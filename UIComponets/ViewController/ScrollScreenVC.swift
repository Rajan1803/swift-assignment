//
//  ScrollScreenVC.swift
//  UIComponets
//
//  Created by Rajan Patel on 24/05/23.
//

import UIKit

class ScrollScreenVC: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var btnSignUpGoogle: UIButton!
    @IBOutlet weak var btnSignUpFB: UIButton!
    
    // MARK: - Life cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
    }
    
    // MARK: - Set up
    private func setViews() {
        btnSignUpFB.setImageToLeftOfButton(image: Constants.Img.FaceBookLogo)
        btnSignUpGoogle.setImageToLeftOfButton(image: Constants.Img.googleLogo)
    }
    
}
