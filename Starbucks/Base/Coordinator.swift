//
//  Coordinator.swift
//  Starbucks
//
//  Created by Zardasht on 11/14/22.
//

import UIKit

protocol Coordinator {
    func start()
    func coordinate(to coordinator: Coordinator)
}

extension Coordinator {
    func coordinate(to coordinator: Coordinator) {
        coordinator.start()
    }
}

