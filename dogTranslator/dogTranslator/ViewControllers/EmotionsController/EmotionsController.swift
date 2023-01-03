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
    
    lazy var background = ImageView(style: .emptyImage)
    lazy var navigationView = View(style: .navigationView)
    lazy var navigationHeader = Label(style: .navigationHeader, "Emotions")
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDogArray()
        setUpUI()
        setUpLogic()
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

extension EmotionsController {
    
    func setupDogArray() {
        
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
            (image: "play", text: "Let’s Play"),
            (image: "bathe", text: "Bathe")
        ]
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
