//
//  TabBarWithCodeVC.swift
//  UIComponets
//
//  Created by Rajan Patel on 25/05/23.
//

import UIKit

class TabBarWithCodeVC: UITabBarController {

    // MARK: - Life cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTabBarController()
    }

    // MARK: - Set up
    private func setUpTabBarController() {
        
        let homeVC = UIStoryboard(name: Constants.Storybords.JobScreen, bundle: nil).instantiateViewController(withIdentifier: Constants.ViewController.JobScreenHomeVC)
        homeVC.tabBarItem =  UITabBarItem(title: "Home", image: UIImage(named: Constants.Img.circle), selectedImage: UIImage(named: Constants.Img.checkmarkCircle))
        
        let emailVC = UIStoryboard(name: Constants.Storybords.JobScreen, bundle: nil).instantiateViewController(withIdentifier: Constants.ViewController.JobCollectionVC)
        emailVC.tabBarItem = UITabBarItem(title: "Email", image: UIImage(named: Constants.Img.circle), selectedImage: UIImage(named: Constants.Img.checkmarkCircle))
        
        let bookMarkVC = UIStoryboard(name: Constants.Storybords.HomeScreen, bundle: nil).instantiateViewController(withIdentifier: Constants.ViewController.HomeScreenVC)
        bookMarkVC.tabBarItem = UITabBarItem(title: "BookMarks", image: UIImage(named: Constants.Img.circle), selectedImage: UIImage(named: Constants.Img.checkmarkCircle))
        
        let profileVC = UIViewController()
        profileVC.view.backgroundColor = .red
        profileVC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: Constants.Img.circle), selectedImage: UIImage(named: Constants.Img.checkmarkCircle))
        
        selectedIndex = 1
        tabBar.tintColor = .blue
        tabBar.backgroundColor = .white
        setViewControllers([homeVC,emailVC,bookMarkVC,profileVC], animated: true)
        
    }
    
}
