//
//  MainScreenCoordinatoor.swift
//  UIComponets
//
//  Created by Rajan Patel on 01/07/23.
//

import UIKit

class MainScreenCoordinatoor: Coordinator {
    
    var navigationController: UINavigationController
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
           let mainScreenVC = MainViewController.instantiate(from: .main)
           mainScreenVC.coordinator = self
           navigationController.viewControllers = [mainScreenVC]
       }
       
   
    func goToAPIScreen() {
        let newsCoordinator  = APIScreenCoordinatoor.init(navigationController: navigationController)
        newsCoordinator.start()
    }
    
}
