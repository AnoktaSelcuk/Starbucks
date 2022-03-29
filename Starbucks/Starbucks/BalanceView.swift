//
//  BalanceView.swift
//  Starbucks
//
//  Created by Alperen Selçuk on 22.02.2022.
//  Copyright © 2022 Alperen Selçuk. All rights reserved.
//

import UIKit

class BalanceView: UIView {
    
    let pointsLabel = UILabel()
    let starView    = makeSymbolImageView(systemName: "star.fill")
    let starBalanceLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension BalanceView {
    private func style() {
        pointsLabel.translatesAutoresizingMaskIntoConstraints       = false
        pointsLabel.font                                            = UIFont.preferredFont(forTextStyle: .largeTitle).bold()
        pointsLabel.text                                            = "12" //bunlar hardcode nomalde veri olarak cekmemiz gerekir..
            
        starView.translatesAutoresizingMaskIntoConstraints          = false
        starView.tintColor                                          = .starYellow
        starView.contentMode                                        = .scaleAspectFit //bunlari ogren iyice..
        
        starBalanceLabel.translatesAutoresizingMaskIntoConstraints  = false
        starBalanceLabel.font                                       = UIFont.preferredFont(forTextStyle: .footnote) //foonote nedir la
        starBalanceLabel.text                                       = "Star balance"
        
    }
    
    private func layout() {
        addSubview(pointsLabel)
        addSubview(starView)
        addSubview(starBalanceLabel)
        
        NSLayoutConstraint.activate([       //uiview oldugu icin mi view. demiyoruz??
            pointsLabel.topAnchor.constraint(equalTo: topAnchor),
            pointsLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            starView.leadingAnchor.constraint(equalTo: pointsLabel.trailingAnchor, constant: -2),
            starView.centerYAnchor.constraint(equalTo: pointsLabel.centerYAnchor, constant: 4),
            starView.heightAnchor.constraint(equalToConstant: 15),
                        
            starBalanceLabel.topAnchor.constraint(equalTo: pointsLabel.bottomAnchor, constant: 0),
            starBalanceLabel.leadingAnchor.constraint(equalTo: pointsLabel.leadingAnchor),
            starBalanceLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            starBalanceLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
