//
//  SecondNavCVC.swift
//  UIComponets
//
//  Created by Rajan Patel on 29/05/23.
//

import UIKit

// MARK: - Protocol for data passing
protocol PassDataProtocol: AnyObject {
    
    func nextButtonClicked(data: String?)
    
}

class SecondNavCVC: BaseViewController {
        
    // MARK: - IBOutlets
    @IBOutlet weak var txtfInputData: UITextField!
    @IBOutlet weak var lblName: UILabel!
    
    // MARK: - Variables And Declarations
    var name: String?
    weak var delegate: PassDataProtocol?

    // MARK: - Life cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setUpViews()
    }
    
    // MARK: - Set up
    private func setUpViews() {
        view.backgroundColor = .yellow
        lblName.text = name
    }
    
    // MARK: - IBActions
    @IBAction func btnNextClicked(_ sender: UIButton) {
        delegate?.nextButtonClicked(data: txtfInputData.text)
        guard let thirdVC = storyboard?.instantiateViewController(withIdentifier: Constants.ViewController.thirdNavCVC) as? ThirdNavCVC else { return }
        thirdVC.inputData = txtfInputData.text
        thirdVC.delegate = delegate
        self.navigationController?.pushViewController(thirdVC, animated: true)
    }
    
}
