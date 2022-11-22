//
//  TabBarCoordinator.swift
//  Starbucks
//
//  Created by Zardasht on 11/15/22.
//


import UIKit

class TabBarCoordinator: Coordinator {
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        
        let tabBarController = TabBarViewController()
        tabBarController.coordinator = self
//        let tabBarAppearance = UITabBar.appearance()
//        tabBarAppearance.isTranslucent = true
        
        //Home
        let homeNavigationController = UINavigationController()
        let configuration = UIImage.SymbolConfiguration(scale: .large)
        let imageConfigurationHome = UIImage(systemName: "house.fill", withConfiguration: configuration )
        homeNavigationController.tabBarItem = UITabBarItem(title: "Home", image: imageConfigurationHome, tag: 0)
        let homeCoordinator = HomeCoordinator(navigationController: homeNavigationController)
        
        //Scan
        let scanNavigationController = UINavigationController()
        let imageConfigurationScan = UIImage(systemName: "qrcode", withConfiguration:configuration )
        scanNavigationController.tabBarItem = UITabBarItem(title: "Scan", image: imageConfigurationScan, tag: 1)
        let scanCoordinator = ScanCoordinator(navigationController: scanNavigationController)
        
        //Order
        let orderNavigationController = UINavigationController()
        let imageConfigurationHistory = UIImage(systemName: "arrow.up.bin.fill", withConfiguration:configuration )
        orderNavigationController.tabBarItem = UITabBarItem(title: "Order", image: imageConfigurationHistory, tag: 2)
        let orderCoordinator = OrderCoordinator(navigationController: orderNavigationController)
        
         //Gift
        let giftNavigationController = UINavigationController()
        let imageConfigurationGift = UIImage(systemName: "gift.fill", withConfiguration:configuration )
        giftNavigationController.tabBarItem = UITabBarItem(title: "Gift", image: imageConfigurationGift, tag: 3)
        let giftCoordinator = GiftCoordinator(navigationController: giftNavigationController)
        
        
        
        
        tabBarController.viewControllers = [homeNavigationController,scanNavigationController,orderNavigationController,giftNavigationController]
         
        tabBarController.modalPresentationStyle = .fullScreen
        navigationController.present(tabBarController, animated: false, completion: nil)
        
        coordinate(to: homeCoordinator)
        coordinate(to: scanCoordinator)
        coordinate(to: orderCoordinator)
        coordinate(to: giftCoordinator)
        
    }
    
    
}
