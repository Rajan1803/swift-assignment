//
//  BaseViewController.swift
//  UIComponets
//
//  Created by Rajan Patel on 09/05/23.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    deinit {
        print("deinit called \(self)")
    }
    
}
