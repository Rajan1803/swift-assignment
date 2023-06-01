//
//  NavigationControlVC.swift
//  UIComponets
//
//  Created by Rajan Patel on 29/05/23.
//

import UIKit

class NavigationControlVC: BaseViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var lblData: UILabel!
    @IBOutlet weak var txtfName: UITextField!
    
    // MARK: - Life cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    // MARK: - Set up
    private func setUpViews() {
        view.backgroundColor = .blue
        navigationController?.delegate = self
    }
    
    // MARK: - IBAction
    @IBAction func btnNextClicked(_ sender: UIButton) {
        guard let secondVC = storyboard?.instantiateViewController(withIdentifier: Constants.ViewController.secondNavCVC) as? SecondNavCVC else {
            return
        }
        secondVC.name = txtfName.text
        secondVC.delegate = self
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    
}

// MARK: Extension of NavigationControlVC
extension NavigationControlVC: UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        print(self,#function)
    }
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        print(self,#function)
    }
    
}

// MARK: Extension of NavigationControlVC
extension NavigationControlVC: PassDataProtocol {
    
    func nextButtonClicked(data: String?) {
        lblData.text = data
    }
    
}
