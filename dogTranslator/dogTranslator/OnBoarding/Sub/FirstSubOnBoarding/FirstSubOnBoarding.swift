//
//  FirstSubOnBoarding.swift
//  dogTranslator
//
//  Created by Stas Dashkevich on 21.12.22.
//

import Foundation
import UIKit
import SwiftyStoreKit

class FirstSubOnBoarding: UICollectionViewCell {
    
    public static var id = "firstSub"
    let swifty = IAPManager()
    
    var buttonDelay = UserDefaults.standard.value(forKey: "closeButtonDelay")
    var first = "com.dogtranslator.1wetr"
    var second = "com.dogtranslator.1motr"
    var third = "com.dogtranslator.1yetr"
    
    var wPrice = "$1.99"
    var mPrice = "$4.99"
    var yPrice = "$9.99"

    var standartHeight = UIScreen.main.bounds.height / 6.1984
    var selecredHeight = UIScreen.main.bounds.height / 5.075
    
    let local = LocalizationVariables()
    
    lazy var bgImage = ImageView(style: .subMainBGImage)
    lazy var imageHeader = ImageView(style: .subImageHeader)
    
    lazy var unslockAllAccess = Label(style: .subGreen, NSLocalizedString("subscribeHeader", comment: ""))
    lazy var firstSubLabel = Label(style: .subReason, NSLocalizedString("subscribeTitleLim", comment: ""))
    lazy var secondSubLabel = Label(style: .subReason, NSLocalizedString("subscribeTitleAds", comment: ""))
    
    lazy var firstSubView = ViewSub(type: .subscribeSubView)
    var firstTopLabel: LabelSub?
    var firstBottomLabel: LabelSub?
    lazy var firstSubPlace = ViewSub(type: .subscribeSubViewPlace)
    lazy var firstImage = ImageView(style: .subscribeSubView)
    
    lazy var secondSubView = ViewSub(type: .subscribeSubView)
    var secondTopLabel: LabelSub?
    var secondBottomLabel: LabelSub?
    lazy var secondSubPlace = ViewSub(type: .subscribeSubViewPlace)
    lazy var secondImage = ImageView(style: .subscribeSubView)

    
    lazy var thirdSubView = ViewSub(type: .subscribeSubView)
    var thirdTopLabel: LabelSub?
    var thirdBottomLabel: LabelSub?
    lazy var thirdSubPlace = ViewSub(type: .subscribeSubViewPlace)
    lazy var thirdImage = ImageView(style: .subscribeSubView)

    
    lazy var firstSelectedSubView = ViewSub(type: .subscribeSubView)
    var firstSelectedTopLabel: LabelSub?
    var firstSelectedBottomLabel: LabelSub?
    lazy var firstSelectedSubPlace = ViewSub(type: .subscribeSubViewPlace)
    lazy var firstImageSel = ImageView(style: .subscribeSubView)

    
    lazy var secondSelectedSubView = ViewSub(type: .subscribeSubView)
    var secondSelectedTopLabel: LabelSub?
    var secondSelectedBottomLabel: LabelSub?
    lazy var secondSelectedSubPlace = ViewSub(type: .subscribeSubViewPlace)
    lazy var secondImageSel = ImageView(style: .subscribeSubView)

    
    lazy var thirdSelectedSubView = ViewSub(type: .subscribeSubView)
    var thirdSelectedTopLabel: LabelSub?
    var thirdSelectedBottomLabel: LabelSub?
    lazy var thirdSelectedSubPlace = ViewSub(type: .subscribeSubViewPlace)
    lazy var thirdImageSel = ImageView(style: .subscribeSubView)

    
    lazy var restoreView = ViewSub(type: .dismissView)
    lazy var restoreLabel = LabelSub(type: .restore, NSLocalizedString("restoreButton", comment: ""), "")
    lazy var dismissView = ViewSub(type: .dismissView)
    lazy var xmark = ImageViewSub(image: .xmark)
    
