//
//  SecondSubViewControllerLogic.swift
//  dogTranslator
//
//  Created by Stas Dashkevich on 21.12.22.
//

import Foundation
import UIKit

extension SecondSubscribeViewController {
    
    func activeBottom(_ text: String, _ period: String) -> NSMutableAttributedString {
        let attString = NSMutableAttributedString()
        
        var header: NSAttributedString!
        var wayText: NSAttributedString!
        
        header = NSAttributedString(
            string: text + "\n",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "black3"),
                         NSAttributedString.Key.font: UIFont.rounded(ofSize: 13, weight: .medium)]
        )
        wayText = NSAttributedString(
            string: period,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "black3"),
                         NSAttributedString.Key.font: UIFont.rounded(ofSize: 16, weight: .semibold)]
        )
        
        attString.append(header)
        attString.append(wayText)
        
        return attString
    }
    
    func noActiveBottom(_ text: String, _ period: String) -> NSMutableAttributedString {
        let attString = NSMutableAttributedString()
        
        var header: NSAttributedString!
        var wayText: NSAttributedString!
        

        header = NSAttributedString(
            string: text + "\n",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "black3"),
                         NSAttributedString.Key.font: UIFont.rounded(ofSize: 12, weight: .medium)]
        )
        wayText = NSAttributedString(
            string: period,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "black3"),
                         NSAttributedString.Key.font: UIFont.rounded(ofSize: 14, weight: .semibold)]
        )
        
        
        attString.append(header)
        attString.append(wayText)
        
        
        
        return attString
    }
    
    @objc func sub() {
        print("sub is \(subs)")
        if subs != ""{
            switch subs {
            case "com.dogtranslator.1wetr": swifty.purchase(purchase: .weekTrial)
            case "com.dogtranslator.1motr": swifty.purchase(purchase: .mounthTrial)
            case "com.dogtranslator.1yetr": swifty.purchase(purchase: .yearTrial)
            case "com.dogtranslator.1we": swifty.purchase(purchase: .week)
            case "com.dogtranslator.1mo": swifty.purchase(purchase: .mounth)
            case "com.dogtranslator.1ye": swifty.purchase(purchase: .year)
            default:
                print("subError")
            }
            view.isUserInteractionEnabled = false
            let subV = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
            subV.backgroundColor = UIColor(named: "subView")
            self.view.addSubview(subV)
            self.view.bringSubviewToFront(spiner)
            spiner.startAnimating()
            let _ = Timer.scheduledTimer(withTimeInterval: 7, repeats: false) { Timer in
                self.spiner.stopAnimating()
                subV.removeFromSuperview()
                self.view.isUserInteractionEnabled = true
            }
        }
    }
    
    @objc func restoreTarget() {
        IAPManager.shared.restorePurchases()
    }
    
    @objc func fingerTapGrad() {
        continueButton.backgroundColor = UIColor(named: "Bounty")
    }
    
    @objc func defaultButtonGradState() {
        continueButton.backgroundColor = UIColor(named: "green78")
    }
    
    @objc func firstSub() {
        
        subs = first
        
        firstSelectedSubView.isHidden = false
        firstSelectedTopLabel!.isHidden = false
        firstSelectedBottomLabel!.isHidden = false
        
        secondSubView.isHidden = false
        
        secondSelectedSubView.isHidden = true
        secondSelectedTopLabel!.isHidden = true
        secondSelectedBottomLabel!.isHidden = true
        
        thirdSelectedSubView.isHidden = true
        thirdSelectedTopLabel!.isHidden = true
        thirdSelectedBottomLabel!.isHidden = true
        
        
        let constraint = [
            secondSubView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -UIScreen.main.bounds.height / 4.5363),
            secondSubView.leadingAnchor.constraint(equalTo: firstSelectedSubView.trailingAnchor, constant: 8),
            secondSubView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 6.1984),
            secondSubView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3.7128),
            
            secondTopLabel!.heightAnchor.constraint(equalTo: secondSubView.heightAnchor, multiplier: 0.5),
            secondTopLabel!.centerXAnchor.constraint(equalTo: secondSubView.centerXAnchor),
            secondTopLabel!.widthAnchor.constraint(equalTo: secondSubView.widthAnchor),
            
            secondSubPlace.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 12.3969),
            secondSubPlace.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3.7128),
            
            secondImage.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 12.3969),
            secondImage.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3.7128),
            
            secondBottomLabel!.heightAnchor.constraint(equalTo: secondSubView.heightAnchor, multiplier: 1.5),
            secondBottomLabel!.centerXAnchor.constraint(equalTo: secondSubView.centerXAnchor),
            secondBottomLabel!.widthAnchor.constraint(equalTo: secondSubView.widthAnchor),
        ]
        
        let constraintSmall = [
            secondSubView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -UIScreen.main.bounds.height / 6.5363),
            secondSubView.leadingAnchor.constraint(equalTo: firstSelectedSubView.trailingAnchor, constant: 8),
            secondSubView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 5.5),
            secondSubView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3.7128),
            
            secondTopLabel!.heightAnchor.constraint(equalTo: secondSubView.heightAnchor, multiplier: 0.5),
            secondTopLabel!.centerXAnchor.constraint(equalTo: secondSubView.centerXAnchor),
            secondTopLabel!.widthAnchor.constraint(equalTo: secondSubView.widthAnchor),
            
            secondSubPlace.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 11),
            secondSubPlace.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3.7128),
            
            secondImage.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 11),
            secondImage.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3.7128),
            
            secondBottomLabel!.heightAnchor.constraint(equalTo: secondSubView.heightAnchor, multiplier: 1.5),
            secondBottomLabel!.centerXAnchor.constraint(equalTo: secondSubView.centerXAnchor),
            secondBottomLabel!.widthAnchor.constraint(equalTo: secondSubView.widthAnchor),
        ]
        
        let constraintBig = [
            secondSubView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -UIScreen.main.bounds.height / 4.5363),
            secondSubView.trailingAnchor.constraint(equalTo: thirdSubView.leadingAnchor, constant: -50),
            secondSubView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 6.1984),
            secondSubView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3.7128),
            
            secondTopLabel!.heightAnchor.constraint(equalTo: secondSubView.heightAnchor, multiplier: 0.5),
            secondTopLabel!.centerXAnchor.constraint(equalTo: secondSubView.centerXAnchor),
            secondTopLabel!.widthAnchor.constraint(equalTo: secondSubView.widthAnchor),
            
            secondSubPlace.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 12.3969),
            secondSubPlace.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3.7128),
            
            secondImage.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 12.3969),
            secondImage.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3.7128),
            
            secondBottomLabel!.heightAnchor.constraint(equalTo: secondSubView.heightAnchor, multiplier: 1.5),
            secondBottomLabel!.centerXAnchor.constraint(equalTo: secondSubView.centerXAnchor),
            secondBottomLabel!.widthAnchor.constraint(equalTo: secondSubView.widthAnchor),
        ]
        
        let constraintMiddle = [
            secondSubView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -UIScreen.main.bounds.height / 4.5363),
            secondSubView.trailingAnchor.constraint(equalTo: thirdSubView.leadingAnchor, constant: -25),
            secondSubView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 6.1984),
            secondSubView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3.7128),
            
            secondTopLabel!.heightAnchor.constraint(equalTo: secondSubView.heightAnchor, multiplier: 0.5),
            secondTopLabel!.centerXAnchor.constraint(equalTo: secondSubView.centerXAnchor),
            secondTopLabel!.widthAnchor.constraint(equalTo: secondSubView.widthAnchor),
            
            secondSubPlace.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 12.3969),
            secondSubPlace.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3.7128),
            
            secondImage.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 12.3969),
            secondImage.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3.7128),
            
            secondBottomLabel!.heightAnchor.constraint(equalTo: secondSubView.heightAnchor, multiplier: 1.5),
            secondBottomLabel!.centerXAnchor.constraint(equalTo: secondSubView.centerXAnchor),
            secondBottomLabel!.widthAnchor.constraint(equalTo: secondSubView.widthAnchor),
        ]
        
        secondSubView.deactivateAllConstraints()
        
        if UIScreen.main.bounds.width > 830 {
            NSLayoutConstraint.activate(constraintBig)
        } else if UIScreen.main.bounds.width < 830 && UIScreen.main.bounds.width > 500 {
            NSLayoutConstraint.activate(constraintMiddle)
        } else if UIScreen.main.bounds.height < 668 {
            NSLayoutConstraint.activate(constraintSmall)
        } else {
            NSLayoutConstraint.activate(constraint)
        }
        
        
        
    }
    
    @objc func secondSub() {
        
        subs = second
        
        firstSelectedSubView.isHidden = true
        firstSelectedTopLabel!.isHidden = true
        firstSelectedBottomLabel!.isHidden = true
        
        secondSubView.isHidden = true
        
        secondSelectedSubView.isHidden = false
        secondSelectedTopLabel!.isHidden = false
        secondSelectedBottomLabel!.isHidden = false
        
        thirdSelectedSubView.isHidden = true
        thirdSelectedTopLabel!.isHidden = true
        thirdSelectedBottomLabel!.isHidden = true
        
    }
    
    @objc func thirdSub() {
        
        subs = third
        
        secondSubView.isHidden = false
        
        firstSelectedSubView.isHidden = true
        firstSelectedTopLabel!.isHidden = true
        firstSelectedBottomLabel!.isHidden = true
        
        secondSelectedSubView.isHidden = true
        secondSelectedTopLabel!.isHidden = true
        secondSelectedBottomLabel!.isHidden = true
        
        thirdSelectedSubView.isHidden = false
        thirdSelectedTopLabel!.isHidden = false
        thirdSelectedBottomLabel!.isHidden = false
        
        let constraint = [
            secondSubView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -UIScreen.main.bounds.height / 4.5363),
            secondSubView.trailingAnchor.constraint(equalTo: thirdSelectedSubView.leadingAnchor, constant: -8),
            secondSubView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 6.1984),
            secondSubView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3.7128),
            
            secondTopLabel!.heightAnchor.constraint(equalTo: secondSubView.heightAnchor, multiplier: 0.5),
            secondTopLabel!.centerXAnchor.constraint(equalTo: secondSubView.centerXAnchor),
            secondTopLabel!.widthAnchor.constraint(equalTo: secondSubView.widthAnchor),
            
            secondSubPlace.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 12.3969),
            secondSubPlace.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3.7128),
            
            secondImage.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 12.3969),
            secondImage.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3.7128),
            
            secondBottomLabel!.heightAnchor.constraint(equalTo: secondSubView.heightAnchor, multiplier: 1.5),
            secondBottomLabel!.centerXAnchor.constraint(equalTo: secondSubView.centerXAnchor),
            secondBottomLabel!.widthAnchor.constraint(equalTo: secondSubView.widthAnchor),
        ]
        
        let constraintSmall = [
            secondSubView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -UIScreen.main.bounds.height / 6.5363),
            secondSubView.trailingAnchor.constraint(equalTo: thirdSelectedSubView.leadingAnchor, constant: -8),
            secondSubView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 5.5),
            secondSubView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3.7128),
            
            secondTopLabel!.heightAnchor.constraint(equalTo: secondSubView.heightAnchor, multiplier: 0.5),
            secondTopLabel!.centerXAnchor.constraint(equalTo: secondSubView.centerXAnchor),
            secondTopLabel!.widthAnchor.constraint(equalTo: secondSubView.widthAnchor),
            
            secondSubPlace.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 11),
            secondSubPlace.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3.7128),
            
            secondImage.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 11),
            secondImage.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3.7128),
            
            secondBottomLabel!.heightAnchor.constraint(equalTo: secondSubView.heightAnchor, multiplier: 1.5),
            secondBottomLabel!.centerXAnchor.constraint(equalTo: secondSubView.centerXAnchor),
            secondBottomLabel!.widthAnchor.constraint(equalTo: secondSubView.widthAnchor),
        ]
        
        let constraintBig = [
            secondSubView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -UIScreen.main.bounds.height / 4.5363),
            secondSubView.leadingAnchor.constraint(equalTo: firstSubView.trailingAnchor, constant: 50),
            secondSubView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 6.1984),
            secondSubView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3.7128),
            
            secondTopLabel!.heightAnchor.constraint(equalTo: secondSubView.heightAnchor, multiplier: 0.5),
            secondTopLabel!.centerXAnchor.constraint(equalTo: secondSubView.centerXAnchor),
            secondTopLabel!.widthAnchor.constraint(equalTo: secondSubView.widthAnchor),
            
            secondSubPlace.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 12.3969),
            secondSubPlace.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3.7128),
            
            secondImage.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 12.3969),
            secondImage.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3.7128),
            
            secondBottomLabel!.heightAnchor.constraint(equalTo: secondSubView.heightAnchor, multiplier: 1.5),
            secondBottomLabel!.centerXAnchor.constraint(equalTo: secondSubView.centerXAnchor),
            secondBottomLabel!.widthAnchor.constraint(equalTo: secondSubView.widthAnchor),
        ]
        
        let constraintMiddle = [
            secondSubView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -UIScreen.main.bounds.height / 4.5363),
            secondSubView.leadingAnchor.constraint(equalTo: firstSubView.trailingAnchor, constant: 25),
            secondSubView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 6.1984),
            secondSubView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3.7128),
            
            secondTopLabel!.heightAnchor.constraint(equalTo: secondSubView.heightAnchor, multiplier: 0.5),
            secondTopLabel!.centerXAnchor.constraint(equalTo: secondSubView.centerXAnchor),
            secondTopLabel!.widthAnchor.constraint(equalTo: secondSubView.widthAnchor),
            
            secondSubPlace.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 12.3969),
            secondSubPlace.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3.7128),
            
            secondImage.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 12.3969),
            secondImage.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3.7128),
            
            secondBottomLabel!.heightAnchor.constraint(equalTo: secondSubView.heightAnchor, multiplier: 1.5),
            secondBottomLabel!.centerXAnchor.constraint(equalTo: secondSubView.centerXAnchor),
            secondBottomLabel!.widthAnchor.constraint(equalTo: secondSubView.widthAnchor),
        ]
        secondSubView.deactivateAllConstraints()
        
        if UIScreen.main.bounds.width > 830 {
            NSLayoutConstraint.activate(constraintBig)
        } else if UIScreen.main.bounds.width < 830 && UIScreen.main.bounds.width > 500 {
            NSLayoutConstraint.activate(constraintMiddle)
        } else if UIScreen.main.bounds.height < 668 {
            NSLayoutConstraint.activate(constraintSmall)
        } else {
            NSLayoutConstraint.activate(constraint)
        }
        
    }
    
    @objc func closeTarget() {
        dismiss(animated: true)
        NotificationCenter.default.post(name: Notification.Name("reload"), object: nil)
    }
    
    @objc func methodOfReceivedNotification(notification: Notification) {
        dismiss(animated: true)
        NotificationCenter.default.post(name: Notification.Name("reload"), object: nil)
    }
    
    @objc func restoreAlert(notification: Notification) {
        let alertController = UIAlertController(title: local.alertRestore,
                                                message: local.alertRestoreDiscription,
                                                preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: NSLocalizedString("alertOk", comment: ""), style: .destructive))
        alertController.overrideUserInterfaceStyle = UIUserInterfaceStyle.light
        self.present(alertController, animated: true)
    }
    
    func setupLogic() {
        
        dismissView.isHidden = true
        xmark.isHidden = true
        
        if buttonDelay == nil {
            buttonDelay = "0"
        }
        
        let _ = Timer.scheduledTimer(withTimeInterval: TimeInterval(buttonDelay!) ?? 0, repeats: false) { [self] Timer in
            self.dismissView.isHidden = false
            self.xmark.isHidden = false
        }
    }
    
}
