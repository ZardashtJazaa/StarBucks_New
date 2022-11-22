//
//  TopRatedViewController.swift
//  Starbucks
//
//  Created by Zardasht on 11/15/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    let headerView = HomeHeaderView()
    let scrollView = UIScrollView()
    let stackView = UIStackView()
    var headerViewTopConstraints: NSLayoutConstraint?
    let navBackgroundView = UIView()
    var coordinator: HomeCoordinator?
    let scanButton = UIButton()
    
    let cellID = "cellId"

    struct ScanButtonSpacing {
        static let width: CGFloat = 170
        static let height: CGFloat = 60
    }
    
    let tiles = [
        RewardTileViewController(),
        TileViewController(title: "Breakfast made meatless",
                           subTitle: "Try the Beyond Meat, Cheddar & Egg Breakfast Sandwich. Vegetarian and protein-packed.",
                           imageName: "meatless"),
        TileViewController(title: "Uplifting our communities",
                           subTitle: "Thanks to our partners' nominations, The Starbucks Foundation is donating $145K to more than 50 local charities.",
                           imageName: "communities"),
        TileViewController(title: "Spend at least $15 for 50 Bonus Stars",
                           subTitle: "Collect 50 Bonus Stars when you spend at least $15 pre-tax.",
                           imageName: "bonus"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headerView.delegate = self
        setUpScrollView()
        style()
        layout()
    }
}

//MARK: - HomeViewController
extension HomeViewController {
    
    private func style() {
        view.backgroundColor = .backgroundWhite
        //headerView
        navBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerViewTopConstraints = headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.axis = .vertical
        stackView.spacing = 8
        navBackgroundView.backgroundColor = .white
        
        //ScanButton
        scanButton.translatesAutoresizingMaskIntoConstraints = false
        scanButton.setTitle("Scan in store", for: .normal)
        scanButton.titleLabel?.minimumScaleFactor = 0.5
        scanButton.titleLabel?.font = .preferredFont(forTextStyle: .title3)
        scanButton.titleLabel?.adjustsFontSizeToFitWidth = true
        scanButton.backgroundColor = .lightGreen
        scanButton.setTitleColor(.white, for: .normal)
        scanButton.layer.cornerRadius = ScanButtonSpacing.height / 2
    }
    
    private func layout() {
        view.addSubview(navBackgroundView)
        view.addSubview(headerView)
        view.addSubview(scrollView)
        view.addSubview(scanButton)
        scrollView.addSubview(stackView)
        
        
        for tile in tiles {
            addChild(tile)
            stackView.addArrangedSubview(tile.view)
            tile.didMove(toParent: self)
        }
        
        NSLayoutConstraint.activate([
            //NavBackgroundView
            navBackgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            navBackgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navBackgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            navBackgroundView.heightAnchor.constraint(equalToConstant: 100),
            //HeaderView
            headerViewTopConstraints!,
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            //ScrollView
            scrollView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 8),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            //StackView
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            //ScanButton
            scanButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            scanButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -16),
            scanButton.widthAnchor.constraint(equalToConstant: ScanButtonSpacing.width),
            scanButton.heightAnchor.constraint(equalToConstant: ScanButtonSpacing.height),
            
        ])
    }
    
    private func setUpScrollView() {
        scrollView.delegate = self
    }
}

//MARK: - UIScrollViewDelegate
extension HomeViewController: UIScrollViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y = scrollView.contentOffset.y
        let swipingDown = y <= 0
        let shouldSnap =  y > 30
        let labelHeight = headerView.greeting.frame.height + 16
        
        UIView.animate(withDuration: 0.3) {
            self.headerView.greeting.alpha = swipingDown ? 1.0 : 0.0
        }
        
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.3, delay: 0) {
            self.headerViewTopConstraints?.constant = shouldSnap ? -labelHeight: 0
            self.view.layoutIfNeeded()
        }
    }
}

//MARK: - HomeHeaderViewDelegate
extension HomeViewController: homeHeaderViewProtocol {
    func didTapedHistoryButton(_ sender: HomeHeaderView) {
        let navController = UINavigationController(rootViewController: HistoryViewController())
        present(navController, animated: true)
    }
}


