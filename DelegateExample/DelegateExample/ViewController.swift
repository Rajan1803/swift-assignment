//
//  ViewController.swift
//  DelegateExample
//
//  Created by Rajan Patel on 28/03/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    var customView: CustomView = CustomView()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        customView = (Bundle.main.loadNibNamed("CustomView", owner: self, options: nil)?.first as? CustomView)!
        
    }

    @IBAction func presentCustomView(_ sender: UIButton) {
        customView.center = self.view.center
        customView.delegate = self
        self.view.addSubview(customView)
    }

}

extension ViewController: TextTransferProtocol {
    func transferText(text: String) {
        if text != "" {
            self.label.text = text
            self.customView.removeFromSuperview()
        }
    }
}

