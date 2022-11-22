//
//  StarRewardsRow.swift
//  Starbucks
//
//  Created by Zardasht on 11/20/22.
//

import UIKit


class StarRewardsRow: UIView {
    
    let starsAndPoint = StarAndPoint()
    let descriptionLabel = UILabel()
    
    init(numberOfPoints:String , description:String) {
        starsAndPoint.pointsLabel.text = numberOfPoints
        descriptionLabel.text = description
        super.init(frame: .zero)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("Init Coder has Not been Implemented!")
        
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 10, height: 16)
        
    }
}


extension StarRewardsRow {
    
    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.font = UIFont.preferredFont(forTextStyle: .footnote)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.lineBreakMode = .byWordWrapping
        descriptionLabel.sizeToFit()
    }
    
    func layout() {
        
        addSubview(descriptionLabel)
        addSubview(starsAndPoint)
        
        NSLayoutConstraint.activate([
        
            //StarsAndPoints
            starsAndPoint.topAnchor.constraint(equalTo: topAnchor),
            starsAndPoint.leadingAnchor.constraint(equalTo: leadingAnchor),
            starsAndPoint.bottomAnchor.constraint(equalTo: bottomAnchor),
            //DescriptionLabel
            descriptionLabel.topAnchor.constraint(equalTo: topAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: starsAndPoint.trailingAnchor,constant: 4),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            
        ])
        
        starsAndPoint.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        descriptionLabel.heightAnchor.constraint(equalToConstant: descriptionLabel.frame.size.height).setActiveBreakable()
        
    }
    
}
