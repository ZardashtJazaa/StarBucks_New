//
//  GiftCoordinator.swift
//  Starbucks
//
//  Created by Zardasht on 11/15/22.
//

import UIKit

class GiftCoordinator:Coordinator {
    
    weak var navigationController: UINavigationController?
    
    init(navigationController:UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        
        let giftController = GiftViewController()
        giftController.coordinator = self
        navigationController?.pushViewController(giftController, animated: true)
    }
}
