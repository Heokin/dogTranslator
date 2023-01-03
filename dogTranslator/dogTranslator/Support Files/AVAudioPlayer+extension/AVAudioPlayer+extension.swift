//
//  Player.swift
//  LieDetector
//
//  Created by Stas Dashkevich on 14.09.22.
//

import Foundation
import UIKit
import AVFoundation

extension AVAudioPlayer {
    
    static func playStartSound(_ soundName: String) {
        var player: AVAudioPlayer?
        guard let path = Bundle.main.path(forResource: soundName, ofType: "mp3") else { return }
        let url = URL(fileURLWithPath: path)
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch _ {
       }
    }
}
