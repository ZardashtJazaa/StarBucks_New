//
//  TabBarViewController.swift
//  Starbucks
//
//  Created by Zardasht on 11/14/22.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    var coordinator: TabBarCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTabBar()
    }
    
   
    private func setUpTabBar() {
        self.tabBar.layer.masksToBounds = true
        self.tabBar.barStyle = .black
        self.tabBar.barTintColor = .white
        self.tabBar.tintColor = .lightGreen
        self.tabBar.isTranslucent = false
        self.tabBar.layer.shadowColor = UIColor.lightGray.cgColor
        self.tabBar.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        self.tabBar.layer.shadowRadius = 10
        self.tabBar.layer.shadowOpacity = 1
        self.tabBar.layer.masksToBounds = false
    }
    
}
