//
//  UIStepperVC.swift
//  UIComponets
//
//  Created by Rajan Patel on 08/05/23.
//

import UIKit

class UIStepperVC: BaseViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var stepper: UIStepper!
    @IBOutlet private weak var lblValue: UILabel!
    
    // MARK: - Life cycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpStepper()
    }
    
    // MARK: - Set up
    private func setUpStepper() {
        let stepper = UIStepper(frame: CGRect(x: 50, y: 500, width: 100, height: 50))
        stepper.value = 5
        stepper.minimumValue = 0
        stepper.maximumValue = 10
        stepper.isContinuous = true
        stepper.setIncrementImage(UIImage(systemName: Constants.Img.circle), for: .normal)
        stepper.setIncrementImage(UIImage(systemName: Constants.Img.squareAndArrowUp), for: .selected)
        stepper.setIncrementImage(UIImage(systemName: Constants.Img.squareAndArrowDown), for: .highlighted)
        stepper.setDividerImage(UIImage(systemName: Constants.Img.circle), forLeftSegmentState: .normal, rightSegmentState: .normal)
        stepper.autorepeat = true
        view.addSubview(stepper)
    }
    
    // MARK: - IBActions
    @IBAction func stepperValueChage(_ sender: UIStepper) {
        lblValue.text = "\(sender.value)"
    }
    
}
