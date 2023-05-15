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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBtnIcon(buttons: btnCheckboxArray)
        setBtnIcon(buttons: btnRadioArray)
    }
    
    // MARK: - Set up
    private func setBtnIcon(buttons: Array<UIButton>) {
        for button in buttons {
            button.setImage(UIImage(systemName: Constants.Img.checkmarkCircle), for: .selected)
            button.setImage(UIImage(systemName: Constants.Img.circle), for: .normal)
        }
    }
    
    // MARK: - IBActions
    @IBAction func checkboxBtnClick(_ sender: UIButton) {
                sender.isSelected = !sender.isSelected
    }
    
    // MARK: - IBActions
    @IBAction func radioBtnClick(_ sender: UIButton) {
        for button in btnRadioArray {
            if button == sender {
                button.isSelected = true
                continue
            }
            button.isSelected = false
        }
    }
}
