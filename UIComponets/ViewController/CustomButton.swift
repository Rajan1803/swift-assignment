//
//  RoundCornerButton.swift
//  UIComponets
//
//  Created by Rajan Patel on 08/05/23.
//

import UIKit

  class CustomButton: UIView {

    // MARK: - IBOutlets
    @IBOutlet private var containerView: UIView!
    @IBOutlet private weak var btnSubmit: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpView()
    }
    
     // MARK: - Set up
    private func setUpView() {
        Bundle.main.loadNibNamed(Constants.Nib.customButton, owner: self)
        addSubview(containerView)
        containerView.frame = self.bounds
        containerView.autoresizingMask = [.flexibleHeight,.flexibleWidth]
        containerView.layer.cornerRadius = 10
    }
     
     // MARK: - IBInspectable
     @IBInspectable var bgcolor: UIColor? {
         get {
             return btnSubmit.backgroundColor
         }
         set {
             btnSubmit.backgroundColor = newValue
         }
     }
     
    

}
