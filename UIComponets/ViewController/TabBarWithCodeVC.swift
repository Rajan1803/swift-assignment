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
        
        let homeVC = UIStoryboard(name: Constants.Storybords.jobScreen, bundle: nil).instantiateViewController(withIdentifier: Constants.ViewController.jobScreenHomeVC)
       
        let homeNav = UINavigationController(rootViewController: homeVC)
        homeNav.tabBarItem =  UITabBarItem(title: "", image: UIImage(named: Constants.Img.homeNav), selectedImage: UIImage(named: Constants.Img.homeNav))
        homeNav.isNavigationBarHidden = true
        
        let emailVC = UIStoryboard(name: Constants.Storybords.jobScreen, bundle: nil).instantiateViewController(withIdentifier: Constants.ViewController.jobCollectionVC)
        
        let emailNav = UINavigationController(rootViewController: emailVC)
        emailNav.tabBarItem = UITabBarItem(title: "", image: UIImage(named: Constants.Img.message), selectedImage: UIImage(named: Constants.Img.message))
        emailNav.isNavigationBarHidden = true
        
        let bookMarkVC = UIStoryboard(name: Constants.Storybords.homeScreen, bundle: nil).instantiateViewController(withIdentifier: Constants.ViewController.homeScreenVC)
        let bookNav = UINavigationController(rootViewController: bookMarkVC)
        bookNav.tabBarItem = UITabBarItem(title: "", image: UIImage(named: Constants.Img.bookmark), selectedImage: UIImage(named: Constants.Img.bookmark))
        bookNav.isNavigationBarHidden = true
        
        let profileVC = UIStoryboard(name: Constants.Storybords.datePicker, bundle: nil).instantiateViewController(withIdentifier: Constants.ViewController.datePickerVC)
        let profileNav = UINavigationController(rootViewController: profileVC)
        profileNav.tabBarItem = UITabBarItem(title: "", image: UIImage(named: Constants.Img.category), selectedImage: UIImage(named: Constants.Img.category))
        profileNav.isNavigationBarHidden = true
        
        selectedIndex = 1
        tabBar.tintColor = .green
        tabBar.backgroundColor = .white
        setViewControllers([homeNav,emailNav,bookNav,profileNav], animated: true)
        
    }
    
}
