//
//  VoiceController.swift
//  dogTranslator
//
//  Created by Stas Dashkevich on 10.12.22.
//

import Foundation
import UIKit
import Lottie
import GoogleMobileAds
import AVFAudio

class VoiceController: UIViewController {
    
    //MARK: Create UI
    lazy var background = ImageView(style: .fixBG)
    lazy var navigationView = View(style: .navigationView)
    lazy var navigationHeader = Label(style: .navigationHeader, NSLocalizedString("titleTranslator", comment: ""))
    lazy var navigationSetting = Button(style: .navigationSetting, nil)
    lazy var navigationSubscribe = Button(style: .navigationSubscribe, nil)
    lazy var roundedSettingView = View(style: .roundedView)
    lazy var roundedSubscribeView = View(style: .roundedView)
    
    lazy var recordButton = Button(style: .recordButton, nil)
    lazy var holdTextLabel = Label(style: .holdBeer, NSLocalizedString("textHelperHuman", comment: ""))
    lazy var viewForButton = View(style: .clearView)
    
    lazy var humanIcon = Button(style: .humanIcon, nil)
    lazy var dogIcon = Button(style: .dogIcon, nil)
    lazy var changeIcon = ImageView(style: .changeIcon)
    lazy var vads = View(style: .clearView)
        
    var recorder = Recorder()
    var selectedIndex = 0
    var counterTimer: Double = 0.0
    var decibels = 0
    var limit = "5"
    var rateUs = ""
    
    var animationView: LottieAnimationView = {
        var animation = LottieAnimationView()
        animation = .init(name: "microphone")
        animation.animationSpeed = 0.6
        animation.loopMode = .loop
        animation.translatesAutoresizingMaskIntoConstraints = false
        animation.isUserInteractionEnabled = false
        
        return animation
    }()
    
    var baner: GADBannerView?
    var ads = UserDefaults.standard.value(forKey: "ads")
    var sub = UserDefaults.standard.value(forKey: "getter2") as? String ?? "1"

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        if UserDefaults.standard.value(forKey: "hide") as! String  == "1" {
        } else {
            UserDefaults.standard.set(2, forKey: "index")
        }

        RemoteConfigFetch.shared.fetchValues()
        
        if UserDefaults.standard.value(forKey: "ads") as? String != nil {
            ads = UserDefaults.standard.value(forKey: "ads") as? String ?? "2"
        } else {
            ads = "2"
        }
                
        if UserDefaults.standard.value(forKey: "availableFreeSave") != nil {
            limit = UserDefaults.standard.value(forKey: "availableFreeSave") as! String
        } else {
           UserDefaults.standard.set(5, forKey: "availableFreeSave")
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
                        baner?.frame = CGRect(x: 0, y: view.frame.size.height-100, width: view.frame.size.width - 70, height: 50).integral

                    } else {
                        baner?.frame = CGRect(x: 0, y: view.frame.size.height-150, width: view.frame.size.width - 70, height: 50).integral
                    }
                    
                    if UIScreen.main.bounds.height > 950 {
                        baner?.frame = CGRect(x: 0, y: view.frame.size.height-120, width: view.frame.size.width - 100, height: 50).integral
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
        
        if UserDefaults.standard.value(forKey: "FullAccess") as! Int == 1 {
            roundedSettingView.isHidden = true
        }
        
        if selectedIndex == 0 {
                recordButton.imageView?.image = UIImage(named: "green")

                humanIcon.snp.remakeConstraints { make in
                    make.height.width.equalTo(72)
                    make.right.equalTo(changeIcon.snp.left).offset(-8)
                    make.centerY.equalTo(changeIcon)
                }
                dogIcon.snp.remakeConstraints { make in
                    make.height.width.equalTo(48)
                    make.left.equalTo(changeIcon.snp.right).offset(8)
                    make.centerY.equalTo(changeIcon)
                }
                
                self.view.layoutIfNeeded()
        } else {
                recordButton.imageView?.image = UIImage(named: "yellow")
                
                humanIcon.snp.remakeConstraints { make in
                    make.height.width.equalTo(48)
                    make.right.equalTo(changeIcon.snp.left).offset(-8)
                    make.centerY.equalTo(changeIcon)
                }
                
                dogIcon.snp.remakeConstraints { make in
                    make.height.width.equalTo(72)
                    make.left.equalTo(changeIcon.snp.right).offset(8)
                    make.centerY.equalTo(changeIcon)
                }
                
                self.view.layoutIfNeeded()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        recorder.stop()
        recorder.stopMonitoring()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        setUpUI()
        
//        if UserDefaults.standard.value(forKey: "rateUs") == nil {
//                print("getter not corrected")
//        } else {
//               print("getter corrected")
//            rateUs = UserDefaults.standard.value(forKey: "rateUs") as! String
//        }
//        rateApp()
        
        IsFirstLaunch.shared.isFirstLaunch = true
        
        AVAudioSession.sharedInstance().requestRecordPermission { granted in
            
        }
    }
  
}

extension VoiceController: UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return PresentTransition()
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return DismissTransition()
    }
}
