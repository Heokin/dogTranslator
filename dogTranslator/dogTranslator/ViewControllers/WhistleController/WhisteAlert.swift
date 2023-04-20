//
//  WhisteAlert.swift
//  dogTranslator
//
//  Created by Stas Dashkevich on 31.03.23.
//

import Foundation
////
////  RateUS.swift
////  dogTranslator
////
////  Created by Stas Dashkevich on 30.01.23.
////
//
//import Foundation
//import UIKit
//import MessageUI
//import StoreKit
//
//extension VoiceController {
//
//    func rateApp() {
//        print(rateUs)
//            if Int(rateUs) ?? 0 == 1 {
//                let test = Int(UserDefaults.standard.string(forKey: "rateApp")!)!
//                print("test is \(test)")
//                if test == 2 {
//                    UserDefaults.standard.set(3, forKey: "rateApp")
//
//                    let alertController = UIAlertController(
//                        title: "Do You Like This App?",
//                        message: nil,
//                        preferredStyle: .alert
//                    )
//
//                    let cancelButton = UIAlertAction(
//                        title: NSLocalizedString("No", comment: ""),
//                        style: .cancel
//                    ) { _ in
//                        if MFMailComposeViewController.canSendMail() {
//                            let mail = MFMailComposeViewController()
//                            mail.mailComposeDelegate = self
//                            let systemVersion = UIDevice.current.systemVersion
//                            let devicename = UIDevice.modelName
//                            let buildNumber: String = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as! String
//                            let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
//                            mail.setToRecipients(["support@mindateq.io"])
//                            mail.setSubject("Dog Whistle — User Question ")
//                            mail.setMessageBody("<p>\(systemVersion) \(devicename)<p>build Number -  \(appVersion!) (\(buildNumber))</p> </p>", isHTML: true)
//
//                            self.present(mail, animated: true)
//                        } else { }
//                    }
//
//                    let settingsAction = UIAlertAction(
//                        title: NSLocalizedString("Yes", comment: ""),
//                        style: .default
//                    ) { _ in
//                        SKStoreReviewController.requestReview()
//                    }
//
//                    alertController.addAction(cancelButton)
//                    alertController.addAction(settingsAction)
//
//                    DispatchQueue.main.async(execute: {
//                        self.present(alertController, animated: true)
//                    })
//                }
//            } else if Int(rateUs) ?? 0 == 0 {
//                let test = Int(UserDefaults.standard.string(forKey: "rateApp") ?? "0")
//                if test == 2 {
//                    UserDefaults.standard.set(3, forKey: "rateApp")
//                    SKStoreReviewController.requestReview()
//
//            }
//        }
//    }
//}
//
//extension VoiceController: MFMailComposeViewControllerDelegate {
//
//    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
//        controller.dismiss(animated: true)
//    }
//}

//
//  RateApp.swift
//  LieDetector
//
//  Created by Stas Dashkevich on 5.10.22.
//

import Foundation
import UIKit
import MessageUI
import StoreKit

extension WhistleController {
    
    func rateApp() {
        print(rateUs)
            if Int(rateUs) ?? 0 == 1 {
                let test = Int(UserDefaults.standard.string(forKey: "rateApp")!)!
                if test == 2 {
                    UserDefaults.standard.set(3, forKey: "rateApp")

                    let alertController = UIAlertController(
                        title: NSLocalizedString("alertRate", comment: ""),
                        message: nil,
                        preferredStyle: .alert
                    )
                    
                    let cancelButton = UIAlertAction(
                        title: NSLocalizedString("alertCancel", comment: ""),
                        style: .cancel
                    ) { _ in
                        if MFMailComposeViewController.canSendMail() {
                            let mail = MFMailComposeViewController()
                            mail.mailComposeDelegate = self
                            let systemVersion = UIDevice.current.systemVersion
                            let devicename = UIDevice.modelName
                            let buildNumber: String = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as! String
                            let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
                            mail.setToRecipients(["support@mindateq.io"])
                            mail.setSubject("Dog Games — User Question ")
                            mail.setMessageBody("<p>\(systemVersion) \(devicename)<p>build Number -  \(appVersion!) (\(buildNumber))</p> </p>", isHTML: true)
                            
                            self.present(mail, animated: true)
                        } else { }
                    }
                    
                    let settingsAction = UIAlertAction(
                        title: NSLocalizedString("alertYes", comment: ""),
                        style: .default
                    ) { _ in
                        SKStoreReviewController.requestReview()
                    }
                    
                    alertController.addAction(cancelButton)
                    alertController.addAction(settingsAction)
                    
//                    DispatchQueue.main.async(execute: {
//                        self.present(alertController, animated: true)
//                    })
                    
                    DispatchQueue.main.async {
                        self.present(alertController, animated: true)
                    }
                }
            } else if Int(rateUs) ?? 0 == 0 {
                let test = Int(UserDefaults.standard.string(forKey: "rateApp")!)!
                if test == 2 {
                    DispatchQueue.main.async {
                        UserDefaults.standard.set(3, forKey: "rateApp")
                        SKStoreReviewController.requestReview()
                }
            }
        }
    }
}

extension WhistleController: MFMailComposeViewControllerDelegate {
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
}

