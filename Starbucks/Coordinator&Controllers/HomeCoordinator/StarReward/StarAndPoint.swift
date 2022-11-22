//
//  StarAndReward.swift
//  Starbucks
//
//  Created by Zardasht on 11/20/22.
//

import UIKit

class StarAndPoint: UIView {
    let pointsLabel = UILabel()
    let starView = makeSymbolImageView(systemName: "star.fill",scale: .small)
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        layout()
        style()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init Coder has not been implemented..")
    }
}

extension StarAndPoint {
    
    private func style() {
        translatesAutoresizingMaskIntoConstraints = false
        //PointLabel
        pointsLabel.translatesAutoresizingMaskIntoConstraints = false
        pointsLabel.font = UIFont.preferredFont(forTextStyle: .callout).bold()
        pointsLabel.textAlignment = .right
        //StarView
        starView.translatesAutoresizingMaskIntoConstraints = false
        starView.tintColor = .starYellow
        starView.contentMode = .scaleAspectFit
    }
    
    private func layout() {
        
        addSubview(pointsLabel)
        addSubview(starView)
        
        NSLayoutConstraint.activate([
            //PointsLabel
            pointsLabel.topAnchor.constraint(equalTo: topAnchor,constant: 2),
            pointsLabel.trailingAnchor.constraint(equalTo: starView.leadingAnchor,constant: -2),
            pointsLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            //StarView
            starView.trailingAnchor.constraint(equalTo: trailingAnchor),
            starView.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 60, height: 16)
    }
}
