//
//  IsFirstLaunch.swift
//  dogTranslator
//
//  Created by Stas Dashkevich on 21.12.22.
//

import Foundation

class IsFirstLaunch {
    
    static var shared = IsFirstLaunch()
    
    var isFirstLaunch: Bool {
        get {
            UserDefaults.standard.bool(forKey: #function)
        } set {
            UserDefaults.standard.setValue(newValue, forKey: #function)
        }
    }
}
