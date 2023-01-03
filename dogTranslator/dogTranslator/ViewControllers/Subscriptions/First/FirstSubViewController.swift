//
//  FirstSubViewController.swift
//  dogTranslator
//
//  Created by Stas Dashkevich on 21.12.22.
//

import Foundation
import UIKit
import SwiftyStoreKit

class FirstSubscribeViewController: UIViewController{

    var buttonDelay = UserDefaults.standard.value(forKey: "closeButtonDelay") as? String
    
    let swifty = IAPManager()
    var subs = ""
    
    var first = "com.dogtranslator.1we"
    var second = "com.dogtranslator.1mo"
    var third = "com.dogtranslator.1ye"
    
    var wPrice = "$1.99"
    var mPrice = "$4.49"
    var yPrice = "$9.99"
    
    var spiner = UIActivityIndicatorView(style: .large)
    
    var standartHeight = UIScreen.main.bounds.height / 6.1984
    var selecredHeight = UIScreen.main.bounds.height / 5.075
    
    let local = LocalizationVariables()
    
    lazy var bgImage = ImageView(style: .subMainBGImage)
    lazy var imageHeader = ImageView(style: .subImageHeader)
    
    lazy var unslockAllAccess = Label(style: .subGreen, "Unlock All Access")
    lazy var firstSubLabel = Label(style: .subReason, "No Limits")
    lazy var secondSubLabel = Label(style: .subReason, "No Ads")
    
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
    lazy var firstImageSub = ImageView(style: .subscribeSubView)
    
    lazy var secondSelectedSubView = ViewSub(type: .subscribeSubView)
    var secondSelectedTopLabel: LabelSub?
    var secondSelectedBottomLabel: LabelSub?
    lazy var secondSelectedSubPlace = ViewSub(type: .subscribeSubViewPlace)
    lazy var secondImageSub = ImageView(style: .subscribeSubView)
    
    lazy var thirdSelectedSubView = ViewSub(type: .subscribeSubView)
    var thirdSelectedTopLabel: LabelSub?
    var thirdSelectedBottomLabel: LabelSub?
    lazy var thirdSelectedSubPlace = ViewSub(type: .subscribeSubViewPlace)
    lazy var thirdImageSub = ImageView(style: .subscribeSubView)

    lazy var continueButton = Button(style: .subscribeContinue, local.subscribeSaveButton)
    
    lazy var restoreView = ViewSub(type: .dismissView)
    lazy var restoreLabel = LabelSub(type: .restore, local.restoreButton, "")
    lazy var dismissView = ViewSub(type: .dismissView)
    lazy var xmark = ImageViewSub(image: .xmark)
    
