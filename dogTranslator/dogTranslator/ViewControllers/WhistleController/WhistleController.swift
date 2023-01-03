//
//  WhistleController.swift
//  dogTranslator
//
//  Created by Stas Dashkevich on 10.12.22.
//

import Foundation
import UIKit
import GoogleMobileAds

class WhistleController: UIViewController {
    
    let myUnit = ToneOutputUnit()
    
    //MARK: Create UI
    
    lazy var background = ImageView(style: .mainBackgroundImage)
    lazy var navigationView = View(style: .navigationView)
    lazy var navigationHeader = Label(style: .navigationHeader, "Whistle")
    lazy var navigationSetting = Button(style: .navigationSetting, nil)
    lazy var navigationSubscribe = Button(style: .navigationSubscribe, nil)
    lazy var roundedSettingView = View(style: .roundedView)
    lazy var roundedSubscribeView = View(style: .roundedView)
    lazy var vads = View(style: .clearView)
    
    lazy var whistleButton = Button(style: .whistleBackground, nil)
    lazy var hzLabel = Label(style: .semibold22, "10 000 Hz")
    
    lazy var slider: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.minimumValue = 0
        slider.tintColor = UIColor(named: "lightBlue")
        slider.thumbTintColor = UIColor(named: "blueTumb")
        slider.maximumValue = 20000
        slider.value = 10000
        
        return slider
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setUpUI()
    }
    
    var baner: GADBannerView?
    var ads = UserDefaults.standard.value(forKey: "ads")

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        RemoteConfigFetch.shared.fetchValues()
        
        if UserDefaults.standard.value(forKey: "ads") as? String != nil {
            ads = UserDefaults.standard.value(forKey: "ads") as? String ?? "2"
        } else {
            ads = "2"
        }
        if UserDefaults.standard.value(forKey: "FullAccess") as! Int == 1 {
            ads = "0"
            baner = nil
            vads.isHidden = true
        }
        if ads as? String == "0" {
            vads.isHidden = true
            setUpUI()
            navigationView.snp.remakeConstraints { make in
                    make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
                    make.left.right.equalTo(view).inset(16)
                    make.height.equalTo(52)
            }
        } else if ads as? String == "1"{
            vads.isHidden = false
            
            baner = GADBannerView(adSize: GADAdSizeBanner)
            baner?.backgroundColor = UIColor.clear.withAlphaComponent(0)
            baner?.layer.backgroundColor = UIColor.clear.cgColor
            vads.backgroundColor = UIColor.clear.withAlphaComponent(0)
            baner?.adUnitID = "ca-app-pub-3940256099942544/2934735716"
            if UIScreen.main.bounds.height < 700 {
                        baner?.frame = CGRect(x: 0, y: view.frame.size.height-100, width: view.frame.size.width, height: 50).integral

                    } else {
                        baner?.frame = CGRect(x: 0, y: view.frame.size.height-150, width: view.frame.size.width, height: 50).integral
                    }
                    
                    if UIScreen.main.bounds.height > 950 {
                        baner?.frame = CGRect(x: 0, y: view.frame.size.height-120, width: view.frame.size.width, height: 50).integral
                    }
            baner?.rootViewController = self
            baner?.load(GADRequest())
            setUpUI()
        } else {
            vads.isHidden = false
            baner = GADBannerView(adSize: GADAdSizeBanner)
            baner?.adUnitID = "ca-app-pub-4602239242191301/2613950852"
            baner?.backgroundColor = UIColor.clear.withAlphaComponent(0)
            baner?.layer.backgroundColor = UIColor.clear.cgColor
            vads.backgroundColor = UIColor.clear.withAlphaComponent(0)
            if UIScreen.main.bounds.height < 700 {
                        baner?.frame = CGRect(x: 0, y: view.frame.size.height-100, width: view.frame.size.width, height: 50).integral

                    } else {
                        baner?.frame = CGRect(x: 0, y: view.frame.size.height-150, width: view.frame.size.width, height: 50).integral
                    }
                    
                    if UIScreen.main.bounds.height > 950 {
                        baner?.frame = CGRect(x: 0, y: view.frame.size.height-120, width: view.frame.size.width, height: 50).integral
                    }
            baner?.rootViewController = self
            baner?.load(GADRequest())
        }
        
        if UserDefaults.standard.value(forKey: "FullAccess") as? Int == 1 {
            roundedSettingView.isHidden = true
        }
    }
}

extension WhistleController: UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return PresentTransition()
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return DismissTransition()
    }
}
