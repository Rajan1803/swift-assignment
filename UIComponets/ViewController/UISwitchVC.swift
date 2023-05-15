//
//  UISwitchVC.swift
//  UIComponets
//
//  Created by Rajan Patel on 04/05/23.
//

import UIKit

class UISwitchVC: BaseViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var lblCounter: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSwitch()
        setUpSlider()
        setUpProgressView()
    }
    
    // MARK: - Set up
    fileprivate func setUpSwitch() {
        let switchView = UISwitch(frame: CGRect(x: 50, y: 500, width: 200, height: 20))
        switchView.setOn(true, animated: true)
        if switchView.isOn{
            print("on state")
        }else{
            print("off state")
        }
        switchView.addTarget(self, action: #selector(self.switchStateDidChange(_:)), for: .touchUpInside)
        self.view.addSubview(switchView)
    }
    
    // MARK: - Set up
    fileprivate func setUpSlider() {
        let valueSlider = UISlider(frame: CGRect(x: 200, y: 200, width: 100, height: 20))
        valueSlider.minimumValue = 0
        valueSlider.maximumValue = 50
        valueSlider.backgroundColor = .red
        valueSlider.addTarget(self, action: #selector(self.sliderChanged(_:)), for: .valueChanged)
        valueSlider.isContinuous = true
        self.view.addSubview(valueSlider)
    }
    
    // MARK: - Set up
    fileprivate func setUpProgressView() {
        let progressView = UIProgressView( frame: CGRect(x: 10, y: 100, width: 300, height: 50))
        progressView.trackTintColor = .blue
        progressView.tintColor = .red
        progressView.backgroundColor = .gray
        progressView.setProgress(0, animated: true)
        view.addSubview(progressView)
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {_ in progressView.setProgress(progressView.progress + 0.1, animated: true)})
    }
    
    
    // MARK: - IBActions
    @IBAction func sliderClick(_ sender: UISlider) {
        print(sender.value)
    }
    // MARK: - IBActions
    @IBAction func switchClick(_ sender: UISwitch) {
        print(sender.isOn)
    }
    // MARK: - IBActions
    @objc func switchStateDidChange(_ sender: UISwitch) {
        print(sender.isOn)
    }
    
    // MARK: - Action
    @objc func sliderChanged(_ sender: UISlider) {
            print(sender.value)
        lblCounter.text = String(sender.value)
        }
}
