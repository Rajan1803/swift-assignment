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
    
    // MARK: - Life cycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
        btnSubmit.configuration?.titleAlignment = .center
        setUpStateBtn()
        setUpGreenButton()
        print(1,#function)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(1,#function)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(1,#function)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print(1,#function)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print(1,#function)
    }

    override func loadView() {
        super.loadView()
        print(1,#function)
    }

//    override func viewWillLayoutSubviews() {
//        super.viewWillLayoutSubviews()
//        print(1,#function)
//    }
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        print(1,#function)
//    }
    
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
        btnState.addTarget(self, action: #selector(btnGreenClicked(_:)), for: .touchUpInside)
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
        greenButton.addTarget(self, action: #selector(btnGreenClicked(_:)), for: .touchUpInside)
        greenButton.layer.cornerRadius = 20
        greenButton.layer.borderColor = UIColor.blue.cgColor
        greenButton.layer.borderWidth = Constants.standardBorderWidth
        view.addSubview(greenButton)
    }
    
    // MARK: - IBActions
    @IBAction func btnSubmitClicked(_ sender: UIButton) {
        print("submit button clicked")
    }
    
    // MARK: - Action
    @objc private func btnGreenClicked(_ sender: UIButton!) {
        print(btnState.isFocused)
        btnSubmitLeading.constant =  isButtonLeadingDecreased ? 100 : 10
        isButtonLeadingDecreased = !isButtonLeadingDecreased
    }
    
    
    
}
