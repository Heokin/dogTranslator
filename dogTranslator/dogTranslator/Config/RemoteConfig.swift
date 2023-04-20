//
//  RemoteConfig.swift
//  dogTranslator
//
//  Created by Stas Dashkevich on 26.12.22.
//

import Foundation
import UIKit
import FirebaseRemoteConfig

class RemoteConfigFetch {
    
    static var shared = RemoteConfigFetch()
    let remoteConfig = RemoteConfig.remoteConfig()
    
    let defaults: [String: NSObject] = [
        "welcomeTourScreenNumber" : "1" as NSObject,
        
        "welcomeTourSubscription" : "{\"1\": \"com.dogtranslator.1wetr\",                                                           \"2\": \"com.dogtranslator.1motr\",                                                           \"3\": \"com.dogtranslator.1yetr\" }" as NSObject,
        
        "closeButtonDelay"        : "0" as NSObject,
        
        "rateUs"                  : "0" as NSObject,
        
        "availableFreeHumanTranslator"       : "5" as NSObject,
        
        "otherScreenNumber"       : "1" as NSObject,
        
        "otherSubscription"       : "{\"1\": \"com.dogtranslator.1we\",                                                             \"2\": \"com.dogtranslator.1mo\",                                                             \"3\": \"com.dogtranslator.1ye\" }" as NSObject,
        
        "adsShow": "" as NSObject,
        "hideScreen": "" as NSObject,
        
    ]
    
    public func fetchValuesOnBoard() {
        let setting = RemoteConfigSettings()
        setting.minimumFetchInterval = 0
        remoteConfig.setDefaults(defaults)
        remoteConfig.configSettings = setting
        remoteConfig.fetchAndActivate { (status, error) in
            
            if error != nil {
                
            } else {
                if status != .error{
                    UserDefaults.standard.set(self.remoteConfig["welcomeTourScreenNumber"].stringValue, forKey: "getter")
                    UserDefaults.standard.set(self.remoteConfig["welcomeTourSubscription"].stringValue, forKey: "wSub")
                    UserDefaults.standard.set(self.remoteConfig["closeButtonDelay"].stringValue, forKey: "closeButtonDelay")
                    UserDefaults.standard.set(self.remoteConfig["otherScreenNumber"].stringValue, forKey: "getter2")
                    UserDefaults.standard.set(self.remoteConfig["otherSubscription"].stringValue, forKey: "oSub")
                    UserDefaults.standard.set(self.remoteConfig["rateUs"].stringValue, forKey: "rateUs")
                    UserDefaults.standard.set(self.remoteConfig["availableFreeHumanTranslator"].stringValue, forKey: "availableFreeSave")
                    UserDefaults.standard.set(self.remoteConfig["adsShow"].stringValue, forKey: "ads")
                    UserDefaults.standard.set(self.remoteConfig["hideScreen"].stringValue, forKey: "hide")
                }
                if status == .error{
                    UserDefaults.standard.set("1", forKey: "getter")
                    
                    UserDefaults.standard.set("{   \"1\": \"com.dogtranslator.1wetr\",   \"2\": \"com.dogtranslator.1motr\",   \"3\": \"com.dogtranslator.1yetr\" }", forKey: "wSub")
                    
                    UserDefaults.standard.set("0", forKey: "closeButtonDelay")
                    
                    UserDefaults.standard.set("1", forKey: "getter2")
                    
                    UserDefaults.standard.set("{   \"1\": \"com.dogtranslator.1we\",   \"2\": \"com.dogtranslator.1mo\",   \"3\": \"com.dogtranslator.1ye\" }", forKey: "oSub")
                    
                    UserDefaults.standard.set("0", forKey: "rateUs")
                    
                    UserDefaults.standard.set("5", forKey: "availableFreeSave")
                    
                    UserDefaults.standard.set("0", forKey: "ads")
                    
                    UserDefaults.standard.set("1", forKey: "hide")
                }
            }
        }
    }
    
    public func fetchValues() {
        
        let setting = RemoteConfigSettings()
        setting.minimumFetchInterval = 0
        remoteConfig.setDefaults(defaults)
        remoteConfig.configSettings = setting
        remoteConfig.fetchAndActivate { (status, error) in
            
            if error != nil {
                
            } else {
                if status != .error{
                    UserDefaults.standard.set(self.remoteConfig["welcomeTourScreenNumber"].stringValue, forKey: "getter")
                    UserDefaults.standard.set(self.remoteConfig["welcomeTourSubscription"].stringValue, forKey: "wSub")
                    UserDefaults.standard.set(self.remoteConfig["closeButtonDelay"].stringValue, forKey: "closeButtonDelay")
                    UserDefaults.standard.set(self.remoteConfig["otherScreenNumber"].stringValue, forKey: "getter2")
                    UserDefaults.standard.set(self.remoteConfig["otherSubscription"].stringValue, forKey: "oSub")
                    UserDefaults.standard.set(self.remoteConfig["rateUs"].stringValue, forKey: "rateUs")
                    UserDefaults.standard.set(self.remoteConfig["availableFreeHumanTranslator"].stringValue, forKey: "availableFreeSave")
                    UserDefaults.standard.set(self.remoteConfig["adsShow"].stringValue, forKey: "ads")
                    UserDefaults.standard.set(self.remoteConfig["hideScreen"].stringValue, forKey: "hide")
                }
                if status == .error{
                    UserDefaults.standard.set("1", forKey: "getter")
                    
                    UserDefaults.standard.set("{   \"1\": \"com.dogtranslator.1wetr\",   \"2\": \"com.dogtranslator.1motr\",   \"3\": \"com.dogtranslator.1yetr\" }", forKey: "wSub")
                    
                    UserDefaults.standard.set("0", forKey: "closeButtonDelay")
                    
                    UserDefaults.standard.set("1", forKey: "getter2")
                    
                    UserDefaults.standard.set("{   \"1\": \"com.dogtranslator.1we\",   \"2\": \"com.dogtranslator.1mo\",   \"3\": \"com.dogtranslator.1ye\" }", forKey: "oSub")
                    
                    UserDefaults.standard.set("0", forKey: "rateUs")
                    
                    UserDefaults.standard.set("5", forKey: "availableFreeSave")
                    
                    UserDefaults.standard.set("0", forKey: "ads")
                    
                    UserDefaults.standard.set("1", forKey: "hide")
                }
            }
        }
    }
}
