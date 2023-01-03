//
//  VoiceSetUpLogic.swift
//  dogTranslator
//
//  Created by Stas Dashkevich on 10.12.22.
//

import Foundation
import UIKit
import SnapKit

extension VoiceController {

    @objc func humanClick() {
        UIView.animate(withDuration: 0.7) { [self] in
            recordButton.imageView?.image = UIImage(named: "green")

            humanIcon.snp.remakeConstraints { make in
                make.height.width.equalTo(72)
                make.right.equalTo(changeIcon.snp.left).offset(-8)
                make.centerY.equalTo(changeIcon)
            }
            dogIcon.snp.remakeConstraints { make in
                make.height.width.equalTo(48)
                make.left.equalTo(changeIcon.snp.right).offset(8)
                make.centerY.equalTo(changeIcon)
            }
            
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func dogClick() {
        UIView.animate(withDuration: 0.7) { [self] in
            recordButton.imageView?.image = UIImage(named: "yellow")
            
            humanIcon.snp.remakeConstraints { make in
                make.height.width.equalTo(48)
                make.right.equalTo(changeIcon.snp.left).offset(-8)
                make.centerY.equalTo(changeIcon)
            }
            
            dogIcon.snp.remakeConstraints { make in
                make.height.width.equalTo(72)
                make.left.equalTo(changeIcon.snp.right).offset(8)
                make.centerY.equalTo(changeIcon)
            }
            
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func recordButtonClick() {
        if UserDefaults.standard.value(forKey: "counterLimit") as! Int >= Int(limit) ?? 5 {
            
            let vc = FirstSubscribeViewController()
            vc.modalPresentationStyle = .custom
            vc.transitioningDelegate = self
            present(vc, animated: true)
            
        } else {
            
            recordButton.imageView?.image = UIImage(named: "red")
            self.view.layoutIfNeeded()
            animationView.play()
            recorder.record(self)
            recorder.startMonitoring()
        }
    }
    
    @objc func recordButtonDisable() {
        recordButton.imageView?.image = UIImage(named: "green")
        self.view.layoutIfNeeded()
        recorder.stopMonitoring()
        
        animationView.stop()
        if counterTimer > 1 {
            if decibels > 55 {
                let vc = PopUpDogResultController()
                vc.modalPresentationStyle = .fullScreen
                vc.seconds = counterTimer
                present(vc, animated: false)
            } else {
                let vc = AlertRecognize()
                vc.modalPresentationStyle = .overCurrentContext
                self.present(vc, animated: false)
            }
          
        } else {
            let vc = AlertRecognize()
            vc.modalPresentationStyle = .overCurrentContext
            self.present(vc, animated: false)
        }
        
        recorder.stop()
        recorder.stopMonitoring()
    }
    
    @objc func openSetting() {
        let vc = SettingController()
        vc.modalPresentationStyle = .formSheet
        present(vc, animated: true)
    }
    
    @objc func openSub() {
        let vc = FirstSubscribeViewController()
        vc.modalPresentationStyle = .custom
        vc.transitioningDelegate = self
        present(vc, animated: true)
    }

    func setUp() {
        recorder.delegate = self
        recorder.avDelegate = self
    }
}
