//
//  EmotionsController.swift
//  dogTranslator
//
//  Created by Stas Dashkevich on 10.12.22.
//

import Foundation
import UIKit
import GoogleMobileAds
import AVFAudio

class EmotionsController: UIViewController {
    
    //MARK: Create UI
    
    lazy var background = ImageView(style: .fixBG)
    lazy var navigationView = View(style: .navigationView)
    lazy var navigationHeader = Label(style: .navigationHeader, NSLocalizedString("titleEmotions", comment: ""))
    lazy var navigationSetting = Button(style: .navigationSetting, nil)
    lazy var navigationSubscribe = Button(style: .navigationSubscribe, nil)
    lazy var roundedSettingView = View(style: .roundedView)
    lazy var roundedSubscribeView = View(style: .roundedView)
    lazy var vads = View(style: .clearView)
    
    var approach = false
    
    var player: AVAudioPlayer?
    public var collection: UICollectionView?
    var selectedIndex: IndexPath?
    
    var dogIconArray = [(image: String, text: String)]()
    var dogIconArrayTranslate = [(image: String, text: String)]()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupDogArray()
        setUpUI()
        setUpLogic()
        setupDogArrayTranslate()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
       
    }
    
    var baner: GADBannerView?
    var ads = UserDefaults.standard.value(forKey: "ads")
    var sub = UserDefaults.standard.value(forKey: "getter2") as? String ?? "1"

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        RemoteConfigFetch.shared.fetchValues()
        UserDefaults.standard.set(1, forKey: "index")

        selectedIndex = nil
        
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { [self] Timer in
            collection?.reloadData()
            Timer.invalidate()
        }
        
        if UserDefaults.standard.value(forKey: "ads") as? String != nil {
            ads = UserDefaults.standard.value(forKey: "ads") as? String ?? "2"
        } else {
            ads = "2"
        }
        if UserDefaults.standard.value(forKey: "FullAccess") as! Int == 1 {
            ads = "0"
            vads.isHidden = true
            baner = nil
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
                        baner?.frame = CGRect(x: 0, y: view.frame.size.height-100, width: view.frame.size.width - 70, height: 50).integral

                    } else {
                        baner?.frame = CGRect(x: 0, y: view.frame.size.height-150, width: view.frame.size.width - 70, height: 50).integral
                    }
                    
                    if UIScreen.main.bounds.height > 950 {
                        baner?.frame = CGRect(x: 0, y: view.frame.size.height-120, width: view.frame.size.width - 100, height: 50).integral
                    }
            baner?.rootViewController = self
            baner?.load(GADRequest())
        }
        
        if UserDefaults.standard.value(forKey: "FullAccess") as? Int == 1 {
            roundedSettingView.isHidden = true

        }
    }
}

extension EmotionsController {
    
    func setupDogArray() {
        if UserDefaults.standard.value(forKey: "hide") as? String == "1"{
            dogIconArray += [
                (image: "yes", text: ""),
                (image: "no", text: ""),
                (image: "hello", text: ""),
                (image: "playful", text: ""),
                (image: "mad", text: ""),
                (image: "happy", text: ""),
                (image: "suprised", text: ""),
                (image: "kiss", text: ""),
                (image: "thanks", text: ""),
                (image: "love", text: ""),
                (image: "angry", text: ""),
                (image: "amazed", text: ""),
                (image: "cry", text: ""),
                (image: "laugh", text: ""),
                (image: "attention", text: ""),
                (image: "sleepy", text: ""),
                (image: "hungry", text: ""),
                (image: "sick", text: ""),
                (image: "lonely", text: ""),
                (image: "sad", text: ""),
                (image: "what", text: ""),
                (image: "yummy", text: ""),
                (image: "LetsPlay", text: ""),
                (image: "bathe", text: "")
            ]
        } else {
            dogIconArray += [
                (image: "yes", text: "Yes"),
                (image: "no", text: "No"),
                (image: "hello", text: "Hello"),
                (image: "playful", text: "Playful"),
                (image: "mad", text: "Mad"),
                (image: "happy", text: "Happy"),
                (image: "suprised", text: "Suprised"),
                (image: "kiss", text: "Air Kiss"),
                (image: "thanks", text: "Thanks"),
                (image: "love", text: "Love"),
                (image: "angry", text: "Angry"),
                (image: "amazed", text: "Amazed"),
                (image: "cry", text: "Cry"),
                (image: "laugh", text: "Laugh"),
                (image: "attention", text: "Attention"),
                (image: "sleepy", text: "Sleepy"),
                (image: "hungry", text: "Hungry"),
                (image: "sick", text: "Sick"),
                (image: "lonely", text: "Lonely"),
                (image: "sad", text: "Sad"),
                (image: "what", text: "What?"),
                (image: "yummy", text: "Yummy"),
                (image: "LetsPlay", text: "LetsPlay"),
                (image: "bathe", text: "Bathe")
            ]
        }
    }
    
