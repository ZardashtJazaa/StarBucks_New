//
//  RewardTileView.swift
//  Starbucks
//
//  Created by Zardasht on 11/16/22.
//

import UIKit

class RewardTileView: UIView {
    
    let balanceView = BalanceView()
    let rewardButton = UIButton()
    let rewardGraphView = RewardGraphView()
    let startRewardView = StarRewardView()
    var detailButton = UIButton()
    
    var heightConstraintsForAnimation: NSLayoutConstraint?
    
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


extension RewardTileView {
    
    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        rewardButton.translatesAutoresizingMaskIntoConstraints = false
        rewardGraphView.translatesAutoresizingMaskIntoConstraints = false
        startRewardView.translatesAutoresizingMaskIntoConstraints = false
        detailButton.translatesAutoresizingMaskIntoConstraints = false
        
        //RewardButton
        makeRewardOptionButton()
        //detailButton
        detailButton = makeClearButton(withText: "Details")
        
        
    }
    
    
    private func makeRewardOptionButton() {
        
        //Target
        rewardButton.addTarget(self, action: #selector(rewardOptionsTapped), for: .primaryActionTriggered)
        
        let configuration = UIImage.SymbolConfiguration(scale: .small)
        let image = UIImage(systemName: "chevron.down",withConfiguration: configuration)
        
        rewardButton.setImage(image, for: .normal)
        rewardButton.imageView?.tintColor = .label
        rewardButton.imageView?.contentMode = .scaleAspectFit
        
        rewardButton.setTitleColor(.label, for: .normal)
        rewardButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: .footnote).bold()
        rewardButton.setTitle("Rewards Options", for: .normal)
        
        rewardButton.semanticContentAttribute = .forceRightToLeft
        rewardButton.imageEdgeInsets = UIEdgeInsets(top: 2, left: 20, bottom: 0, right: 0)
        rewardButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 20)
    }
    
    
    func layout() {
        addSubview(balanceView)
        addSubview(rewardButton)
        addSubview(rewardGraphView)
        addSubview(startRewardView)
        addSubview(detailButton)
        
        //iniatially set to zero..
        heightConstraintsForAnimation = startRewardView.heightAnchor.constraint(equalToConstant: 0)
        
        NSLayoutConstraint.activate([
            //BalanceView
            balanceView.topAnchor.constraint(equalTo: topAnchor),
            balanceView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            //rewardButton
            rewardButton.centerYAnchor.constraint(equalTo: balanceView.pointLabel.centerYAnchor),
            trailingAnchor.constraint(equalToSystemSpacingAfter: rewardButton.trailingAnchor, multiplier: 3),
            //RewardGraphView
            rewardGraphView.topAnchor.constraint(equalToSystemSpacingBelow: balanceView.bottomAnchor, multiplier: 1),
            rewardGraphView.centerXAnchor.constraint(equalTo: centerXAnchor),
            rewardGraphView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            trailingAnchor.constraint(equalToSystemSpacingAfter: rewardGraphView.trailingAnchor, multiplier: 2),
//            rewardGraphView.widthAnchor.constraint(equalToConstant: frame.width),
            //StarRewardView
            startRewardView.topAnchor.constraint(equalTo: rewardGraphView.bottomAnchor, constant: 8),
            startRewardView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: startRewardView.trailingAnchor, multiplier: 1),
            //mean take that constraints and activate it...
            heightConstraintsForAnimation!,
            //DetailButton
            detailButton.topAnchor.constraint(equalToSystemSpacingBelow: startRewardView.bottomAnchor, multiplier: 2),
            detailButton.leadingAnchor.constraint(equalTo: balanceView.leadingAnchor),
            bottomAnchor.constraint(equalToSystemSpacingBelow: detailButton.bottomAnchor, multiplier: 2),
        
        ])
        startRewardView.isHidden = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        rewardGraphView.actualFrameWidth = frame.width
        print(UIScreen.main.bounds.size)
        rewardGraphView.drawRewardsGraph()
    }
    
}

//MARK: - Actions
extension RewardTileView {
    
    @objc func rewardOptionsTapped() {
        
        if heightConstraintsForAnimation?.constant ==  0 {
            
            self.setChevronUp()
            
            let heightAnimator = UIViewPropertyAnimator(duration: 0.75, curve: .easeInOut) {
                self.heightConstraintsForAnimation?.constant = 270
                self.layoutIfNeeded()
            }
            heightAnimator.startAnimation()
            
            let alphaAnimator = UIViewPropertyAnimator(duration: 0.25, curve: .easeInOut) {
                self.startRewardView.isHidden = false
                self.startRewardView.alpha = 1
            }
            alphaAnimator.startAnimation(afterDelay: 0.5)
            
        } else {
            self.setChevronDown()
            let animator = UIViewPropertyAnimator(duration: 0.75, curve: .easeInOut) {
                self.heightConstraintsForAnimation?.constant = 0
                self.startRewardView.alpha = 0
                self.startRewardView.isHidden = false
                self.layoutIfNeeded()
            }
            animator.startAnimation()
        }
    }
    
    private func setChevronUp() {
        let configuration = UIImage.SymbolConfiguration(scale: .small)
        let image = UIImage(systemName: "chevron.up",withConfiguration: configuration)
        rewardButton.setImage(image, for: .normal)
    }
    private func setChevronDown() {
        let configuration = UIImage.SymbolConfiguration(scale: .small)
        let image = UIImage(systemName: "chevron.down",withConfiguration: configuration)
        rewardButton.setImage(image, for: .normal)
    }
    
    
}
