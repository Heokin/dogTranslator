//
//  WhistleSetUpLogic.swift
//  dogTranslator
//
//  Created by Stas Dashkevich on 10.12.22.
//

import Foundation
import UIKit
import AVFAudio

extension WhistleController {
    
    @objc func whistleButtonAction() {
        do {
                    try  AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playAndRecord, options: [.defaultToSpeaker])
                } catch(let error) {
                    print(error.localizedDescription)
                }

        whistleButton.imageView?.image = UIImage(named: "whistleRed")
        myUnit.setFrequency(freq: Double(slider.value))
        myUnit.setToneVolume(vol: 1.0)
        myUnit.enableSpeaker()
        myUnit.setToneTime(t: 20000)
    }
    
    @objc func sliderAction() {
        hzLabel.text = "\(Int(slider.value)) Hz"
        updateValue()
    }
    
    func updateValue() {
        myUnit.setFrequency(freq: Double(slider.value))
    }
    
    @objc func whistleButtonActionStop() {
        myUnit.stop()
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
            present(vc, animated: true)
        } else if sub == "1" {
            let vc = FirstSubscribeViewController()
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
        }
    }
    }

