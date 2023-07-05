//
//  Coordinator.swift
//  UIComponets
//
//  Created by Rajan Patel on 01/07/23.
//

import UIKit

protocol Coordinator: AnyObject {
    
    var navigationController: UINavigationController { get set }
    
    init(navigationController: UINavigationController)
    
    func start()
    
}
