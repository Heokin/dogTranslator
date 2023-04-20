//
//  InAppPurchase.swift
//  dogTranslator
//
//  Created by Stas Dashkevich on 21.12.22.
//

import Foundation
import StoreKit
import SwiftyStoreKit

enum RegisterPurchase: String {
    
case weekTrial = "1wetr"
case week = "1we"
case mounth = "1mo"
case mounthTrial = "1motr"
case year = "1ye"
case yearTrial = "1yetr"
    
}

class NetworkActivityIndicatorManager : NSObject {
    let local = LocalizationVariables()

    private static var loadingCount = 0
    
    class func NetworkOperationStarted() {
        if loadingCount == 0 {
            
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
        }
        loadingCount += 1
    }
    class func networkOperationFinished(){
        if loadingCount > 0 {
            loadingCount -= 1
            
        }
        if loadingCount == 0 {
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
    }
}

    class IAPManager: UIViewController {
        let local = LocalizationVariables()

        func setupDogIcons() {
            
            if UserDefaults.standard.value(forKey: "Thanks") == nil {
                UserDefaults.standard.set("1", forKey: "Thanks")
            }
            if UserDefaults.standard.value(forKey: "Love") == nil {
                UserDefaults.standard.set("1", forKey: "Love")
            }
            if UserDefaults.standard.value(forKey: "Angry") == nil {
                UserDefaults.standard.set("1", forKey: "Angry")
            }
            if UserDefaults.standard.value(forKey: "Amazed") == nil {
                UserDefaults.standard.set("1", forKey: "Amazed")
            }
            if UserDefaults.standard.value(forKey: "Cry") == nil {
                UserDefaults.standard.set("1", forKey: "Cry")
            }
            if UserDefaults.standard.value(forKey: "Laugh") == nil {
                UserDefaults.standard.set("1", forKey: "Laugh")
            }
            if UserDefaults.standard.value(forKey: "Attention") == nil {
                UserDefaults.standard.set("1", forKey: "Attention")
            }
            if UserDefaults.standard.value(forKey: "Sleepy") == nil {
                UserDefaults.standard.set("1", forKey: "Sleepy")
            }
            if UserDefaults.standard.value(forKey: "Hungry") == nil {
                UserDefaults.standard.set("1", forKey: "Hungry")
            }
            if UserDefaults.standard.value(forKey: "Sick") == nil {
                UserDefaults.standard.set("1", forKey: "Sick")
            }
            if UserDefaults.standard.value(forKey: "Lonely") == nil {
                UserDefaults.standard.set("1", forKey: "Lonely")
            }
            if UserDefaults.standard.value(forKey: "Sad") == nil {
                UserDefaults.standard.set("1", forKey: "Sad")
            }
            if UserDefaults.standard.value(forKey: "What?") == nil {
                UserDefaults.standard.set("1", forKey: "What?")
            }
            if UserDefaults.standard.value(forKey: "Yummy") == nil {
                UserDefaults.standard.set("1", forKey: "Yummy")
            }
            if UserDefaults.standard.value(forKey: "Let’s play") == nil {
                UserDefaults.standard.set("1", forKey: "Let’s play")
            }
            if UserDefaults.standard.value(forKey: "Bathe") == nil {
                UserDefaults.standard.set("1", forKey: "Bathe")
            }
        }
        
        func setupDogIconsFalse() {
            
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
            if UserDefaults.standard.value(forKey: "LetsPlay") == nil {
                UserDefaults.standard.set("0", forKey: "LetsPlay")
            }
            if UserDefaults.standard.value(forKey: "Bathe") == nil {
                UserDefaults.standard.set("0", forKey: "Bathe")
            }
        }
    
        let bundleID = "com.dogtranslator"
        let sharedSecret = "147321d964f9426b96173eb4d217fefe"
        static let shared = IAPManager()
        
        var weekTrial = RegisterPurchase.weekTrial
        var week = RegisterPurchase.week
        var mounth = RegisterPurchase.mounth
        var mounthTrial = RegisterPurchase.mounthTrial
        var year = RegisterPurchase.year
        var yearTrial = RegisterPurchase.yearTrial
        
        func getInfo(purchase : RegisterPurchase) {
            NetworkActivityIndicatorManager.NetworkOperationStarted()
          
            SwiftyStoreKit.retrieveProductsInfo([bundleID + "." + purchase.rawValue], completion: {
                result in
                NetworkActivityIndicatorManager.networkOperationFinished()
        
            })
        }
        
