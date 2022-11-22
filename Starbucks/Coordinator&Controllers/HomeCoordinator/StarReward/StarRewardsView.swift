//
//  StarRewardsView.swift
//  Starbucks
//
//  Created by Zardasht on 11/20/22.
//

import UIKit

class StarRewardView: UIView {
    
    let stackView = UIStackView()
    let label = UILabel()
    
    struct Reward {
        let numberOfPoint: String
        let description: String
    }
    
    var rewards: [Reward] = [Reward(numberOfPoint: "25", description: "Customize your drink")
                             ,Reward(numberOfPoint: "50", description: "Brewed hot coffe, bakery item or hot tea")
                             ,Reward(numberOfPoint: "150", description: "Handcrafted drink, hot breakfast or parfait ")
                             ,Reward(numberOfPoint: "250", description: "Lunch sandwitch or protien box")
                             ,Reward(numberOfPoint: "400", description: "Select merchandies or at-home coffee")]
    
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

extension StarRewardView {
    
    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        //StackView
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 26
        //an Flag for giving space around stackView..
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 16, leading: 16, bottom: 16, trailing: -16)
        //Label
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Reward you can get with Stars"
        label.font = UIFont.preferredFont(forTextStyle: .title3).bold()
        
        backgroundColor = .tileBrown
        layer.cornerRadius = 10
    }
    
    func layout() {
        
        stackView.addArrangedSubview(label)
        
        for reward in rewards {
            stackView.addArrangedSubview(StarRewardsRow(numberOfPoints: reward.numberOfPoint
                                                        , description: reward.description))
        }
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
        ])
        
    }
    
}
