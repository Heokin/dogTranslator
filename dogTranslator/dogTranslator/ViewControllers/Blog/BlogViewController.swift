//
//  BlogViewController.swift
//  dogTranslator
//
//  Created by Stas Dashkevich on 12.04.23.
//

import Foundation
import UIKit
import GoogleMobileAds

class BlogViewController: UIViewController {
    
    public var collection: UICollectionView?
    lazy var background = ImageView(style: .fixBG)
    lazy var navigationView = View(style: .navigationView)
    lazy var navigationHeader = Label(style: .navigationHeader, "Dog Training Articles.")
    lazy var navigationSetting = Button(style: .navigationSetting, nil)
    lazy var navigationSubscribe = Button(style: .navigationSubscribe, nil)
    lazy var roundedSettingView = View(style: .roundedView)
    lazy var roundedSubscribeView = View(style: .roundedView)
    lazy var vads = View(style: .clearView)
    
    var colorArray = [String]()
    var textArray = [String]()
    var textArrayAction = [String]()
    var chevronLock = [String]()
    var blogActionImage = [String]()
    var chevronLockLock = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        setupCollection()
        
        NotificationCenter.default.addObserver(self, selector: #selector(reloadSetting), name: Notification.Name("reloadSetting"), object: nil)
    }
    
    
    var baner: GADBannerView?
    var ads = UserDefaults.standard.value(forKey: "ads")
    var sub = UserDefaults.standard.value(forKey: "getter2") as? String ?? "1"

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        RemoteConfigFetch.shared.fetchValues()
        if UserDefaults.standard.value(forKey: "hide") as! String  == "1" {
            UserDefaults.standard.set(3, forKey: "index")
        } else {
            UserDefaults.standard.set(4, forKey: "index")
        }

        setupColor()
        
//        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { [self] Timer in
            collection?.reloadData()
        
        
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

extension BlogViewController {
    
    func setupColor() {
        colorArray += [
            "blogGreen","blogPurple", "blogPink", "blogBlue", "blogYellow", "blogDarkGreen", "blogBrown", "blogMiddleGreen", "cardBlue", "blogYellow"
        ]
        textArray += [
            NSLocalizedString("blog1", comment: ""), NSLocalizedString("blog2", comment: ""),NSLocalizedString("blog3", comment: ""),NSLocalizedString("blog4", comment: ""),NSLocalizedString("blog5", comment: ""),NSLocalizedString("blog6", comment: ""),NSLocalizedString("blog7", comment: ""),NSLocalizedString("blog8", comment: ""),NSLocalizedString("blog9", comment: ""), NSLocalizedString("blog10", comment: "")
        ]
        
        textArrayAction += [
            NSLocalizedString("blogAction1", comment: ""), NSLocalizedString("blogAction2", comment: ""),NSLocalizedString("blogAction3", comment: ""),NSLocalizedString("blogAction4", comment: ""),NSLocalizedString("blogAction5", comment: ""),NSLocalizedString("blogAction6", comment: ""),NSLocalizedString("blogAction7", comment: ""),NSLocalizedString("blogAction8", comment: ""),NSLocalizedString("blogAction9", comment: ""), NSLocalizedString("blogAction10", comment: "")
        ]
        
            chevronLock += [
               "newChev", "newChev", "pink", "lightBlue","lightYellow","darkGreen","brown", "lightGreen","blue", "darkYellow"
            ]
            chevronLockLock += [
               "newChev", "newChev", "newChev", "newChev","newChev","newChev","newChev", "newChev","newChev", "newChev"
            ]
        blogActionImage += [
        "action1", "action2", "action3", "action4", "action5", "action6", "action7", "action8", "action9", "action10"
        ]
    }
    @objc func reloadSetting() {
      
        collection?.reloadData()
    }
}
