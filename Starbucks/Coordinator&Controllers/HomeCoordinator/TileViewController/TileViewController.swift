//
//  TileViewController.swift
//  Starbucks
//
//  Created by Zardasht on 11/16/22.
//

import UIKit


class TileViewController: UIViewController {
    
    let tileView = TileView()
    
     init(title:String,subTitle:String,imageName:String) {
         super.init(nibName: nil, bundle: nil)
         self.tileView.titleLabel.text = title
         self.tileView.subTitleLabel.text = subTitle
         self.tileView.imageView.image = UIImage(named: imageName)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        style()
    }
    
    private func style() {
        //TileView
        tileView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func layout() {
        
        view.addSubview(tileView)
        NSLayoutConstraint.activate([
            //TileView
            tileView.topAnchor.constraint(equalTo: view.topAnchor),
            tileView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tileView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tileView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        
        ])
    }
}
