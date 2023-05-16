//
//  SegmentedControllVC.swift
//  UIComponets
//
//  Created by Rajan Patel on 04/05/23.
//

import UIKit

class SegmentedControllVC: BaseViewController {
    
    private let lblPage = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        let languageSegment = getLanguageSegmentedControl()
        setUpLabel()
        view.addSubview(languageSegment)
        view.addSubview(lblPage)
    }
    
    // MARK: - Set up
    private func setUpLabel() {
        lblPage.frame =  CGRect(x: 20, y: 200, width: 200, height: 50)
        lblPage.text = "First"
    }
    
    
    // MARK: - IBActions
    @IBAction func segmentedSelection(_ sender: UISegmentedControl) {
        lblPage.text = SegmentedTypes(rawValue: sender.selectedSegmentIndex)?.getValue()
    }
    
    // MARK: - Set up
    private func getLanguageSegmentedControl() -> UISegmentedControl {
        let segmentLanguage = UISegmentedControl(frame: CGRect(x: 10, y: 500, width:view.frame.size.width - 20, height: 50))
        segmentLanguage.insertSegment(withTitle: "c", at: 0, animated: true)
        segmentLanguage.insertSegment(withTitle: "Java", at: 1, animated: true)
        segmentLanguage.insertSegment(withTitle: "swift", at: 2, animated: true)
        segmentLanguage.setWidth(200, forSegmentAt: 1)
        segmentLanguage.selectedSegmentIndex = 0
        segmentLanguage.addTarget(self, action: #selector(segmentLanguageOnClick), for: .valueChanged)
        return segmentLanguage
    }
    
    // MARK: - Action
    @objc func segmentLanguageOnClick(_ sender: UISegmentedControl) {
        print(LanguageSegmentTypes(rawValue: sender.selectedSegmentIndex)?.getValue() ?? "")
    }
}
