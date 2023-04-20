//
//  SettingSetUpUi.swift
//  dogTranslator
//
//  Created by Stas Dashkevich on 15.12.22.
//

import Foundation
import UIKit
import SnapKit
import MessageUI

extension SettingController {
    
//    func shareApplication() {
//            var textToShare = NSLocalizedString("sharing", comment: "")
//            textToShare += "https://apps.apple.com/app/id1660965890"
//
//                let activityVC = UIActivityViewController(activityItems: [textToShare], applicationActivities: nil)
//                self.present(activityVC, animated: true, completion: nil)
//    }
    
     func shareApplication() {
        var textToShare = NSLocalizedString("sharing", comment: "")
        textToShare += "https://apps.apple.com/app/id1660965890"
            
                let activityVC = UIActivityViewController(activityItems: [textToShare], applicationActivities: nil)
                if let popoverController = activityVC.popoverPresentationController {
                        popoverController.sourceRect = CGRect(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2, width: 0, height: 0)
                        popoverController.sourceView = self.view
                        popoverController.permittedArrowDirections = UIPopoverArrowDirection(rawValue: 0)
                    }

                self.present(activityVC, animated: true, completion: nil)
        }
    
    func setUpUI() {
        view.addSubview(header)
        view.addSubview(doneButton)
        view.addSubview(tableView)
        view.addSubview(subView)
        view.addSubview(background)
        view.sendSubviewToBack(background)
        view.bringSubviewToFront(subView)
        subView.addSubview(subImage)
        subView.addSubview(settingImage)
        subView.addSubview(settingLabel)
        
        doneButton.addTarget(self, action: #selector(closeSetting), for: .touchUpInside)
        subView.addGestureRecognizer(openSub)
        subView.isUserInteractionEnabled = true
        
        view.backgroundColor = .white
        subView.layer.cornerRadius = 16
        subView.backgroundColor = .white.withAlphaComponent(1.0)
        tableView.isScrollEnabled = false
        tableView.backgroundColor = .clear
                
        header.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(28)
            make.centerX.equalToSuperview()
        }
        
        background.snp.makeConstraints { make in
            make.height.width.equalToSuperview()
        }
        
        doneButton.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-15)
            make.top.equalToSuperview().offset(26)
        }
        
        subView.snp.makeConstraints { make in
            make.top.equalTo(doneButton.snp.bottom).offset(38)
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(80)
        }
        
        subImage.snp.makeConstraints { make in
            make.left.right.top.bottom.equalTo(subView)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(subView.snp.bottom).offset(24)
            make.left.right.equalToSuperview().inset(16)
            make.bottom.equalTo(240)
        }
        
        settingImage.snp.makeConstraints { make in
            make.left.equalTo(subView.snp.left).offset(32)
            make.centerY.equalToSuperview()
            make.height.equalTo(40)
            make.width.equalTo(51)
        }
        
        settingLabel.snp.makeConstraints { make in
            make.left.equalTo(settingImage.snp.right).offset(16)
            make.centerY.equalToSuperview()
        }
        
        if Locale.current.languageCode == "ar" {
            settingImage.snp.remakeConstraints { make in
                make.right.equalTo(subView.snp.right).offset(-32)
                make.centerY.equalToSuperview()
                make.height.equalTo(40)
                make.width.equalTo(51)
            }
            
            settingLabel.snp.remakeConstraints { make in
                make.right.equalTo(settingImage.snp.left).offset(-16)
                make.centerY.equalToSuperview()
            }

        }
        
      
        
        if UserDefaults.standard.value(forKey: "FullAccess") as! Int == 0 {
            subView.isHidden = false
        } else {
            subView.isHidden = true
            subImage.isHidden = true
            tableView.snp.remakeConstraints { make in
                make.top.equalTo(header.snp.bottom).offset(38)
                make.left.right.equalToSuperview().inset(16)
                make.bottom.equalTo(240)
            }
        }

    }
    
    @objc func closeSetting() {
        dismiss(animated: true)
    }
    
    func rateApp() {
        if Int(rateUs)! == 1 {
            
            let alertController = UIAlertController(
                title: NSLocalizedString("alertRate", comment: ""),
                message: nil,
                preferredStyle: .alert
            )
            
            let cancelButton = UIAlertAction(
                title: NSLocalizedString("alertNo", comment: ""),
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
                    mail.setSubject("Dog Whistle — User Question ")
                    mail.setMessageBody("<p>\(systemVersion) \(devicename)<p>build Number -  \(appVersion!) (\(buildNumber))</p> </p>", isHTML: true)
                    
                    self.present(mail, animated: true)
                } else { }
            }
            
            let settingsAction = UIAlertAction(
                title: NSLocalizedString("alertYes", comment: ""),
                style: .default
            ) { _ in
                DispatchQueue.main.async {
                    let productURL = URL(string:
                                            "https://apps.apple.com/us/app/dog-whistle-dog-translator/id1660965890")
                    var components = URLComponents(url: productURL!, resolvingAgainstBaseURL: false)
                    components?.queryItems = [
                        URLQueryItem(name: "action", value: "write-review")
                    ]
                    guard let writeReviewURL = components?.url else {
                        return
                    }
                    UIApplication.shared.open(writeReviewURL)
                }
            }
            
            alertController.addAction(cancelButton)
            alertController.addAction(settingsAction)
            
            DispatchQueue.main.async(execute: {
                self.present(alertController, animated: true)
            })
            
        } else if Int(rateUs)! == 0 {
            DispatchQueue.main.async {
                let productURL = URL(string:  "https://apps.apple.com/us/app/dog-whistle-dog-translator/id1660965890")
                var components = URLComponents(url: productURL!, resolvingAgainstBaseURL: false)
                components?.queryItems = [
                    URLQueryItem(name: "action", value: "write-review")
                ]
                guard let writeReviewURL = components?.url else {
                    return
                }
                UIApplication.shared.open(writeReviewURL)
            }
        }
    }
    
    @objc func openSubscription() {
        print("sub is \(sub)")
        if sub == "2" {
            let vc = SecondSubscribeViewController()
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
        } else if sub == "1" {
            let vc = FirstSubscribeViewController()
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
        }
    }
}
