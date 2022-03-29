//
//  ViewController.swift
//  Starbucks
//
//  Created by Alperen Selçuk on 18.02.2022.
//  Copyright © 2022 Alperen Selçuk. All rights reserved.
//


import UIKit

class HomeViewController: StarBucksViewController {

    
    let topSpacerView = UIView()
    let headerView  = HomeHeaderView()
    var headerViewTopConstraint: NSLayoutConstraint?

    let scrollView  = UIScrollView()
    let stackView   = UIStackView()
    
    let scanButton = UIButton()
    
    struct ScanButtonSpacing {
        static let height: CGFloat = 60
        static let width: CGFloat = 170
    }
    
    let tiles = [
        RewardTileViewController(),
        
        TileViewController(title: "Breakfast made meatless",
                           subtitle: "Try the Beyond Meat, Cheddar & Egg Breakfast Sandwich. Vegetarian and protein-packed.",
                           imageName: "meatless"),
        TileViewController(title: "Uplifting our communities",
                           subtitle: "Thanks to our partners' nominations, The Starbucks Foundation is donating $145K to more than 50 local charities.",
                           imageName: "communities"),
        TileViewController(title: "Spend at least $15 for 50 Bonus Stars",
                           subtitle: "Collect 50 Bonus Stars when you spend at least $15 pre-tax.",
                           imageName: "bonus"),
    ]


    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setupScrollView()
        setupNavBar()
        setTabBarImage(imageName: "house.fill", title: "Home")
        
        style()
        layout()
    }
    
    private func setupNavBar() {
        navigationController?.navigationBar.topItem?.title = "Good afternoon, Alperen 💡"
    }
}

extension HomeViewController {
    
    private func style() {
        view.backgroundColor = .backgroundWhite
        topSpacerView.backgroundColor = .backgroundWhite
        
        topSpacerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.translatesAutoresizingMaskIntoConstraints    = false

        
        scrollView.translatesAutoresizingMaskIntoConstraints    = false
        stackView.translatesAutoresizingMaskIntoConstraints     = false
        
        stackView.axis      = .vertical
        stackView.spacing   = 8
        
        scanButton.translatesAutoresizingMaskIntoConstraints = false
        scanButton.setTitle("Scan in store", for: .normal)
        scanButton.titleLabel?.minimumScaleFactor = 0.5
        scanButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title3)
        scanButton.titleLabel?.adjustsFontSizeToFitWidth = true
        scanButton.backgroundColor = .lightGreen
        scanButton.setTitleColor(.white, for: .normal)
        scanButton.layer.cornerRadius = ScanButtonSpacing.height/2
    }
    
    private func layout() {
        view.addSubview(topSpacerView)
        view.addSubview(headerView)

        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        
        view.addSubview(scanButton)
        
        for tile in tiles {
            addChild(tile)
            stackView.addArrangedSubview(tile.view)
            tile.didMove(toParent: self)
        }
        
        
        headerViewTopConstraint = headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        NSLayoutConstraint.activate([
            
            topSpacerView.topAnchor.constraint(equalTo: view.topAnchor),
            topSpacerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topSpacerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topSpacerView.heightAnchor.constraint(equalToConstant: 100),
            
            headerViewTopConstraint!,
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            
            scrollView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 8),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            scanButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            scanButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            scanButton.widthAnchor.constraint(equalToConstant: ScanButtonSpacing.width),
            scanButton.heightAnchor.constraint(equalToConstant: ScanButtonSpacing.height),
        ])
        
    }
}

extension HomeViewController {
    private func setupScrollView() {
        scrollView.delegate = self
    }
}

extension HomeViewController: UIScrollViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y = scrollView.contentOffset.y

        let swipingDown = y <= 0
        let shouldSnap  = y > 30
        let labelHeight = headerView.greeting.frame.height + 16 //label + spacer 102

        UIView.animate(withDuration: 0.3) {
            self.headerView.greeting.alpha = swipingDown ? 1.0 : 0.0
        }

        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.3, delay: 0, options: [], animations: {
            self.headerViewTopConstraint?.constant = shouldSnap ? -labelHeight : 0
            self.view.layoutIfNeeded()
        })
    }

}

























//MARK: buralar eski tableview icin.. onu yazmasi kolay o yuzden ilk onun ile headerviewi test ettik


////MARK: Tavleview
//extension HomeViewController: UITableViewDataSource {
//
//
//    func setupTableView() {
//        tableview.dataSource    = self
//        tableview.delegate      = self
//
//        tableview.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
//        tableview.tableFooterView = UIView() //burasi biraz farkli..
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return titles.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
//
//        cell.textLabel?.text = titles[indexPath.row] //collectionviewda item diyorduk..
//        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
//
//        return cell
//    }
//}

//MARK: Animating ScrollView
extension HomeViewController: UITableViewDelegate {

//    garipmis bu
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 300
//    }

//    bunun diger turlerine de bak..
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        let y = scrollView.contentOffset.y
//        print(y)
//    }

//    headerviewin animasyon ile yok olmasi..
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        let y = scrollView.contentOffset.y
//
//        let swipingDown = y <= 0
//        let shouldSnap  = y > 30
//        let labelHeight = headerView.greeting.frame.height + 16 //label + spacer 102
//
//        UIView.animate(withDuration: 0.3) {
//            self.headerView.greeting.alpha = swipingDown ? 1.0 : 0.0
//        }
//
//        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.3, delay: 0, options: [], animations: {
//            self.headerViewTopConstraint?.constant = shouldSnap ? -labelHeight : 0
//            self.view.layoutIfNeeded()
//        })
//    }
}
