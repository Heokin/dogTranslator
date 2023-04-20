//
//  PopUpDogResultController.swift
//  dogTranslator
//
//  Created by Stas Dashkevich on 11.12.22.
//

import Foundation
import UIKit
import SnapKit
import Lottie
import AVFAudio

class PopUpDogResultControllerIndex0: UIViewController {

    lazy var header = Label(style: .semibold30, "I am hungry")
    lazy var background = ImageView(style: .mainBackgroundImage)
    var counterForLimit = UserDefaults.standard.value(forKey: "counterLimit") as! Int
    var player: AVAudioPlayer?
    var seconds: Double = 0.0
    var selectedIndex: Int?

    var translateArray = [""]

    var animationView: LottieAnimationView = {
        var animation = LottieAnimationView()
        animation = .init(name: "dog")
        animation.animationSpeed = 0.6
        animation.loopMode = .loop
        animation.translatesAutoresizingMaskIntoConstraints = false
        animation.isUserInteractionEnabled = false
        
        return animation
    }()
    
    lazy var animView = View(style: .clearView)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for number in 1..<27 {
            let translate = NSLocalizedString("t"+String(number), comment: "")
            translateArray.append(translate)
        }
        
        setUpUI()
        setup()
        animationView.play()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UserDefaults.standard.set(0, forKey: "index")

        Timer.scheduledTimer(withTimeInterval: 5.5, repeats: false) { Timer in
            self.dismiss(animated: false)
        }
                
        counterForLimit += 1
        UserDefaults.standard.set(counterForLimit, forKey: "counterLimit")
        
        for number in 1..<27 {
            let translate = NSLocalizedString("t"+String(number), comment: "")
            translateArray.append(translate)
        }
    }
}

extension PopUpDogResultControllerIndex0 {
    
    func setUpUI() {
        
        view.backgroundColor = .white
        
        view.addSubview(background)
        view.addSubview(animView)
        view.addSubview(header)
        animView.addSubview(animationView)

        
        background.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        animationView.snp.makeConstraints { make in
            make.left.right.top.bottom.equalToSuperview()
        }
        
        animView.snp.makeConstraints { make in
            make.centerY.equalToSuperview().offset(80)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(260)
        }
        
        header.snp.makeConstraints { make in
            make.bottom.equalTo(animationView.snp.top).offset(-32)
            make.centerX.equalToSuperview()
            make.left.right.equalToSuperview().inset(30)
        }
    }
    
    func setup() {
        func playStartSound(_ soundName: String) {
                guard let path = Bundle.main.path(forResource: soundName, ofType: "mp3") else { return }
                let url = URL(fileURLWithPath: path)
                
                do {
                    player = try AVAudioPlayer(contentsOf: url)
                    player?.prepareToPlay()
                    player?.play()
                    player?.volume = 1.0
                } catch _ {
                }
                do {
                    try AVAudioSession.sharedInstance().setCategory(.playback)
                } catch(let error) {
                    print(error.localizedDescription)
            }
        }
                
        if seconds <= 2 {
            let headerRandom = translateArray.randomElement()
            header.text = headerRandom ?? "untitled"
            if header.text == "" {
                header.text = NSLocalizedString("t27", comment: "")
            }
        } else if seconds > 2 && seconds <= 3 {
            let headerRandom = translateArray.randomElement()
            header.text = headerRandom ?? "untitled"
            
            header.text = headerRandom ?? "untitled"
            if header.text == "" {
                header.text = NSLocalizedString("t3", comment: "")
            }
            
        } else if seconds > 3 {
            let headerRandom = translateArray.randomElement()
            header.text = headerRandom ?? "untitled"
            
            header.text = headerRandom ?? "untitled"
            if header.text == "" {
                header.text = NSLocalizedString("t3", comment: "")
            }
        }
    }
}
