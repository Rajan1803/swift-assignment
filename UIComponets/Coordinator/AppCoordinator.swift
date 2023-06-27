//
//  AppCoordinator.swift
//  UIComponets
//
//  Created by Rajan Patel on 01/07/23.
//

import UIKit

class AppCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        goToMainScreen()
    }
    
    func goToMainScreen() {
        let mainScreenCoordinator = MainScreenCoordinatoor(navigationController: navigationController)
        mainScreenCoordinator.start()
    }
    
}