    func setupDogArrayTranslate() {
        if UserDefaults.standard.value(forKey: "hide") as? String == "1" {
            dogIconArrayTranslate += [
                (image: "yes", text: ""),
                (image: "no", text: ""),
                (image: "hello", text: ""),
                (image: "playful", text: ""),
                (image: "mad", text: ""),
                (image: "happy", text: ""),
                (image: "suprised", text: ""),
                (image: "kiss", text: ""),
                (image: "thanks", text: ""),
                (image: "love", text: ""),
                (image: "angry", text: ""),
                (image: "amazed", text: ""),
                (image: "cry", text: ""),
                (image: "laugh", text: ""),
                (image: "attention", text: ""),
                (image: "sleepy", text: ""),
                (image: "hungry", text: ""),
                (image: "sick", text: ""),
                (image: "lonely", text: ""),
                (image: "sad", text: ""),
                (image: "what", text: ""),
                (image: "yummy", text: ""),
                (image: "LetsPlay", text: ""),
                (image: "bathe", text: "")
            ]

        } else {
            dogIconArrayTranslate += [
                (image: "yes", text: NSLocalizedString("emotionsYes", comment: "")),
                (image: "no", text: NSLocalizedString("emotionsNo", comment: "")),
                (image: "hello", text: NSLocalizedString("emotionsHello", comment: "")),
                (image: "playful", text: NSLocalizedString("emotionsPlayful", comment: "")),
                (image: "mad", text: NSLocalizedString("emotionsMad", comment: "")),
                (image: "happy", text: NSLocalizedString("emotionsHappy", comment: "")),
                (image: "suprised", text: NSLocalizedString("emotionsSuprised", comment: "")),
                (image: "kiss", text: NSLocalizedString("emotionsKiss", comment: "")),
                (image: "thanks", text: NSLocalizedString("emotionsThanks", comment: "")),
                (image: "love", text: NSLocalizedString("emotionsLove", comment: "")),
                (image: "angry", text: NSLocalizedString("emotionsAngry", comment: "")),
                (image: "amazed", text: NSLocalizedString("emotionsAmazed", comment: "")),
                (image: "cry", text: NSLocalizedString("emotionsCry", comment: "")),
                (image: "laugh", text: NSLocalizedString("emotionsLaugh", comment: "")),
                (image: "attention", text: NSLocalizedString("emotionsAttention", comment: "")),
                (image: "sleepy", text: NSLocalizedString("emotionsSleepy", comment: "")),
                (image: "hungry", text: NSLocalizedString("emotionsHungry", comment: "")),
                (image: "sick", text: NSLocalizedString("emotionsSick", comment: "")),
                (image: "lonely", text: NSLocalizedString("emotionsLonely", comment: "")),
                (image: "sad", text: NSLocalizedString("emotionsSad", comment: "")),
                (image: "what", text: NSLocalizedString("emotionsWhat", comment: "")),
                (image: "yummy", text: NSLocalizedString("emotionsYummy", comment: "")),
                (image: "LetsPlay", text: NSLocalizedString("emotionsBuble", comment: "")),
                (image: "bathe", text: NSLocalizedString("emotionsBath", comment: ""))
            ]

        }
    }
}

extension EmotionsController: UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return PresentTransition()
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return DismissTransition()
    }
}

