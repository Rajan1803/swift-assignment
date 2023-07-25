//
//  DatePickerVC.swift
//  UIComponets
//
//  Created by Rajan Patel on 26/05/23.
//

import UIKit

class DatePickerVC: BaseViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var lblDate: UILabel!
    
    // MARK: - Life cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }

    // MARK: - Life cycle Methods
    private func setUpViews() {
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.addTarget(self, action: #selector(datePickerValueChanged), for: .valueChanged)
        let dateFormater = DateFormatter()
        dateFormater.dateStyle = .medium
        dateFormater.timeStyle = .short
//        dateFormater.dateFormat = "MM-yy-dd hh-mm-ss"
        let date = dateFormater.string(from: Date())
        lblDate.text = date
    }
    
    // MARK: - IBAction
    @IBAction func segmentSelected(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0: datePicker.preferredDatePickerStyle = .wheels
        case 1: datePicker.preferredDatePickerStyle = .compact
        case 2: datePicker.preferredDatePickerStyle = .inline
        default: datePicker.preferredDatePickerStyle = .automatic
        }
    }
    
    // MARK: - Action
    @objc func datePickerValueChanged(_ sender: UIDatePicker) {
        let dateFormator = DateFormatter()
        dateFormator.dateStyle = .medium
        dateFormator.timeStyle = .short
//        dateFormator.timeZone = .init(secondsFromGMT: 5*60*60)
//        dateFormator.dateFormat = "MM-yy-dd hh-mm-ss"
        let date = dateFormator.string(from: sender.date)
        lblDate.text = date
        print(date)
        print(sender.date)
    }
    
}
