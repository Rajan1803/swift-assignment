//
//  ThirdNavCVC.swift
//  UIComponets
//
//  Created by Rajan Patel on 29/05/23.
//

import UIKit


class ThirdNavCVC: BaseViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var txtfInput: UITextField!
    
    // MARK: - Variables And Declarations
    var inputData: String?
    weak var delegate: PassDataProtocol?
    
    // MARK: - Life cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    // MARK: - Set up
    private func setUpViews() {
        view.backgroundColor = .red
        txtfInput.text = inputData
    }
    
    // MARK: - IBActions
    @IBAction func btnNextClicked(_ sender: UIButton) {
        delegate?.nextButtonClicked(data: txtfInput.text)
        navigationController?.popToRootViewController(animated: true)
    }
    
}
