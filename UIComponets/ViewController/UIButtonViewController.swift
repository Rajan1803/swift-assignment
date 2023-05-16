//
//  UIButtonViewController.swift
//  UIComponets
//
//  Created by Rajan Patel on 25/04/23.
//

import UIKit

class UIButtonViewController: BaseViewController {

    // MARK: - Variables And Declarations
    private var btnState: UIButton!
    private var isButtonLeadingDecreased = true
    // MARK: - IBOutlets
    @IBOutlet private var btnRadioAndCheckbox: UIButton!
    @IBOutlet private weak var btnSubmit: UIButton!
    @IBOutlet private weak var btnSubmitLeading: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnSubmit.configuration?.titleAlignment = .center
        setUpStateBtn()
        setUpGreenButton()
    }
    
    // MARK: - Set up 
    fileprivate func setUpStateBtn() {
        btnState = UIButton()
        btnState.frame = CGRect(x: 50, y: 400, width: 200, height: 40)
        btnState.setTitle(Constants.String.addedProgrammatically, for: .normal)
        btnState.backgroundColor = .black
        btnState.isUserInteractionEnabled = true
        btnState.setTitleColor(.white, for: .normal)
        btnState.setTitle(Constants.String.normal, for: .normal)
        btnState.setTitle(Constants.String.highlighed, for: .highlighted)
        btnState.setTitle(Constants.String.disabled, for: .disabled)
        btnState.setTitle(Constants.String.focused, for: .focused)
        btnState.addTarget(self, action: #selector(greenBtnClick(_:)), for: .touchUpInside)
        btnState.setTitleColor(.green, for: .highlighted)
        view.addSubview(btnState)
    }
    
    // MARK: - Set up
    fileprivate func setUpGreenButton() {
        let greenButton = UIButton()
        greenButton.frame = btnState.frame
        greenButton.setTitle(Constants.String.addedProgrammatically, for: .normal)
        greenButton.backgroundColor = .green
        greenButton.isUserInteractionEnabled = true
        greenButton.setTitleColor(.white, for: .normal)
        greenButton.addTarget(self, action: #selector(greenBtnClick(_:)), for: .touchUpInside)
        greenButton.layer.cornerRadius = 20
        greenButton.layer.borderColor = UIColor.blue.cgColor
        greenButton.layer.borderWidth = Constants.standardBorderWidth
        view.addSubview(greenButton)
    }
    
    // MARK: - IBActions
    @IBAction func submitBtnClick(_ sender: UIButton) {
        print("submit button clicked")
    }
    
    // MARK: - Action
    @objc private func greenBtnClick(_ sender: UIButton!) {
        print(btnState.isFocused)
        btnSubmitLeading.constant =  isButtonLeadingDecreased ? 100 : 10
        isButtonLeadingDecreased = !isButtonLeadingDecreased
    }
    
}
