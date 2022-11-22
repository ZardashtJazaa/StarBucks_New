//
//  HomeHeaderView.swift
//  Starbucks
//
//  Created by Zardasht on 11/15/22.
//

import UIKit

protocol homeHeaderViewProtocol:AnyObject {
    func didTapedHistoryButton(_ sender: HomeHeaderView)
}

class HomeHeaderView: UIView {
    
    let greeting = UILabel()
    let inboxButton = UIButton()
    let historyButton = UIButton()
    
    weak var delegate: homeHeaderViewProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeHeaderView {
    
    private func style()  {
        //Greeting
        backgroundColor = .white
        greeting.translatesAutoresizingMaskIntoConstraints = false
        greeting.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        greeting.numberOfLines = 0
        greeting.lineBreakMode = .byWordWrapping
        greeting.text = "Good afternoon, Zardasht ☀️"
        //InboxButton
        makeInboxButton()
        makeHistoryButton()
        historyButton.addTarget(self, action: #selector(historyButtonTapped(sender:)), for: .primaryActionTriggered)
    }
    
    private func layout()  {
        
        addSubview(greeting)
        addSubview(inboxButton)
        addSubview(historyButton)
        
        NSLayoutConstraint.activate([
            //Greeting
            greeting.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            greeting.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: greeting.trailingAnchor, multiplier: 1),
            //InboxButton
            inboxButton.topAnchor.constraint(equalToSystemSpacingBelow: greeting.bottomAnchor, multiplier: 2),
            inboxButton.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            bottomAnchor.constraint(equalToSystemSpacingBelow: inboxButton.bottomAnchor, multiplier: 2),
            inboxButton.widthAnchor.constraint(equalTo: widthAnchor,multiplier: 0.25),
            //HistoryButton
            historyButton.leadingAnchor.constraint(equalToSystemSpacingAfter: inboxButton.trailingAnchor, multiplier: 2),
            historyButton.centerYAnchor.constraint(equalTo: inboxButton.centerYAnchor),
            historyButton.widthAnchor.constraint(equalTo: widthAnchor,multiplier: 0.25),
        ])
    }
}

//MARK: - Factories
extension HomeHeaderView {
    
    private func makeInboxButton() {
        makeButton(button: inboxButton, systemName: "envelope", text: "Inbox")
    }
    private func makeHistoryButton() {
        makeButton(button: historyButton, systemName: "calendar", text: "History")
    }
    
    private func makeButton(button: UIButton, systemName: String ,text: String) {
        button.translatesAutoresizingMaskIntoConstraints = false
        let configuration =  UIImage.SymbolConfiguration(scale: .large)
        let image = UIImage(systemName: systemName,withConfiguration: configuration)
        
        button.setImage(image, for: .normal)
        button.imageView?.tintColor = .secondaryLabel
        button.imageView?.contentMode = .scaleAspectFit
        
        button.setTitle(text, for: .normal)
        button.setTitleColor(.secondaryLabel, for: .normal)
        
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 16)
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    @objc private func historyButtonTapped(sender:UIButton) {
        
        delegate?.didTapedHistoryButton(self)
    }
}
