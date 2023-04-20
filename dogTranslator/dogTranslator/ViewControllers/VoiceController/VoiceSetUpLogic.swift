//
//  VoiceSetUpLogic.swift
//  dogTranslator
//
//  Created by Stas Dashkevich on 10.12.22.
//

import Foundation
import UIKit
import SnapKit
import AVFAudio

extension VoiceController {

    @objc func humanClick() {
        UserDefaults.standard.set(0, forKey: "selectedIndex")
        selectedIndex = UserDefaults.standard.value(forKey: "selectedIndex") as! Int
            recordButton.imageView?.image = UIImage(named: "green")
            holdTextLabel.text = NSLocalizedString("textHelperHuman", comment: "")

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
    
    @objc func dogClick() {
        UserDefaults.standard.set(1, forKey: "selectedIndex")
        selectedIndex = UserDefaults.standard.value(forKey: "selectedIndex") as! Int
            recordButton.imageView?.image = UIImage(named: "yellow")
            holdTextLabel.text = NSLocalizedString("textHelperCatSecond", comment: "")
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
    
    @objc func recordButtonClick() {

            switch AVAudioSession.sharedInstance().recordPermission {
            case .granted:
                if UserDefaults.standard.value(forKey: "FullAccess") as! Int == 0 {
                    if UserDefaults.standard.value(forKey: "counterLimit") as! Int >= Int(limit) ?? 5 {
                        openSub()

                        
                    } else {
                        recordButton.imageView?.image = UIImage(named: "red")
                        self.view.layoutIfNeeded()
                        animationView.play()
                        recorder.record(self)
                        recorder.startMonitoring()
                   
                    }

                } else {
                    recordButton.imageView?.image = UIImage(named: "red")
                    self.view.layoutIfNeeded()
                    animationView.play()
                    recorder.record(self)
                    recorder.startMonitoring()
                }
              
            case .denied:
                let vc = AlertPermission()
                vc.modalPresentationStyle = .overCurrentContext
                self.present(vc, animated: false)
            case .undetermined:
                print("Request permission here")
                AVAudioSession.sharedInstance().requestRecordPermission({ granted in
                    // Handle granted
                })
            @unknown default:
                print("Unknown case")
            }
    }
    
    @objc func recordButtonDisable() {
        recordButton.imageView?.image = UIImage(named: "yellow")
        recorder.stopMonitoring()
        
        animationView.stop()
        print(counterTimer)
        print("counter timer")
        if counterTimer > 0.5 {
            if decibels > 30 {
                if selectedIndex == 1 {
                    let vc = PopUpDogResultControllerIndex0()
                    vc.modalPresentationStyle = .fullScreen
                    vc.seconds = counterTimer
                    vc.selectedIndex = selectedIndex
                    present(vc, animated: false)
                } else {
                    let vc = PopUpDogResultControllerIndex1()
                    vc.modalPresentationStyle = .fullScreen
                    vc.seconds = counterTimer
                    vc.selectedIndex = selectedIndex
                    present(vc, animated: false)
                }
            } else {
                Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false) {[self] Timer in
                    if selectedIndex == 1 {
                        recordButton.imageView?.image = UIImage(named: "yellow")

                    } else {
                        recordButton.imageView?.image = UIImage(named: "green")

                    }
                }
                let vc = AlertRecognize()
                vc.modalPresentationStyle = .overCurrentContext
                self.present(vc, animated: false)
            }
          
        } else {
            Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false) {[self] Timer in
                if selectedIndex == 1 {
                    recordButton.imageView?.image = UIImage(named: "yellow")

                } else {
                    recordButton.imageView?.image = UIImage(named: "green")

                }
            }
            let vc = AlertRecognize()
            vc.modalPresentationStyle = .overCurrentContext
            self.present(vc, animated: false)
        }
        recorder.stopMonitoring()
        recorder.stop()
        
        counterTimer = 0.0
    }
    
    @objc func openSetting() {
        let vc = SettingController()
        present(vc, animated: true)
    }
    
    @objc func openSub() {
        if sub == "2" {
            let vc = SecondSubscribeViewController()
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
        } else if sub == "1" {
            let vc = FirstSubscribeViewController()
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
        }
    }

    func setUp() {
        recorder.delegate = self
        recorder.avDelegate = self
    }
}
