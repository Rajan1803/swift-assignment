//
//  RadioButtonVC.swift
//  UIComponets
//
//  Created by Rajan Patel on 25/04/23.
//


import UIKit

class RadioButtonVC: BaseViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private var btnCheckboxArray: [UIButton]!
    @IBOutlet private var btnRadioArray: [UIButton]!
    
    // MARK: - Life cycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
        setBtnIcon(buttons: btnCheckboxArray)
        setBtnIcon(buttons: btnRadioArray)
        print(2,#function)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(2,#function)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(2,#function)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print(2,#function)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print(2,#function)
    }
    
    override func loadView() {
        super.loadView()
        print(2,#function)
    }
    
//    override func viewWillLayoutSubviews() {
//        super.viewWillLayoutSubviews()
//        print(2,#function)
//    }
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        print(2,#function)
//    }
//    
    
    // MARK: - Set up
    private func setBtnIcon(buttons: Array<UIButton>) {
        for button in buttons {
            button.setImage(UIImage(systemName: Constants.Img.checkmarkCircle), for: .selected)
            button.setImage(UIImage(systemName: Constants.Img.circle), for: .normal)
        }
    }
    
    // MARK: - IBActions
    @IBAction func btnCheckboxClicked(_ sender: UIButton) {
                sender.isSelected = !sender.isSelected
    }
    
    // MARK: - IBActions
    @IBAction func btnRadioClicked(_ sender: UIButton) {
        for button in btnRadioArray {
            if button == sender {
                button.isSelected = true
                continue
            }
            button.isSelected = false
        }
    }
    
}
