//
//  AppDelegate.swift
//  Starbucks
//
//  Created by Zardasht on 11/14/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    var coordinator: AppCoordinator?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        coordinator = AppCoordinator(window: window!)
        coordinator?.start()
       
        return true
    }

}

