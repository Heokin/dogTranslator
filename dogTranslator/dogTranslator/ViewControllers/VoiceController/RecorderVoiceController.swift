//
//  RecorderVoiceController.swift
//  dogTranslator
//
//  Created by Stas Dashkevich on 11.12.22.
//

import Foundation
import UIKit
import AVFoundation

extension VoiceController: AVAudioRecorderDelegate, RecorderDelegate {
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        // FIXME: Unusual
    }
    
    func recorderDidFailToAchievePermission(_ recorder: Recorder) {
        let alertController = UIAlertController(
            title: NSLocalizedString("Microphone", comment: ""),
            message: NSLocalizedString("SetMicro", comment: ""),
            preferredStyle: .alert
        )
        
        let cancelButton = UIAlertAction(
            title: NSLocalizedString("alertCancel", comment: ""),
            style: .cancel,
            handler: nil
        )
        
        let settingsAction = UIAlertAction(
            title: NSLocalizedString("titleSetting", comment: ""),
            style: .default
        ) { _ in
            UIApplication.shared.open(
                URL(string: UIApplication.openSettingsURLString)!,
                options: [:],
                completionHandler: nil)
        }
        
        alertController.addAction(cancelButton)
        alertController.addAction(settingsAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func recorder(_ recorder: Recorder, didCaptureDecibels decibels: Int) {
        counterTimer = recorder.seconds
        print(counterTimer)
        if decibels > self.decibels {
            self.decibels = decibels
            print("selfDecibel \(self.decibels) decibel \(decibels)")
        } else {
        }
    }
}
