//
//  SwitchVC.swift
//  UIComponets
//
//  Created by Rajan Patel on 05/05/23.
//

import UIKit

class SwitchVC: BaseViewController {

    // MARK: - IBOutlets
    @IBOutlet private var uiSlider: UISlider!
    @IBOutlet private var uiSwitch: UISwitch!
    
    // MARK: - Life cycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
        createUiSwitch()
        createSlider()
        createProgressView()
        uiSlider.createBorder(color: CGColor(red: 1, green: 0, blue: 0, alpha: 1), width: 2)
    }
    
    // MARK: - IBActions
    @IBAction func uiSliderValueChange(_ sender: UISlider) {
        print(sender.value)
    }
    @IBAction func uiSwitchClick(_ sender: UISwitch) {
        print(sender.isOn)
    }
    
    // MARK: - Set up
    private func createProgressView() {
        let progressView = UIProgressView(frame: CGRect(x: 10, y: 300, width: view.frame.size.width - 20, height: 50))
        progressView.progressTintColor = .blue
        progressView.trackTintColor = .brown
        progressView.tintColor = .black
        progressView.setProgress(0.9, animated: true)
        view.addSubview(progressView)
    }

    // MARK: - Set up
    private func createSlider() {
        let newSlider = UISlider(frame: CGRect(x: 10, y: 500, width: view.frame.size.width - 20, height: 50))
        newSlider.minimumTrackTintColor = .red
        newSlider.thumbTintColor = .brown
        newSlider.maximumTrackTintColor = .green
        newSlider.minimumValue = 0
        newSlider.maximumValue = 10
        newSlider.value = 0.5
        view.addSubview(newSlider)
    }
    
    // MARK: - Set up
    private func createUiSwitch() {
        let newSwitch = UISwitch(frame: CGRect(x: 10, y: 200, width: 50, height: 36))
        newSwitch.setOn(true, animated: false)
        newSwitch.onTintColor = .red
        newSwitch.thumbTintColor = .brown
        view.addSubview(newSwitch)
    }
   
}
