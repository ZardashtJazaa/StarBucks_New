//
//  BalanceView.swift
//  Starbucks
//
//  Created by Zardasht on 11/16/22.
//

import UIKit

class BalanceView: UIView {
    
    let pointLabel = UILabel()
    let starView = makeSymbolImageView(systemName:"star.fill")
    let starBalanceLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        style()
        layout()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("Init Coder has Not been Implemented!")
        
    }
    
}

extension BalanceView {
    
    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        //PointLabel
        pointLabel.translatesAutoresizingMaskIntoConstraints = false
        pointLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle).bold()
        pointLabel.text = "12"
        //StarView
        starView.translatesAutoresizingMaskIntoConstraints = false
        starView.tintColor = .starYellow
        starView.contentMode = .scaleAspectFit
        //starBalanceLabel
        starBalanceLabel.translatesAutoresizingMaskIntoConstraints = false
        starBalanceLabel.font = UIFont.preferredFont(forTextStyle: .footnote)
        starBalanceLabel.textColor = .label
        starBalanceLabel.text = "Star balance"
        
    }
  
    
    func layout() {
        
        addSubview(pointLabel)
        addSubview(starView)
        addSubview(starBalanceLabel)
        
        NSLayoutConstraint.activate([
            //PointLabel
            pointLabel.topAnchor.constraint(equalTo: topAnchor),
            pointLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            //StarView
            starView.leadingAnchor.constraint(equalTo: pointLabel.trailingAnchor, constant: -2),
            starView.centerYAnchor.constraint(equalTo: pointLabel.centerYAnchor,constant: 4),
            starView.heightAnchor.constraint(equalToConstant: 15),
            //StarBalanceLabel
            starBalanceLabel.topAnchor.constraint(equalTo: pointLabel.bottomAnchor,constant: 0),
            starBalanceLabel.leadingAnchor.constraint(equalTo: pointLabel.leadingAnchor),
            starBalanceLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            starBalanceLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            
        ])
        
    }
    
}
