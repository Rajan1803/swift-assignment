//
//  UserScreenVC.swift
//  UIComponets
//
//  Created by Rajan Patel on 30/05/23.
//

import UIKit

class UserScreenVC: BaseViewController {
   
    // Customize StatusBar
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    // hide status bar
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
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
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .done, target: self, action: #selector(btnSignUpClicked))
        let searchController = UISearchController()
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        navigationItem.title = "User"
        navigationController?.navigationBar.prefersLargeTitles = true
        let appearance = UINavigationBarAppearance()
        appearance.setBackIndicatorImage(UIImage(named: Constants.Img.faceBookLogo), transitionMaskImage: UIImage(named: Constants.Img.message))
        
        appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.red ]
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        setNeedsStatusBarAppearanceUpdate()
    }
    
    // MARK: - Action
    @objc func btnSignUpClicked() {
        UserDefaultHelper.isLogedIn = false
        guard let singUpVC = storyboard?.instantiateViewController(withIdentifier: Constants.ViewController.signUpVC) else {return}
        navigationController?.setViewControllers([singUpVC], animated: true)
    }

}

// MARK: Extension of UserScreenVC
extension UserScreenVC: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        print(searchController.searchBar.text)
    }
    
}
