//
//  NewCardGame.swift
//  dogTranslator
//
//  Created by Stas Dashkevich on 11.04.23.
//

import Foundation
import UIKit
import SnapKit


extension NewGameController {
    
    func setUpUI() {
        
        view.backgroundColor = .white

        view.addSubview(imageView)
        view.addSubview(navigationView)
        
        navigationView.addSubview(navigationHeader)
        navigationView.addSubview(scoreView)
        
        scoreView.addSubview(scoreImage)
        scoreView.addSubview(scoreLabel)

        navigationView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(14)
            make.left.right.equalTo(view).inset(16)
            make.height.equalTo(52)
        }
        
        navigationHeader.snp.makeConstraints { make in
            make.center.equalTo(navigationView)
        }
        
        NSLayoutConstraint.activate([
            scoreView.rightAnchor.constraint(equalTo: view.rightAnchor),
            scoreView.centerYAnchor.constraint(equalTo: navigationView.centerYAnchor),
            scoreView.heightAnchor.constraint(equalToConstant: 100),
            scoreView.widthAnchor.constraint(equalToConstant: 100),
            
            scoreImage.centerYAnchor.constraint(equalTo: scoreView.centerYAnchor),
            scoreImage.trailingAnchor.constraint(equalTo: scoreView.trailingAnchor, constant: -16),
            
            scoreLabel.centerYAnchor.constraint(equalTo: scoreView.centerYAnchor),
            scoreLabel.trailingAnchor.constraint(equalTo: scoreImage.leadingAnchor, constant: -8),
        ])
        
    }
}
