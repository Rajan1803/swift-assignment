//
//  BaseViewController.swift
//  UIComponets
//
//  Created by Rajan Patel on 09/05/23.
//

import UIKit

class BaseViewController: UIViewController {

    // MARK: - Life cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        print(self,#function)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print(self,#function)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print(self,#function)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print(self,#function)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print(self,#function)
    }
    
    deinit {
        print("deinit called \(self)")
    }
    
}