    lazy var restoreTap = UITapGestureRecognizer(target: self, action: #selector(restoreTarget))
    lazy var dismissTap = UITapGestureRecognizer(target: self, action: #selector(closeTarget))
    lazy var recognizeFirst = UITapGestureRecognizer(target: self, action: #selector(firstSub))
    lazy var recognizeSecond = UITapGestureRecognizer(target: self, action: #selector(secondSub))
    lazy var recognizeThird = UITapGestureRecognizer(target: self, action: #selector(thirdSub))
    
    override func viewDidLoad() {

        DispatchQueue.main.async {
            RemoteConfigFetch.shared.fetchValues()
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(methodOfReceivedNotification(notification:)), name: Notification.Name("SubscribeOk"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(restoreAlert(notification:)), name: Notification.Name("RestoreError"), object: nil)

        let js = UserDefaults.standard.value(forKey: "oSub") as? String

        if js != nil {
            do{
                if let json = js!.data(using: String.Encoding.utf8){
                    if let jsonData = try JSONSerialization.jsonObject(with: json, options: .allowFragments) as? [String:AnyObject]{
                        self.first = jsonData["1"] as! String
                        self.second = jsonData["2"] as! String
                        self.third = jsonData["3"] as! String
                        print(self.first)
                        print(self.second)
                        print(self.third)
                    }
                }
            } catch {
                print(error.localizedDescription)
            }
        }

        let q = DispatchQueue.global(qos: .default)
        DispatchQueue.main.async {
            [self] in
            SwiftyStoreKit.retrieveProductsInfo([first]) { [self] result in
                if let product = result.retrievedProducts.first {
                    wPrice = product.localizedPrice!
                    if first == "com.dogtranslator.1yetr" {
                        self.firstBottomLabel?.attributedText = noActiveBottom(wPrice, local.subscribeYearly)
                        self.firstSelectedBottomLabel?.attributedText = activeBottom(wPrice, local.subscribeYearly)
                    } else if first == "com.dogtranslator.1motr" {
                        self.firstBottomLabel?.attributedText = noActiveBottom(wPrice, local.subscribeMonthly)
                        self.firstSelectedBottomLabel?.attributedText = activeBottom(wPrice, local.subscribeMonthly)
                    } else if first == "com.dogtranslator.1wetr" {
                        self.firstBottomLabel?.attributedText = noActiveBottom(wPrice, local.subscribeWeekly)
                        self.firstSelectedBottomLabel?.attributedText = activeBottom(wPrice, local.subscribeWeekly)
                    } else {
                        self.firstBottomLabel?.text = wPrice
                        self.firstSelectedBottomLabel?.text = wPrice
                    }
                }
            }

            SwiftyStoreKit.retrieveProductsInfo([second]) { [self] result in
                if let product = result.retrievedProducts.first {
                    mPrice = product.localizedPrice!
                    if second == "com.dogtranslator.1yetr" {
                        subs = "com.dogtranslator.1yetr"
                        self.secondBottomLabel?.attributedText = noActiveBottom(mPrice, local.subscribeYearly)
                        self.secondSelectedBottomLabel?.attributedText = activeBottom(mPrice, local.subscribeYearly)
                    } else if second == "com.dogtranslator.1motr" {
                        subs = "com.dogtranslator.1motr"
                        self.secondBottomLabel?.attributedText = noActiveBottom(mPrice, local.subscribeMonthly)
                        self.secondSelectedBottomLabel?.attributedText = activeBottom(mPrice, local.subscribeMonthly)
                    } else if second == "com.dogtranslator.1wetr" {
                        subs = "com.dogtranslator.1wetr"
                        self.secondBottomLabel?.attributedText = noActiveBottom(mPrice, local.subscribeWeekly)
                        self.secondSelectedBottomLabel?.attributedText = activeBottom(mPrice, local.subscribeWeekly)
                    } else if second == "com.dogtranslator.1we" {
                        subs = "com.dogtranslator.1we"
                        self.secondBottomLabel?.text = mPrice
                        self.secondSelectedBottomLabel?.text = mPrice
                    } else if second == "com.dogtranslator.1mo" {
                        subs = "com.dogtranslator.1mo"
                        self.secondBottomLabel?.text = mPrice
                        self.secondSelectedBottomLabel?.text = mPrice
                    } else if second == "com.dogtranslator.1ye" {
                        subs = "com.dogtranslator.1ye"
                        self.secondBottomLabel?.text = mPrice
                        self.secondSelectedBottomLabel?.text = mPrice
                    }
                }
            }

            SwiftyStoreKit.retrieveProductsInfo([third]) { [self] result in
                if let product = result.retrievedProducts.first {
                    yPrice = product.localizedPrice!
                    if third == "com.dogtranslator.1yetr" {
                        self.thirdBottomLabel?.attributedText = noActiveBottom(yPrice, local.subscribeYearly)
                        self.thirdSelectedBottomLabel?.attributedText = activeBottom(yPrice, local.subscribeYearly)
                    } else if third == "com.dogtranslator.1motr" {
                        self.thirdBottomLabel?.attributedText = noActiveBottom(yPrice, local.subscribeMonthly)
                        self.thirdSelectedBottomLabel?.attributedText = activeBottom(yPrice, local.subscribeMonthly)
                    } else if third == "com.dogtranslator.1wetr" {
                        self.thirdBottomLabel?.attributedText = noActiveBottom(yPrice, local.subscribeWeekly)
                        self.thirdSelectedBottomLabel?.attributedText = activeBottom(yPrice, local.subscribeWeekly)
                    } else {
                        self.thirdBottomLabel?.text = yPrice
                        self.thirdSelectedBottomLabel?.text = yPrice
                    }
                }
            }
        }
        
        if self.first == "com.dogtranslator.1wetr"{
            self.firstBottomLabel = LabelSub(type: .subscribeBottomPrice, wPrice + "\n", local.subscribeWeekly)
            self.firstSelectedBottomLabel = LabelSub(type: .subscribeBottomPriceActive, wPrice + "\n", local.subscribeWeekly)
            self.firstTopLabel = LabelSub(type: .subscribeTop, local.subscribeFreeTrial, local.subscribeWeekly)
            self.firstSelectedTopLabel = LabelSub(type: .subscribeTopActive, local.subscribeFreeTrial, local.subscribeWeekly)
        } else if self.first == "com.dogtranslator.1yetr"{
            self.firstBottomLabel = LabelSub(type: .subscribeBottomPrice, yPrice + "\n", local.subscribeYearly)
            self.firstSelectedBottomLabel = LabelSub(type: .subscribeBottomPriceActive, yPrice + "\n", local.subscribeYearly)
            self.firstTopLabel = LabelSub(type: .subscribeTop, local.subscribeFreeTrial, local.subscribeYearly)
            self.firstSelectedTopLabel = LabelSub(type: .subscribeTopActive, local.subscribeFreeTrial, local.subscribeYearly)
        } else if self.first == "com.dogtranslator.1motr"{
            self.firstBottomLabel = LabelSub(type: .subscribeBottomPrice, mPrice + "\n", local.subscribeMonthly)
            self.firstSelectedBottomLabel = LabelSub(type: .subscribeBottomPriceActive, mPrice + "\n", local.subscribeMonthly)
            self.firstTopLabel = LabelSub(type: .subscribeTop, local.subscribeFreeTrial, local.subscribeMonthly)
            self.firstSelectedTopLabel = LabelSub(type: .subscribeTopActive, local.subscribeFreeTrial, local.subscribeMonthly)
        } else if self.first == "com.dogtranslator.1we"{
            self.firstBottomLabel = LabelSub(type: .priceBot, wPrice, local.subscribeWeekly)
            self.firstSelectedBottomLabel = LabelSub(type: .priceBotActive, wPrice, local.subscribeWeekly)
            self.firstTopLabel = LabelSub(type: .dayTop, local.subscribeWeekly.uppercased(), local.subscribeWeekly)
            self.firstSelectedTopLabel = LabelSub(type: .dayTopActive, local.subscribeWeekly.uppercased(), local.subscribeWeekly)
        } else if self.first == "com.dogtranslator.1ye"{
            self.firstBottomLabel = LabelSub(type: .priceBot, yPrice, local.subscribeYearly)
            self.firstSelectedBottomLabel = LabelSub(type: .priceBotActive, yPrice, local.subscribeYearly)
            self.firstTopLabel = LabelSub(type: .dayTop, local.subscribeYearly.uppercased(), local.subscribeYearly)
            self.firstSelectedTopLabel = LabelSub(type: .dayTopActive, local.subscribeYearly.uppercased(), local.subscribeYearly)
        } else if self.first == "com.dogtranslator.1mo"{
            self.firstBottomLabel = LabelSub(type: .priceBot, mPrice, local.subscribeMonthly)
            self.firstSelectedBottomLabel = LabelSub(type: .priceBotActive, mPrice, local.subscribeMonthly)
            self.firstTopLabel = LabelSub(type: .dayTop, local.subscribeMonthly.uppercased(), local.subscribeMonthly)
            self.firstSelectedTopLabel = LabelSub(type: .dayTopActive, local.subscribeMonthly.uppercased(), local.subscribeMonthly)
        }
        
        
        if self.second == "com.dogtranslator.1wetr"{
            self.secondBottomLabel = LabelSub(type: .subscribeBottomPrice, wPrice + "\n", local.subscribeWeekly)
            self.secondSelectedBottomLabel = LabelSub(type: .subscribeBottomPriceActive, wPrice + "\n", local.subscribeWeekly)
            self.secondTopLabel = LabelSub(type: .subscribeTop, local.subscribeFreeTrial, local.subscribeWeekly)
            self.secondSelectedTopLabel = LabelSub(type: .subscribeTopActive, local.subscribeFreeTrial, local.subscribeWeekly)
        } else if self.second == "com.dogtranslator.1yetr"{
            self.secondBottomLabel = LabelSub(type: .subscribeBottomPrice, yPrice + "\n", local.subscribeYearly)
            self.secondSelectedBottomLabel = LabelSub(type: .subscribeBottomPriceActive, yPrice + "\n", local.subscribeYearly)
            self.secondTopLabel = LabelSub(type: .subscribeTop, local.subscribeFreeTrial, local.subscribeYearly)
            self.secondSelectedTopLabel = LabelSub(type: .subscribeTopActive, local.subscribeFreeTrial, local.subscribeYearly)
        } else if self.second == "com.dogtranslator.1motr"{
            self.secondBottomLabel = LabelSub(type: .subscribeBottomPrice, mPrice + "\n", local.subscribeMonthly)
            self.secondSelectedBottomLabel = LabelSub(type: .subscribeBottomPriceActive, mPrice + "\n", local.subscribeMonthly)
            self.secondTopLabel = LabelSub(type: .subscribeTop, local.subscribeFreeTrial, local.subscribeMonthly)
            self.secondSelectedTopLabel = LabelSub(type: .subscribeTopActive, local.subscribeFreeTrial, local.subscribeMonthly)
        } else if self.second == "com.dogtranslator.1we"{
            self.secondBottomLabel = LabelSub(type: .priceBot, wPrice, local.subscribeWeekly)
            self.secondSelectedBottomLabel = LabelSub(type: .priceBotActive, wPrice, local.subscribeWeekly)
            self.secondTopLabel = LabelSub(type: .dayTop, local.subscribeWeekly.uppercased(), local.subscribeWeekly)
            self.secondSelectedTopLabel = LabelSub(type: .dayTopActive, local.subscribeWeekly.uppercased(), local.subscribeWeekly)
        } else if self.second == "com.dogtranslator.1ye"{
            self.secondBottomLabel = LabelSub(type: .priceBot, yPrice, local.subscribeYearly)
            self.secondSelectedBottomLabel = LabelSub(type: .priceBotActive, yPrice, local.subscribeYearly)
            self.secondTopLabel = LabelSub(type: .dayTop, local.subscribeYearly.uppercased(), local.subscribeYearly)
            self.secondSelectedTopLabel = LabelSub(type: .dayTopActive, local.subscribeYearly.uppercased(), local.subscribeYearly)
        } else if self.second == "com.dogtranslator.1mo"{
            self.secondBottomLabel = LabelSub(type: .priceBot, mPrice, local.subscribeMonthly)
            self.secondSelectedBottomLabel = LabelSub(type: .priceBotActive, mPrice, local.subscribeMonthly)
            self.secondTopLabel = LabelSub(type: .dayTop, local.subscribeMonthly.uppercased(), local.subscribeMonthly)
            self.secondSelectedTopLabel = LabelSub(type: .dayTopActive, local.subscribeMonthly.uppercased(), local.subscribeMonthly)
        }
        
        
        if self.third == "com.dogtranslator.1wetr"{
            self.thirdBottomLabel = LabelSub(type: .subscribeBottomPrice, wPrice + "\n", local.subscribeWeekly)
            self.thirdSelectedBottomLabel = LabelSub(type: .subscribeBottomPriceActive, wPrice + "\n", local.subscribeWeekly)
            self.thirdTopLabel = LabelSub(type: .subscribeTop, local.subscribeFreeTrial, local.subscribeWeekly)
            self.thirdSelectedTopLabel = LabelSub(type: .subscribeTopActive, local.subscribeFreeTrial, local.subscribeWeekly)
        } else if self.third == "com.dogtranslator.1yetr"{
            self.thirdBottomLabel = LabelSub(type: .subscribeBottomPrice, yPrice + "\n", local.subscribeYearly)
            self.thirdSelectedBottomLabel = LabelSub(type: .subscribeBottomPriceActive, yPrice + "\n", local.subscribeYearly)
            self.thirdTopLabel = LabelSub(type: .subscribeTop, local.subscribeFreeTrial, local.subscribeYearly)
            self.thirdSelectedTopLabel = LabelSub(type: .subscribeTopActive, local.subscribeFreeTrial, local.subscribeYearly)
        } else if self.third == "com.dogtranslator.1motr"{
            self.thirdBottomLabel = LabelSub(type: .subscribeBottomPrice, mPrice + "\n", local.subscribeMonthly)
            self.thirdSelectedBottomLabel = LabelSub(type: .subscribeBottomPriceActive, mPrice + "\n", local.subscribeMonthly)
            self.thirdTopLabel = LabelSub(type: .subscribeTop, local.subscribeFreeTrial, local.subscribeMonthly)
            self.thirdSelectedTopLabel = LabelSub(type: .subscribeTopActive, local.subscribeFreeTrial, local.subscribeMonthly)
        } else if self.third == "com.dogtranslator.1we"{
            self.thirdBottomLabel = LabelSub(type: .priceBot, wPrice, local.subscribeWeekly)
            self.thirdSelectedBottomLabel = LabelSub(type: .priceBotActive, wPrice, local.subscribeWeekly)
            self.thirdTopLabel = LabelSub(type: .dayTop, local.subscribeWeekly.uppercased(), local.subscribeWeekly)
            self.thirdSelectedTopLabel = LabelSub(type: .dayTopActive, local.subscribeWeekly.uppercased(), local.subscribeWeekly)
        } else if self.third == "com.dogtranslator.1ye"{
            self.thirdBottomLabel = LabelSub(type: .priceBot, yPrice, local.subscribeYearly)
            self.thirdSelectedBottomLabel = LabelSub(type: .priceBotActive, yPrice, local.subscribeYearly)
            self.thirdTopLabel = LabelSub(type: .dayTop, local.subscribeYearly.uppercased(), local.subscribeYearly)
            self.thirdSelectedTopLabel = LabelSub(type: .dayTopActive, local.subscribeYearly.uppercased(), local.subscribeYearly)
        } else if self.third == "com.dogtranslator.1mo"{
            self.thirdBottomLabel = LabelSub(type: .priceBot, mPrice, local.subscribeMonthly)
            self.thirdSelectedBottomLabel = LabelSub(type: .priceBotActive, mPrice, local.subscribeMonthly)
            self.thirdTopLabel = LabelSub(type: .dayTop, local.subscribeMonthly.uppercased(), local.subscribeMonthly)
            self.thirdSelectedTopLabel = LabelSub(type: .dayTopActive, local.subscribeMonthly.uppercased(), local.subscribeMonthly)
        }
        
        self.setup()
        
    setupLogic()
        
        super.viewDidLoad()
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
}
