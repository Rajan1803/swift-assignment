//
//  APIScreenCoordinatoor.swift
//  UIComponets
//
//  Created by Rajan Patel on 01/07/23.
//

import UIKit

class APIScreenCoordinatoor: Coordinator {
    
    var navigationController: UINavigationController
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        goToNews()
    }
    
    func goToNews() {
        let newsViewController = UploadVC.instantiate(from: .webService)
        navigationController.pushViewController(newsViewController, animated: true)
    }
    
}
