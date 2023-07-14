//
//  TabbarCoordinator.swift
//  News
//
//  Created by Rajan Patel on 17/07/23.
//


import UIKit

class TabbarCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        guard let tabViewController = R.storyboard.homeScreen.tabBarController() else {return }
        navigationController.pushViewController(tabViewController, animated: true)
    }
    
}
