//
//  TabBarSetup.swift
//  dogTranslator
//
//  Created by Stas Dashkevich on 10.12.22.
//

import Foundation
import UIKit

extension TabBarController {
    
    func setup() {
        
        let voice = VoiceController()
        let whistle = WhistleController()
        let emotions = EmotionsController()
        
        let voiceIcon = UITabBarItem(title: "Voice", image: UIImage(named: "microphone")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "microphoneSelected")?.withRenderingMode(.alwaysOriginal))
        let whistleIcon = UITabBarItem(title: "Whistle", image: UIImage(named: "whistle")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "whistleSelected")?.withRenderingMode(.alwaysOriginal))
        let emotionsIcon = UITabBarItem(title: "Emotions", image: UIImage(named: "dog")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "dogSelected")?.withRenderingMode(.alwaysOriginal))
        
        voice.tabBarItem = voiceIcon
        whistle.tabBarItem = whistleIcon
        emotions.tabBarItem = emotionsIcon
        
        viewControllers = [voice, emotions, whistle]
        
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(named: "green")!], for: .selected)
        tabBar.unselectedItemTintColor = UIColor(named: "grey9f")
        tabBar.backgroundColor = .white
    }
}
