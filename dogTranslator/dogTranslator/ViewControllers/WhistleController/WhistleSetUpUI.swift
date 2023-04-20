//
//  WhistleSetUpUI.swift
//  dogTranslator
//
//  Created by Stas Dashkevich on 10.12.22.
//

import Foundation
import UIKit
import SnapKit

extension WhistleController {
    
    func setUpUI() {
        
        hzLabel.textColor = UIColor(named: "black3")
        view.backgroundColor = .white
        roundedSettingView.backgroundColor = UIColor(named: "green78")
        roundedSubscribeView.backgroundColor = UIColor(named: "grey9f")

        view.addSubview(background)
        view.addSubview(navigationView)
        view.addSubview(whistleButton)
        view.addSubview(hzLabel)
        view.addSubview(slider)
        view.addSubview(vads)
        
        if baner != nil {
            vads.addSubview(baner!)
            baner?.snp.makeConstraints({ make in
                make.center.bottom.equalToSuperview()
            })
        }
        
        NSLayoutConstraint.activate([
            
            vads.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            vads.centerXAnchor.constraint(equalTo: view.centerXAnchor),
         
        ])
        
        navigationView.addSubview(navigationHeader)
        navigationView.addSubview(roundedSettingView)
        navigationView.addSubview(roundedSubscribeView)
        
        roundedSettingView.addSubview(navigationSetting)
        roundedSubscribeView.addSubview(navigationSubscribe)
        
        //MARK: Add Target
        slider.addTarget(self, action: #selector(sliderAction), for: .valueChanged)
        whistleButton.addTarget(self, action: #selector(whistleButtonAction), for: .touchDown)
        whistleButton.addTarget(self, action: #selector(whistleButtonActionStop), for: .touchUpInside)
        navigationSetting.addTarget(self, action: #selector(openSub), for: .touchUpInside)
        navigationSubscribe.addTarget(self, action: #selector(openSetting), for: .touchUpInside)
        
        
        navigationView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(66)
            make.left.right.equalTo(view).inset(16)
            make.height.equalTo(52)
        }
        
        background.snp.makeConstraints { make in
            make.height.width.equalTo(view)
        }
        
        whistleButton.snp.makeConstraints { make in
            make.centerX.centerY.equalTo(view)
        }
        
        hzLabel.snp.makeConstraints { make in
            make.top.equalTo(whistleButton.snp.bottom).offset(56)
            make.centerX.equalTo(view)
        }
        
        slider.snp.makeConstraints { make in
            make.top.equalTo(hzLabel.snp.bottom)
            make.left.equalTo(view).offset(16)
            make.right.equalTo(view).offset(-16)
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
    }
}
