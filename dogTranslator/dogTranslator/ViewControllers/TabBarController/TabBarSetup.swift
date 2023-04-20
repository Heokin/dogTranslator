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
        let game = NewGameController()
        let blog = BlogViewController()
        
        let voiceIcon = UITabBarItem(title: NSLocalizedString("simulatorIcon", comment: ""), image: UIImage(named: "microphone")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "microphoneSelected")?.withRenderingMode(.alwaysOriginal))
        let whistleIcon = UITabBarItem(title: NSLocalizedString("whistleButton", comment: ""), image: UIImage(named: "whistle")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "whistleSelected")?.withRenderingMode(.alwaysOriginal))
        let emotionsIcon = UITabBarItem(title: NSLocalizedString("titleEmotions", comment: ""), image: UIImage(named: "dog")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "dogSelected")?.withRenderingMode(.alwaysOriginal))
        let gameIcon = UITabBarItem(title: NSLocalizedString("voiceButton", comment: ""), image: UIImage(named: "game")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "gameSelected")?.withRenderingMode(.alwaysOriginal))
        
        let blogIcon = UITabBarItem(title: NSLocalizedString("blogIcon", comment: ""), image: UIImage(named: "blog")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "blogSelected")?.withRenderingMode(.alwaysOriginal))
        
        voice.tabBarItem = voiceIcon
        whistle.tabBarItem = whistleIcon
        emotions.tabBarItem = emotionsIcon
        game.tabBarItem = gameIcon
        blog.tabBarItem = blogIcon
        
        if UserDefaults.standard.value(forKey: "hide") as? String == "1" {
            viewControllers = [whistle, emotions, game, blog]
        } else {
            viewControllers = [whistle, emotions, voice, game, blog]
        }
        
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(named: "green")!], for: .selected)
        tabBar.unselectedItemTintColor = UIColor(named: "grey9f")
        tabBar.backgroundColor = .white
    }
}
