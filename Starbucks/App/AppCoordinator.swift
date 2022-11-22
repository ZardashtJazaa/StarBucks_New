//
//  AppCoordinator.swift
//  Starbucks
//
//  Created by Zardasht on 11/15/22.
//

import UIKit

class AppCoordinator: Coordinator {
    
    let window: UIWindow
    
    init(window:UIWindow) {
        self.window = window
        window.backgroundColor = .systemBackground
    }
    func start() {
        
        let navigationController = UINavigationController()
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        let startCoordinator = TabBarCoordinator(navigationController: navigationController)
        coordinate(to: startCoordinator)
        
    }
}
