//
//  VoiceSetUpUI.swift
//  dogTranslator
//
//  Created by Stas Dashkevich on 10.12.22.
//


import Foundation
import UIKit
import SnapKit

extension VoiceController {
    
    func setUpUI() {
        view.backgroundColor = .white
        roundedSettingView.backgroundColor = UIColor(named: "green78")
        roundedSubscribeView.backgroundColor = UIColor(named: "grey9f")
        view.addSubview(background)
        view.sendSubviewToBack(background)
        view.addSubview(navigationView)
        view.addSubview(holdTextLabel)
        view.addSubview(background)
        view.addSubview(vads)
        view.addSubview(viewForButton)
        view.addSubview(recordButton)
        
        if baner != nil {
            vads.addSubview(baner!)
            baner?.snp.makeConstraints({ make in
                make.center.bottom.equalToSuperview()
            })
        }
        
        NSLayoutConstraint.activate([
            
            vads.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            vads.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            vads.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
         
        ])
        
        background.frame = UIScreen.main.bounds
        
        view.addSubview(humanIcon)
        view.addSubview(changeIcon)
        view.addSubview(dogIcon)
        
        navigationView.addSubview(navigationHeader)
        navigationView.addSubview(roundedSettingView)
        navigationView.addSubview(roundedSubscribeView)
        
        recordButton.addSubview(animationView)
//        recordButton.bringSubviewToFront(animationView)
        
        roundedSettingView.addSubview(navigationSetting)
        roundedSubscribeView.addSubview(navigationSubscribe)
                
        recordButton.addTarget(self, action: #selector(recordButtonClick), for: .touchDown)
        recordButton.addTarget(self, action: #selector(recordButtonDisable), for: .touchUpInside)
        humanIcon.addTarget(self, action: #selector(humanClick), for: .touchUpInside)
        dogIcon.addTarget(self, action: #selector(dogClick), for: .touchUpInside)
        navigationSetting.addTarget(self, action: #selector(openSub), for: .touchUpInside)
        navigationSubscribe.addTarget(self, action: #selector(openSetting), for: .touchUpInside)
        
        viewForButton.snp.makeConstraints { make in
            make.centerY.equalTo(view)
            make.centerX.equalTo(view)
        }
        
        recordButton.snp.makeConstraints { make in
            make.centerY.equalTo(viewForButton)
            make.centerX.equalTo(viewForButton)
        }
        
        animationView.snp.makeConstraints { make in
            make.center.equalTo(recordButton)
            make.height.width.equalTo(100)
        }
        
        changeIcon.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(recordButton.snp.bottom).offset(80)
        }
        
        humanIcon.snp.makeConstraints { make in
            make.right.equalTo(changeIcon.snp.left).offset(-8)
            make.centerY.equalTo(changeIcon)
            make.width.height.equalTo(72)
        }
        
        dogIcon.snp.makeConstraints { make in
            make.left.equalTo(changeIcon.snp.right).offset(8)
            make.centerY.equalTo(changeIcon)
            make.width.height.width.equalTo(48)
        }
        
        holdTextLabel.snp.makeConstraints { make in
            make.bottom.equalTo(recordButton.snp.top).offset(-32)
            make.left.right.equalToSuperview().inset(40)
//            make.height.equalTo(22)
        }
        
        background.snp.makeConstraints { make in
            make.height.width.equalTo(view)
        }
        
        navigationHeader.snp.makeConstraints { make in
            make.centerX.centerY.equalTo(navigationView)
        }
        
        roundedSettingView.snp.makeConstraints { make in
            make.left.equalTo(navigationView)
            make.centerY.equalTo(navigationView)
        }
        
        roundedSubscribeView.snp.makeConstraints { make in
            make.right.equalTo(navigationView)
            make.centerY.equalTo(navigationView)
        }
        
        navigationSetting.snp.makeConstraints { make in
            make.centerX.centerY.equalTo(roundedSettingView)
        }
        
        navigationSubscribe.snp.makeConstraints { make in
            make.centerX.centerY.equalTo(roundedSubscribeView)
        }
        
        navigationView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(66)
            make.left.right.equalTo(view).inset(16)
            make.height.equalTo(52)
        }
    }
    
    @objc func lottieTapp() {

    }
}