    lazy var restoreTap = UITapGestureRecognizer(target: self, action: #selector(restoreTarget))
    lazy var dismissTap = UITapGestureRecognizer(target: self, action: #selector(closeTarget))
    lazy var recognizeFirst = UITapGestureRecognizer(target: self, action: #selector(firstSub))
    lazy var recognizeSecond = UITapGestureRecognizer(target: self, action: #selector(secondSub))
    lazy var recognizeThird = UITapGestureRecognizer(target: self, action: #selector(thirdSub))
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        NotificationCenter.default.addObserver(self, selector: #selector(methodOfReceivedNotification(notification:)), name: Notification.Name("SubscribeOk"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(restoreAlert(notification:)), name: Notification.Name("RestoreError"), object: nil)
        
        let js = UserDefaults.standard.value(forKey: "wSub") as? String
        print("second")

        if js != nil {
            do{
                if let json = js!.data(using: String.Encoding.utf8){
                    if let jsonData = try JSONSerialization.jsonObject(with: json, options: .allowFragments) as? [String:AnyObject]{
                        self.first = jsonData["1"] as! String
                        self.second = jsonData["2"] as! String
                        self.third = jsonData["3"] as! String
                    }
                }
            }catch {
                print(error.localizedDescription)
                
            }
        }
        
        let q = DispatchQueue.global(qos: .default)
        q.async {
            [self] in
            SwiftyStoreKit.retrieveProductsInfo([first]) { [self] result in
                if let product = result.retrievedProducts.first {
                    wPrice = product.localizedPrice!
                    if first == "com.dogtranslator.1yetr" {
                        self.firstTopLabel?.attributedText  = noActiveBottom(wPrice, local.subscribeYearly)
                        self.firstSelectedTopLabel?.attributedText = activeBottom(wPrice, local.subscribeYearly)
                    } else if first == "com.dogtranslator.1motr" {
                        self.firstTopLabel?.attributedText = noActiveBottom(wPrice, local.subscribeMonthly)
                        self.firstSelectedTopLabel?.attributedText = activeBottom(wPrice, local.subscribeMonthly)
                    } else if first == "com.dogtranslator.1wetr" {
                        self.firstTopLabel?.attributedText = noActiveBottom(wPrice, local.subscribeWeekly)
                        self.firstSelectedTopLabel?.attributedText = activeBottom(wPrice, local.subscribeWeekly)
                    } else {
                        self.firstTopLabel?.text = wPrice
                        self.firstSelectedTopLabel?.text = wPrice
                    }
                }
            }
            
            SwiftyStoreKit.retrieveProductsInfo([second]) { [self] result in
                if let product = result.retrievedProducts.first {
                    mPrice = product.localizedPrice!
                    if second == "com.dogtranslator.1yetr" {
                        UserDefaults.standard.set("com.dogtranslator.1yetr", forKey: "sub")
                        self.secondTopLabel?.attributedText = noActiveBottom(mPrice, local.subscribeYearly)
                        self.secondSelectedTopLabel?.attributedText = activeBottom(mPrice, local.subscribeYearly)
                    } else if second == "com.dogtranslator.1motr" {
                        UserDefaults.standard.set("com.dogtranslator.1motr", forKey: "sub")
                        self.secondTopLabel?.attributedText = noActiveBottom(mPrice, local.subscribeMonthly)
                        self.secondSelectedTopLabel?.attributedText = activeBottom(mPrice, local.subscribeMonthly)
                    } else if second == "com.dogtranslator.1wetr" {
                        UserDefaults.standard.set("com.dogtranslator.1wetr", forKey: "sub")
                        self.secondTopLabel?.attributedText = noActiveBottom(mPrice, local.subscribeWeekly)
                        self.secondSelectedTopLabel?.attributedText = activeBottom(mPrice, local.subscribeWeekly)
                    } else if second == "com.dogtranslator.1we" {
                        UserDefaults.standard.set("com.dogtranslator.1we", forKey: "sub")
                        self.secondTopLabel?.text = mPrice
                        self.secondSelectedTopLabel?.text = mPrice
                    } else if second == "com.dogtranslator.1mo" {
                        UserDefaults.standard.set("com.dogtranslator.1mo", forKey: "sub")
                        self.secondTopLabel?.text = mPrice
                        self.secondSelectedTopLabel?.text = mPrice
                    } else if second == "com.dogtranslator.1ye" {
                        UserDefaults.standard.set("com.dogtranslator.1ye", forKey: "sub")
                        self.secondTopLabel?.text = mPrice
                        self.secondSelectedTopLabel?.text = mPrice
                    }
                }
            }
            
            SwiftyStoreKit.retrieveProductsInfo([third]) { [self] result in
                if let product = result.retrievedProducts.first {
                    yPrice = product.localizedPrice!
                    if third == "com.dogtranslator.1yetr" {
                        self.thirdTopLabel?.attributedText = noActiveBottom(yPrice, local.subscribeYearly)
                        self.thirdSelectedTopLabel?.attributedText = activeBottom(yPrice, local.subscribeYearly)
                    } else if third == "com.dogtranslator.1motr" {
                        self.thirdTopLabel?.attributedText = noActiveBottom(yPrice, local.subscribeMonthly)
                        self.thirdSelectedTopLabel?.attributedText = activeBottom(yPrice, local.subscribeMonthly)
                    } else if third == "com.dogtranslator.1wetr" {
                        self.thirdTopLabel?.attributedText = noActiveBottom(yPrice, local.subscribeWeekly)
                        self.thirdSelectedTopLabel?.attributedText = activeBottom(yPrice, local.subscribeWeekly)
                    } else {
                        self.thirdTopLabel?.text = yPrice
                        self.thirdSelectedTopLabel?.text = yPrice
                    }
                }
            }
        }
        
        if self.first == "com.dogtranslator.1wetr"{
            self.firstTopLabel = LabelSub(type: .subscribeTopPrice, wPrice + "\n", local.subscribeWeekly)
            self.firstSelectedTopLabel = LabelSub(type: .subscribeTopPriceActive, wPrice + "\n", local.subscribeWeekly)
            self.firstBottomLabel = LabelSub(type: .subscribeBottom, local.subscribeFreeTrial, local.subscribeWeekly)
            self.firstSelectedBottomLabel = LabelSub(type: .subscribeBottomActive, local.subscribeFreeTrial, local.subscribeWeekly)
        } else if self.first == "com.dogtranslator.1yetr"{
            self.firstTopLabel = LabelSub(type: .subscribeTopPrice, yPrice + "\n", local.subscribeYearly)
            self.firstSelectedTopLabel = LabelSub(type: .subscribeTopPriceActive, yPrice + "\n", local.subscribeYearly)
            self.firstBottomLabel = LabelSub(type: .subscribeBottom, local.subscribeFreeTrial, local.subscribeYearly)
            self.firstSelectedBottomLabel = LabelSub(type: .subscribeBottomActive, local.subscribeFreeTrial, local.subscribeYearly)
        } else if self.first == "com.dogtranslator.1motr" {
            self.firstTopLabel = LabelSub(type: .subscribeTopPrice, mPrice + "\n",  local.subscribeMonthly)
            self.firstSelectedTopLabel = LabelSub(type: .subscribeTopPriceActive, mPrice + "\n",  local.subscribeMonthly)
            self.firstBottomLabel = LabelSub(type: .subscribeBottom, local.subscribeFreeTrial,  local.subscribeMonthly)
            self.firstSelectedBottomLabel = LabelSub(type: .subscribeBottomActive, local.subscribeFreeTrial,  local.subscribeMonthly)
        } else if self.first == "com.dogtranslator.1we"{
            self.firstTopLabel = LabelSub(type: .priceTop, wPrice, local.subscribeWeekly)
            self.firstSelectedTopLabel = LabelSub(type: .priceTopActive, wPrice, local.subscribeWeekly)
            self.firstBottomLabel = LabelSub(type: .dayBot, local.subscribeWeekly, local.subscribeWeekly)
            self.firstSelectedBottomLabel = LabelSub(type: .dayBotActive, local.subscribeWeekly, local.subscribeWeekly)
        } else if self.first == "com.dogtranslator.1ye"{
            self.firstTopLabel = LabelSub(type: .priceTop, yPrice, local.subscribeYearly)
            self.firstSelectedTopLabel = LabelSub(type: .priceTopActive, yPrice, local.subscribeYearly)
            self.firstBottomLabel = LabelSub(type: .dayBot, local.subscribeYearly, local.subscribeYearly)
            self.firstSelectedBottomLabel = LabelSub(type: .dayBotActive, local.subscribeYearly, local.subscribeYearly)
        } else if self.first == "com.dogtranslator.1mo" {
            self.firstTopLabel = LabelSub(type: .priceTop, mPrice,  local.subscribeMonthly)
            self.firstSelectedTopLabel = LabelSub(type: .priceTopActive, mPrice,  local.subscribeMonthly)
            self.firstBottomLabel = LabelSub(type: .dayBot, local.subscribeMonthly,  local.subscribeMonthly)
            self.firstSelectedBottomLabel = LabelSub(type: .dayBotActive, local.subscribeMonthly,  local.subscribeMonthly)
        }
        
        if self.second == "com.dogtranslator.1wetr"{
            self.secondTopLabel = LabelSub(type: .subscribeTopPrice, wPrice + "\n", local.subscribeWeekly)
            self.secondSelectedTopLabel = LabelSub(type: .subscribeTopPriceActive, wPrice + "\n", local.subscribeWeekly)
            self.secondBottomLabel = LabelSub(type: .subscribeBottom, local.subscribeFreeTrial, local.subscribeWeekly)
            self.secondSelectedBottomLabel = LabelSub(type: .subscribeBottomActive, local.subscribeFreeTrial, local.subscribeWeekly)
        } else if self.second == "com.dogtranslator.1yetr"{
            self.secondTopLabel = LabelSub(type: .subscribeTopPrice, yPrice + "\n", local.subscribeYearly)
            self.secondSelectedTopLabel = LabelSub(type: .subscribeTopPriceActive, yPrice + "\n", local.subscribeYearly)
            self.secondBottomLabel = LabelSub(type: .subscribeBottom, local.subscribeFreeTrial, local.subscribeYearly)
            self.secondSelectedBottomLabel = LabelSub(type: .subscribeBottomActive, local.subscribeFreeTrial, local.subscribeYearly)
        } else if self.second == "com.dogtranslator.1motr" {
            self.secondTopLabel = LabelSub(type: .subscribeTopPrice, mPrice + "\n",  local.subscribeMonthly)
            self.secondSelectedTopLabel = LabelSub(type: .subscribeTopPriceActive, mPrice + "\n",  local.subscribeMonthly)
            self.secondBottomLabel = LabelSub(type: .subscribeBottom, local.subscribeFreeTrial,  local.subscribeMonthly)
            self.secondSelectedBottomLabel = LabelSub(type: .subscribeBottomActive, local.subscribeFreeTrial,  local.subscribeMonthly)
        } else if self.second == "com.dogtranslator.1we"{
            self.secondTopLabel = LabelSub(type: .priceTop, wPrice, local.subscribeWeekly)
            self.secondSelectedTopLabel = LabelSub(type: .priceTopActive, wPrice, local.subscribeWeekly)
            self.secondBottomLabel = LabelSub(type: .dayBot, local.subscribeWeekly, local.subscribeWeekly)
            self.secondSelectedBottomLabel = LabelSub(type: .dayBotActive, local.subscribeWeekly, local.subscribeWeekly)
        } else if self.second == "com.dogtranslator.1ye"{
            self.secondTopLabel = LabelSub(type: .priceTop, yPrice, local.subscribeYearly)
            self.secondSelectedTopLabel = LabelSub(type: .priceTopActive, yPrice, local.subscribeYearly)
            self.secondBottomLabel = LabelSub(type: .dayBot, local.subscribeYearly, local.subscribeYearly)
            self.secondSelectedBottomLabel = LabelSub(type: .dayBotActive, local.subscribeYearly, local.subscribeYearly)
        } else if self.second == "com.dogtranslator.1mo" {
            self.secondTopLabel = LabelSub(type: .priceTop, mPrice,  local.subscribeMonthly)
            self.secondSelectedTopLabel = LabelSub(type: .priceTopActive, mPrice,  local.subscribeMonthly)
            self.secondBottomLabel = LabelSub(type: .dayBot, local.subscribeMonthly,  local.subscribeMonthly)
            self.secondSelectedBottomLabel = LabelSub(type: .dayBotActive, local.subscribeMonthly,  local.subscribeMonthly)
        }
        
        if self.third == "com.dogtranslator.1wetr"{
            self.thirdTopLabel = LabelSub(type: .subscribeTopPrice, wPrice + "\n", local.subscribeWeekly)
            self.thirdSelectedTopLabel = LabelSub(type: .subscribeTopPriceActive, wPrice + "\n", local.subscribeWeekly)
            self.thirdBottomLabel = LabelSub(type: .subscribeBottom, local.subscribeFreeTrial, local.subscribeWeekly)
            self.thirdSelectedBottomLabel = LabelSub(type: .subscribeBottomActive, local.subscribeFreeTrial, local.subscribeWeekly)
        } else if self.third == "com.dogtranslator.1yetr"{
            self.thirdTopLabel = LabelSub(type: .subscribeTopPrice, yPrice + "\n", local.subscribeYearly)
            self.thirdSelectedTopLabel = LabelSub(type: .subscribeTopPriceActive, yPrice + "\n", local.subscribeYearly)
            self.thirdBottomLabel = LabelSub(type: .subscribeBottom, local.subscribeFreeTrial, local.subscribeYearly)
            self.thirdSelectedBottomLabel = LabelSub(type: .subscribeBottomActive, local.subscribeFreeTrial, local.subscribeYearly)
        } else if self.third == "com.dogtranslator.1motr" {
            self.thirdTopLabel = LabelSub(type: .subscribeTopPrice, mPrice + "\n",  local.subscribeMonthly)
            self.thirdSelectedTopLabel = LabelSub(type: .subscribeTopPriceActive, mPrice + "\n",  local.subscribeMonthly)
            self.thirdBottomLabel = LabelSub(type: .subscribeBottom, local.subscribeFreeTrial,  local.subscribeMonthly)
            self.thirdSelectedBottomLabel = LabelSub(type: .subscribeBottomActive, local.subscribeFreeTrial,  local.subscribeMonthly)
        } else if self.third == "com.dogtranslator.1we"{
            self.thirdTopLabel = LabelSub(type: .priceTop, wPrice, local.subscribeWeekly)
            self.thirdSelectedTopLabel = LabelSub(type: .priceTopActive, wPrice, local.subscribeWeekly)
            self.thirdBottomLabel = LabelSub(type: .dayBot, local.subscribeWeekly, local.subscribeWeekly)
            self.thirdSelectedBottomLabel = LabelSub(type: .dayBotActive, local.subscribeWeekly, local.subscribeWeekly)
        } else if self.third == "com.dogtranslator.1ye"{
            self.thirdTopLabel = LabelSub(type: .priceTop, yPrice, local.subscribeYearly)
            self.thirdSelectedTopLabel = LabelSub(type: .priceTopActive, yPrice, local.subscribeYearly)
            self.thirdBottomLabel = LabelSub(type: .dayBot, local.subscribeYearly, local.subscribeYearly)
            self.thirdSelectedBottomLabel = LabelSub(type: .dayBotActive, local.subscribeYearly, local.subscribeYearly)
        } else if self.third == "com.dogtranslator.1mo" {
            self.thirdTopLabel = LabelSub(type: .priceTop, mPrice,  local.subscribeMonthly)
            self.thirdSelectedTopLabel = LabelSub(type: .priceTopActive, mPrice,  local.subscribeMonthly)
            self.thirdBottomLabel = LabelSub(type: .dayBot, local.subscribeMonthly,  local.subscribeMonthly)
            self.thirdSelectedBottomLabel = LabelSub(type: .dayBotActive, local.subscribeMonthly,  local.subscribeMonthly)
        }
        
        self.setup()
        self.setupLogic()
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func restoreAlert(notification: Notification) {
        let alertController = UIAlertController(title: local.alertRestore,
                                                message: local.alertRestoreDiscription,
                                                preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: NSLocalizedString("alerOK", comment: ""), style: .destructive))
        alertController.overrideUserInterfaceStyle = UIUserInterfaceStyle.light
        self.window?.rootViewController?.present(alertController, animated: true)
    }
}
