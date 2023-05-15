//
//  ViewController.swift
//  DelegateExample
//
//  Created by Rajan Patel on 28/03/23.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Variables And Declarations
    var customView: CustomView = CustomView()
    
    // MARK: - IBOutlets
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        customView = (Bundle.main.loadNibNamed("CustomView", owner: self, options: nil)?.first as? CustomView)!
        
    }

    // MARK: - IBActions
    @IBAction func presentCustomView(_ sender: UIButton) {
        customView.center = self.view.center
        customView.delegate = self
        self.view.addSubview(customView)
    }

}

// MARK: Extension
extension ViewController: TextTransferProtocol {
    func transferText(text: String) {
        if text != "" {
            self.label.text = text
            self.customView.removeFromSuperview()
        }
    }
}

