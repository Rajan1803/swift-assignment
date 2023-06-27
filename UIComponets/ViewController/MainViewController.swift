//
//  MainViewController.swift
//  UIComponets
//
//  Created by Rajan Patel on 01/07/23.
//

import UIKit

class MainViewController: UIViewController, Storyboarded {

    
    var coordinator: MainScreenCoordinatoor?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func btnWebService(_ sender: Any) {
        coordinator?.goToAPIScreen()
    }
    

}
