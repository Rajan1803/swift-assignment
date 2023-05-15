//
//  ViewController.swift
//  Localize
//
//  Created by Rajan Patel on 27/04/23.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var lblGreet: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblGreet.text = NSLocalizedString("Good Morning", comment: "")
    }


}

