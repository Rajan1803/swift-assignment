//
//  TextFiledDatePickerVC.swift
//  UIComponets
//
//  Created by Rajan Patel on 26/05/23.
//

import UIKit

class TextFiledDatePickerVC: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var txtfDate: UITextField!
    
    // MARK: - Variables And Declarations
    let datePicker = UIDatePicker()
    
    // MARK: - Life cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
    }
    
    // MARK: - Set up
    private func setViews() {
        datePicker.datePickerMode = .dateAndTime
        datePicker.preferredDatePickerStyle = .inline
        datePicker.addTarget(self, action: #selector(datePickerValueChanged), for: .valueChanged)
        txtfDate.inputView = datePicker
        txtfDate.delegate = self
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let btnDone = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(btnDoneClicked))
        let flaxibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolbar.setItems([flaxibleSpace, btnDone], animated: true)
        
        txtfDate.inputAccessoryView = toolbar
    }
    
    // MARK: - Action
    @objc func btnDoneClicked(button: UIButton) {
        txtfDate.resignFirstResponder()
    }
    
    // MARK: - Action
    @objc func datePickerValueChanged(_ sender: UIDatePicker) {
        let dateFormater = DateFormatter()
        dateFormater.timeStyle = .medium
        dateFormater.dateStyle = .medium
        let date = dateFormater.string(from: sender.date)
        print(sender.date)
        print(date)
        txtfDate.text =  date
        txtfDate.resignFirstResponder()
    }
   
}

// MARK: Extension for TextFiledDatePickerVC
extension TextFiledDatePickerVC: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        false
    }
    
}
