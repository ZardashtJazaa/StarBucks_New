//
//  TileView.swift
//  Starbucks
//
//  Created by Zardasht on 11/16/22.
//

import UIKit

class TileView: UIView {
    
    var imageView = UIImageView()
    var titleLabel = UILabel()
    var subTitleLabel = UILabel()
    private var shadowLayer: CAShapeLayer!
    let orderButton = makeGreenButton(withText:"Order")
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("Init Coder has Not been Implemented!")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addShadow()
    }
    
    private func addShadow() {
        
        shadowLayer = CAShapeLayer()
        shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: 6).cgPath
        shadowLayer.fillColor = UIColor.white.cgColor
        
        shadowLayer.shadowColor = UIColor.black.cgColor
        shadowLayer.shadowPath = shadowLayer.path
        shadowLayer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        shadowLayer.shadowOpacity = 0.1
        shadowLayer.cornerRadius = 1
        layer.insertSublayer(shadowLayer, at: 0)
    }
}

extension TileView {
    
    func style() {
        //ImageView
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        //TitleLabel
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.preferredFont(forTextStyle: .title3).bold()
        titleLabel.textColor = .label
        //subTitleLabel
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subTitleLabel.font =  UIFont.preferredFont(forTextStyle: .footnote)
        subTitleLabel.numberOfLines = 0
        subTitleLabel.lineBreakMode = .byWordWrapping
        //OrderButton
        orderButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func layout() {
        
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(subTitleLabel)
        addSubview(orderButton)
        
        NSLayoutConstraint.activate([
            //ImageView
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            //TitleLabel
            titleLabel.topAnchor.constraint(equalToSystemSpacingBelow: imageView.bottomAnchor, multiplier: 2),
            titleLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            trailingAnchor.constraint(equalToSystemSpacingAfter: titleLabel.trailingAnchor, multiplier: 2),
            //subTitleLabel
            subTitleLabel.topAnchor.constraint(equalToSystemSpacingBelow: titleLabel.bottomAnchor, multiplier: 2),
            subTitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            subTitleLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            //OrderButton
            orderButton.topAnchor.constraint(equalToSystemSpacingBelow: subTitleLabel.bottomAnchor, multiplier: 2),
            orderButton.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            bottomAnchor.constraint(equalToSystemSpacingBelow: orderButton.bottomAnchor, multiplier: 2),
            
        ])
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 100, height: 300)
    }
    
}

