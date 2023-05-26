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
       
        let homeNav = UINavigationController(rootViewController: homeVC)
        homeNav.tabBarItem =  UITabBarItem(title: "", image: UIImage(named: Constants.Img.HomeNav), selectedImage: UIImage(named: Constants.Img.HomeNav))
        homeNav.isNavigationBarHidden = true
        
        let emailVC = UIStoryboard(name: Constants.Storybords.JobScreen, bundle: nil).instantiateViewController(withIdentifier: Constants.ViewController.JobCollectionVC)
        
        let emailNav = UINavigationController(rootViewController: emailVC)
        emailNav.tabBarItem = UITabBarItem(title: "", image: UIImage(named: Constants.Img.Message), selectedImage: UIImage(named: Constants.Img.Message))
        emailNav.isNavigationBarHidden = true
        
        let bookMarkVC = UIStoryboard(name: Constants.Storybords.HomeScreen, bundle: nil).instantiateViewController(withIdentifier: Constants.ViewController.HomeScreenVC)
        let bookNav = UINavigationController(rootViewController: bookMarkVC)
        bookNav.tabBarItem = UITabBarItem(title: "", image: UIImage(named: Constants.Img.bookmark), selectedImage: UIImage(named: Constants.Img.bookmark))
        bookNav.isNavigationBarHidden = true
        
        let profileVC = UIStoryboard(name: Constants.Storybords.DatePicker, bundle: nil).instantiateViewController(withIdentifier: Constants.ViewController.DatePickerVC)
        let profileNav = UINavigationController(rootViewController: profileVC)
        profileNav.tabBarItem = UITabBarItem(title: "", image: UIImage(named: Constants.Img.Category), selectedImage: UIImage(named: Constants.Img.Category))
        profileNav.isNavigationBarHidden = true
        
        selectedIndex = 1
        tabBar.tintColor = .green
        tabBar.backgroundColor = .white
        setViewControllers([homeNav,emailNav,bookNav,profileNav], animated: true)
        
    }
    
}
