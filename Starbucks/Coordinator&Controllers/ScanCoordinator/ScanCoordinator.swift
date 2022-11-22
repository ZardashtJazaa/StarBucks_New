//
//  SearchCoordinator.swift
//  Starbucks
//
//  Created by Zardasht on 11/15/22.
//

import UIKit

class ScanCoordinator:Coordinator {
   
    weak var navigationController: UINavigationController?
    
    init(navigationController:UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        
        let scanController = ScanViewController()
        scanController.coordinator = self
        navigationController?.pushViewController(scanController, animated: true)
    }
    
    
    
}
