//
//  DelegateExtension.swift
//  dogTranslator
//
//  Created by Stas Dashkevich on 20.12.22.
//

import Foundation
import SwiftyStoreKit

extension AppDelegate {
    
    func setupAds() {
        if UserDefaults.standard.value(forKey: "ads") == nil {
            UserDefaults.standard.set("2", forKey: "ads")
        }
        if UserDefaults.standard.value(forKey: "availableFreeSave") == nil {
            UserDefaults.standard.set("5", forKey: "availableFreeSave")
        }
    }
    
    func setupDogIcons() {
        
        if UserDefaults.standard.value(forKey: "Thanks") == nil {
            UserDefaults.standard.set("0", forKey: "Thanks")
        }
        if UserDefaults.standard.value(forKey: "Love") == nil {
            UserDefaults.standard.set("0", forKey: "Love")
        }
        if UserDefaults.standard.value(forKey: "Angry") == nil {
            UserDefaults.standard.set("0", forKey: "Angry")
        }
        if UserDefaults.standard.value(forKey: "Amazed") == nil {
            UserDefaults.standard.set("0", forKey: "Amazed")
        }
        if UserDefaults.standard.value(forKey: "Cry") == nil {
            UserDefaults.standard.set("0", forKey: "Cry")
        }
        if UserDefaults.standard.value(forKey: "Laugh") == nil {
            UserDefaults.standard.set("0", forKey: "Laugh")
        }
        if UserDefaults.standard.value(forKey: "Attention") == nil {
            UserDefaults.standard.set("0", forKey: "Attention")
        }
        if UserDefaults.standard.value(forKey: "Sleepy") == nil {
            UserDefaults.standard.set("0", forKey: "Sleepy")
        }
        if UserDefaults.standard.value(forKey: "Hungry") == nil {
            UserDefaults.standard.set("0", forKey: "Hungry")
        }
        if UserDefaults.standard.value(forKey: "Sick") == nil {
            UserDefaults.standard.set("0", forKey: "Sick")
        }
        if UserDefaults.standard.value(forKey: "Lonely") == nil {
            UserDefaults.standard.set("0", forKey: "Lonely")
        }
        if UserDefaults.standard.value(forKey: "Sad") == nil {
            UserDefaults.standard.set("0", forKey: "Sad")
        }
        if UserDefaults.standard.value(forKey: "What?") == nil {
            UserDefaults.standard.set("0", forKey: "What?")
        }
        if UserDefaults.standard.value(forKey: "Yummy") == nil {
            UserDefaults.standard.set("0", forKey: "Yummy")
        }
        if UserDefaults.standard.value(forKey: "Let’s Play") == nil {
            UserDefaults.standard.set("0", forKey: "Let’s Play")
        }
        if UserDefaults.standard.value(forKey: "Bathe") == nil {
            UserDefaults.standard.set("0", forKey: "Bathe")
        }
    }
    
    func udSetup() {
        
        var rateAppCounter = 0
        if UserDefaults.standard.value(forKey: "rateApp") == nil {
            UserDefaults.standard.set(1, forKey: "rateApp")
        } else {
            rateAppCounter = UserDefaults.standard.value(forKey: "rateApp") as! Int
            rateAppCounter += 1
            UserDefaults.standard.set(rateAppCounter, forKey: "rateApp")
        }
        
        if UserDefaults.standard.value(forKey: "FullAccess") == nil {
            UserDefaults.standard.set(0, forKey: "FullAccess")
        }
        
        if UserDefaults.standard.value(forKey: "counterLimit") == nil {
            UserDefaults.standard.set(0, forKey: "counterLimit")
        }
    }
    
    func setupPaymnet() {
        SwiftyStoreKit.completeTransactions(atomically: true) { purchases in
            for purchase in purchases {
                switch purchase.transaction.transactionState {
                case .purchased, .restored:
                    if purchase.needsFinishTransaction {
                        // Deliver content from server, then:
                        SwiftyStoreKit.finishTransaction(purchase.transaction)
                    }
                    let access = 1
                    UserDefaults.standard.set(access, forKey: "FullAccess")
                case .failed, .purchasing, .deferred:
                    break // do nothing
                    
                @unknown default:
                    fatalError()
                }
            }
        }
        SwiftyStoreKit.retrieveProductsInfo(["com.dogtranslator.1mo"]) {  result in
            if let product = result.retrievedProducts.first {
                let priceString = product.localizedPrice!
                
            }
            else if result.invalidProductIDs.first != nil {
            }
            else {
            }
        }
        SwiftyStoreKit.retrieveProductsInfo(["com.dogtranslator.1ye"]) {  result in
            if let product = result.retrievedProducts.first {
                let priceString = product.localizedPrice!
                
            }
            else if result.invalidProductIDs.first != nil {
            }
            else {
            }
        }
        SwiftyStoreKit.retrieveProductsInfo(["com.dogtranslator.1we"]) {  result in
            if let product = result.retrievedProducts.first {
                let priceString = product.localizedPrice!
                
            }
            else if result.invalidProductIDs.first != nil {
            }
            else {
            }
        }
        SwiftyStoreKit.retrieveProductsInfo(["com.dogtranslator.1motr"]) {  result in
            if let product = result.retrievedProducts.first {
                let priceString = product.localizedPrice!
                
            }
            else if result.invalidProductIDs.first != nil {
            }
            else {
            }
        }
        SwiftyStoreKit.retrieveProductsInfo(["com.dogtranslator.1yetr"]) {  result in
            if let product = result.retrievedProducts.first {
                let priceString = product.localizedPrice!
                
            }
            else if result.invalidProductIDs.first != nil {
            }
            else {
            }
        }
        SwiftyStoreKit.retrieveProductsInfo(["com.dogtranslator.1wetr"]) {  result in
            if let product = result.retrievedProducts.first {
                let priceString = product.localizedPrice!
                
            }
            else if result.invalidProductIDs.first != nil {
            }
            else {
            }
        }
        
//        if UserDefaults.standard.value(forKey: "FullAccess") as! Int != 1 {
//            IAPManager.shared.verifyPurcahse(product: .yearTrial)
//        }
//
//            if UserDefaults.standard.value(forKey: "FullAccess") as! Int != 1 {
//                IAPManager.shared.verifyPurcahse(product: .weekTrial)
//            }
//            if UserDefaults.standard.value(forKey: "FullAccess") as! Int != 1 {
//                IAPManager.shared.verifyPurcahse(product: .mounthTrial)
//            }
//            if UserDefaults.standard.value(forKey: "FullAccess") as! Int != 1 {
//                IAPManager.shared.verifyPurcahse(product: .year)
//            }
//            if UserDefaults.standard.value(forKey: "FullAccess") as! Int != 1 {
//                IAPManager.shared.verifyPurcahse(product: .mounth)
//            }
//            if UserDefaults.standard.value(forKey: "FullAccess") as! Int != 1 {
//                IAPManager.shared.verifyPurcahse(product: .week)
//            }
//        IAPManager.shared.verifyReceipt()

    }
}
