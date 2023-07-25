//
//  TableViewSectionHeader.swift
//  UIComponets
//
//  Created by Rajan Patel on 05/06/23.
//

import UIKit

protocol LoadSecondVCDelegate: AnyObject {
    func seeAllButtonClicked()
}

class TableViewSectionHeader: UIView {
    
    // MARK: - Variables And Declarations
    weak var delegate: LoadSecondVCDelegate?
    
    // MARK: - IBOutlets
    @IBOutlet private weak var lblMainTitle: UILabel!
    @IBOutlet private weak var btnSeeall: UIButton!
    @IBOutlet private weak var lblSubTitle: UILabel!
    
    // MARK: - Set up
    func setUpForSecondHeader() {
        lblMainTitle.text = Constants.String.takasimuraaa
        lblSubTitle.text = Constants.String.cheapFood
    }
    
    // MARK: - IBActions
    @IBAction func btnSeeallClicked(_ sender: UIButton) {
        delegate?.seeAllButtonClicked()
    }
    
}
