//
//  AppDelegate.swift
//  dogTranslator
//
//  Created by Stas Dashkevich on 4.12.22.
//

import UIKit
import Firebase
import SwiftyStoreKit
import GoogleMobileAds

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var orientationLock = UIInterfaceOrientationMask.portrait
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        GADMobileAds.sharedInstance().start(completionHandler: nil)
//        GADMobileAds.sharedInstance().requestConfiguration.testDeviceIdentifiers = [ "1bd9954b9b2486d21efa7dd5309955f2"]

        FirebaseApp.configure()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.overrideUserInterfaceStyle = .light
        RemoteConfigFetch.shared.fetchValues()

        if IsFirstLaunch.shared.isFirstLaunch {
            window?.rootViewController = TabBarController()
        } else {
            window?.rootViewController = OnBoard()
        }
        
        window?.makeKeyAndVisible()
        
        window?.overrideUserInterfaceStyle = .light
        if #available(iOS 13.0, *) {
                UIWindow.appearance().overrideUserInterfaceStyle = .light
        }
        
        var rateAppCounter = 0
        if UserDefaults.standard.value(forKey: "rateApp") == nil {
            UserDefaults.standard.set(1, forKey: "rateApp")
        } else {
            rateAppCounter = UserDefaults.standard.value(forKey: "rateApp") as! Int
            rateAppCounter += 1
            UserDefaults.standard.set(rateAppCounter, forKey: "rateApp")
        }
        
        setupDogIcons()
        setupAds()
        udSetup()
        setupPaymnet()
        
        return true
    }
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
            return self.orientationLock
    }
}

