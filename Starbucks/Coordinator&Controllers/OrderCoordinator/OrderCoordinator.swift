//
//  OrderCoordinator.swift
//  Starbucks
//
//  Created by Zardasht on 11/15/22.
//

import UIKit

class OrderCoordinator:Coordinator {
    
    weak var navigationController: UINavigationController?
    
    init(navigationController:UINavigationController) {
        self.navigationController = navigationController
    }
    
    
    func start() {
        
        let orderController = OrderViewController()
        orderController.coordinator = self
        navigationController?.pushViewController(orderController, animated: true)
        
    }
    
    
    
    
}
