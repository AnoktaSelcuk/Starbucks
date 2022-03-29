//
//  RewardsTileViewController.swift
//  Starbucks
//
//  Created by Alperen Selçuk on 22.02.2022.
//  Copyright © 2022 Alperen Selçuk. All rights reserved.
//

import UIKit

class RewardTileViewController: UIViewController {
    
    let rewardsTileView = RewardTileView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rewardsTileView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(rewardsTileView)
        
        NSLayoutConstraint.activate([
            rewardsTileView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            rewardsTileView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            rewardsTileView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            rewardsTileView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ]) 
    }
}
