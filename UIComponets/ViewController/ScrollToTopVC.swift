//
//  ScrollToTopVC.swift
//  UIComponets
//
//  Created by Rajan Patel on 24/05/23.
//

import UIKit

class ScrollToTopVC: BaseViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var scrollView: UIScrollView!
    
    // MARK: - Life cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBActions
    @IBAction func scrollToTopClicked(_ sender: UIButton) {
        scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
    }

}
