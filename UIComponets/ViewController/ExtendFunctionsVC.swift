//
//  ExtendFunctionsVC.swift
//  UIComponets
//
//  Created by Rajan Patel on 05/05/23.
//

import UIKit

class ExtendFunctionsVC: BaseViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var lblName: UILabel!
    @IBOutlet private weak var btnSubmit: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnSubmit.applyCornerRadius(radius: 20)
        btnSubmit.applyBorderColor(borderColor: .init(red: 1, green: 0, blue: 0, alpha: 1),borderWidth: 2)
        
    }
}

