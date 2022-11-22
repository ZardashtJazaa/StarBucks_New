//
//  TopRatedCoordinator.swift
//  Starbucks
//
//  Created by Zardasht on 11/15/22.
//

import UIKit

class HomeCoordinator:Coordinator {
    
    weak var navigationController: UINavigationController?
    
    init(navigationController:UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        
        let homeViewController = HomeViewController()
        homeViewController.coordinator = self
        navigationController?.pushViewController(homeViewController, animated: false)
        homeViewController.navigationController?.isNavigationBarHidden = true
    }
    
    
}