        func purchase(purchase : RegisterPurchase) {
            NetworkActivityIndicatorManager.NetworkOperationStarted()
            SwiftyStoreKit.purchaseProduct(bundleID + "." + purchase.rawValue, quantity: 1, atomically: true) { result in
                NetworkActivityIndicatorManager.networkOperationFinished()
                
                switch result {
                case .success(let purchase):
                    if purchase.needsFinishTransaction {
                        SwiftyStoreKit.finishTransaction(purchase.transaction)
                        let access = 1
                        UserDefaults.standard.set(access, forKey: "FullAccess")
                        self.setupDogIcons()
                    }
                    let access = 1
                    UserDefaults.standard.set(access, forKey: "FullAccess")
                    self.setupDogIcons()
                    
                case .error(let error):
                    self.setupDogIconsFalse()
                    switch error.code {
                    case .unknown: print("Unknown error. Please contact support")
                    case .clientInvalid: print("Not allowed to make the payment")
                    case .paymentCancelled: break
                    case .paymentInvalid: print("The purchase identifier was invalid")
                    case .paymentNotAllowed: print("The device is not allowed to make the payment")
                    case .storeProductNotAvailable: print("The product is not available in the current storefront")
                    case .cloudServicePermissionDenied: print("Access to cloud service information is not allowed")
                    case .cloudServiceNetworkConnectionFailed: print("Could not connect to the network")
                    case .cloudServiceRevoked: print("User has revoked permission to use this cloud service")
                    default: print((error as NSError).localizedDescription)
                        
                    }
                }
            }

        }
        
        func restorePurchases() {
            NetworkActivityIndicatorManager.NetworkOperationStarted()
            
            
            SwiftyStoreKit.restorePurchases(atomically: true) { results in
                if results.restoreFailedPurchases.count > 0 {
                    NotificationCenter.default.post(name: Notification.Name("RestoreError"), object: nil)
                }
                else if results.restoredPurchases.count > 0 {
                    let accesss = true
                    UserDefaults.standard.set(accesss, forKey: "FullAccess")
                    NotificationCenter.default.post(name: Notification.Name("SubscribeOk"), object: nil)
                }
                else {
                    NotificationCenter.default.post(name: Notification.Name("RestoreError"), object: nil)
                }
            }
            
        }
        
        func restoreTarget() {
            let alertController = UIAlertController(title: local.alertRestore,
                                                    message: local.alertRestoreDiscription,
                                                    preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .destructive))
            alertController.overrideUserInterfaceStyle = UIUserInterfaceStyle.light
            self.present(alertController, animated: true)
        }
        
        func fetchUpdatedReciept(){
            SwiftyStoreKit.fetchReceipt(forceRefresh: true) { result in
                switch result {
                case .success(let receiptData):
                    let encryptedReceipt = receiptData.base64EncodedString(options: [])
                    print("Fetch receipt success:\n\(encryptedReceipt)")
                    
                case .error(let error):
                    print("Fetch receipt failed: \(error)")
                }
            }
        }
        
        func verifyReceipt() {
            NetworkActivityIndicatorManager.NetworkOperationStarted()
            
            let appleValidator = AppleReceiptValidator(service: .sandbox, sharedSecret: sharedSecret)
            SwiftyStoreKit.verifyReceipt(using: appleValidator, forceRefresh: false) { result in
                NetworkActivityIndicatorManager.networkOperationFinished()
                switch result {
                case .success(let receipt):
                    print("Verify receipt success: \(receipt)")
                    let access = true
                    //NotificationCenter.default.post(name: Notification.Name("SubscribeOkAuto"), object: nil)
                    UserDefaults.standard.set(access, forKey: "FullAccess")
                    
                case .error(let error):
                    print("Verify receipt failed: \(error)")
                    let accesss = false
                    UserDefaults.standard.set(accesss, forKey: "FullAccess")
                    
                    self.fetchUpdatedReciept()
                }
            }
        }
        
        func verifyPurcahse(product : RegisterPurchase) {
            NetworkActivityIndicatorManager.NetworkOperationStarted()
            
            let appleValidator = AppleReceiptValidator(service: .sandbox, sharedSecret: sharedSecret)
            SwiftyStoreKit.verifyReceipt(using: appleValidator) { result in
                NetworkActivityIndicatorManager.networkOperationFinished()
                switch result {
                case .success(let receipt):
                    let productId = self.bundleID + "." + product.rawValue
                   
                    let purchaseResult = SwiftyStoreKit.verifySubscription(
                        ofType: .autoRenewable, // or .nonRenewing (see below)
                        productId: productId,
                        inReceipt: receipt)
                    
                    switch purchaseResult {
                    case .purchased(let expiryDate, let items):
                        let access = 1
                        UserDefaults.standard.set(access, forKey: "FullAccess")
                        self.setupDogIcons()
                        print("\(productId) ok since \(expiryDate)\n\(items)\n")

                    case .expired(let expiryDate, let items):
                        let access = 0
                        UserDefaults.standard.set(access, forKey: "FullAccess")
                        self.setupDogIconsFalse()
                        print("\(productId) is expired since \(expiryDate)\n\(items)\n")
                    case .notPurchased:
                        self.setupDogIconsFalse()
                        print("The user has never purchased \(productId)")
                    }
                    
                case .error(let error):
                    print("Receipt verification failed: \(error)")
                    self.fetchUpdatedReciept()
                }
            }
    }
}
