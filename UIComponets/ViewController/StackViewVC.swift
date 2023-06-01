//
//  StackViewVC.swift
//  UIComponets
//
//  Created by Rajan Patel on 02/06/23.
//

import UIKit

class StackViewVC: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var lblSecond: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    
    // MARK: - Life cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setUpViews()
    }
    
    // MARK: - Set up
    private func setUpViews() {
        UIView.animate(withDuration: 2) { [weak self] in
            self?.lblSecond.isHidden = true
        }
    }

}
