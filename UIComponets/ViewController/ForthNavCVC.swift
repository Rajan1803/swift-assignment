//
//  ForthNavCVC.swift
//  UIComponets
//
//  Created by Rajan Patel on 29/05/23.
//

import UIKit

class ForthNavCVC: BaseViewController {

    // MARK: - Life cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    // MARK: - Set up
    private func setUpViews() {
        view.backgroundColor = .brown
    }
    
    // MARK: - IBActions
    @IBAction func btnNextClicked(_ sender: UIButton) {
        print("button Clicked")
    }
    
}
