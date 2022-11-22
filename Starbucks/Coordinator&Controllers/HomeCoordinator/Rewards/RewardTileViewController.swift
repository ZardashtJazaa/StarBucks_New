//
//  RewardTileViewController.swift
//  Starbucks
//
//  Created by Zardasht on 11/16/22.
//

import UIKit

class RewardTileViewController:UIViewController {
    
    let rewardTileView = RewardTileView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(rewardTileView)
        
        NSLayoutConstraint.activate([
        
            rewardTileView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            rewardTileView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            rewardTileView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            rewardTileView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
        ])
    }
    
}
