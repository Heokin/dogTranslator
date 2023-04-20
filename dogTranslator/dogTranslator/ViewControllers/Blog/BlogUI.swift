//
//  BlogUI.swift
//  dogTranslator
//
//  Created by Stas Dashkevich on 12.04.23.
//

import Foundation
import UIKit

extension BlogViewController {
    
    func setUpUI() {
        
        view.backgroundColor = .white
        roundedSettingView.backgroundColor = UIColor(named: "green78")
        roundedSubscribeView.backgroundColor = UIColor(named: "grey9f")

        view.addSubview(background)
        view.sendSubviewToBack(background)
        view.addSubview(navigationView)
        view.addSubview(vads)
        
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

        navigationView.addSubview(navigationHeader)
        navigationView.addSubview(roundedSettingView)
        navigationView.addSubview(roundedSubscribeView)
        
        roundedSettingView.addSubview(navigationSetting)
        roundedSubscribeView.addSubview(navigationSubscribe)
        
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
    
    @objc func openSetting() {
        let vc = SettingController()
        vc.modalPresentationStyle = .formSheet
        present(vc, animated: true)
    }
    
    @objc func openSub() {
        if sub == "2" {
            let vc = SecondSubscribeViewController()
            vc.modalPresentationStyle = .fullScreen
//            vc.transitioningDelegate = self
            present(vc, animated: true)
        } else if sub == "1" {
            let vc = FirstSubscribeViewController()
            vc.modalPresentationStyle = .fullScreen
//            vc.transitioningDelegate = self
            present(vc, animated: true)
        }
    }
}
