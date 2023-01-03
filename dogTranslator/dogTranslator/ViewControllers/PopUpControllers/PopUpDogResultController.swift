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

class PopUpDogResultController: UIViewController {

    lazy var header = Label(style: .semibold30, "I am hungry!")
    lazy var background = ImageView(style: .mainBackgroundImage)
    var counterForLimit = UserDefaults.standard.value(forKey: "counterLimit") as! Int
    var player: AVAudioPlayer?
    var seconds = 0
    
    var voice2Array = ["voice2", "voice2-1"]
    var voice3Array = ["voice3", "voice3-1"]
    var voice4Array = ["voice4", "voice4-1"]
    
    var header2Array = ["header2", "header2-1"]
    var header3Array = ["header3", "header3-1"]
    var header4Array = ["header4", "header4-1"]

    var animationView: LottieAnimationView = {
        var animation = LottieAnimationView()
        animation = .init(name: "dog")
        animation.animationSpeed = 0.6
        animation.loopMode = .loop
        animation.translatesAutoresizingMaskIntoConstraints = false
        animation.isUserInteractionEnabled = false
        
        return animation
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
        setup()
        animationView.play()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        Timer.scheduledTimer(withTimeInterval: 4, repeats: false) { Timer in
            self.dismiss(animated: false)
        }
                
        counterForLimit += 1
        UserDefaults.standard.set(counterForLimit, forKey: "counterLimit")
    }
}

extension PopUpDogResultController {
    
    func setUpUI() {
        
        view.backgroundColor = .white
        
        view.addSubview(animationView)
        view.addSubview(background)
        view.addSubview(header)
        
        background.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        animationView.snp.makeConstraints { make in
            make.centerY.equalToSuperview().offset(100)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(260)
        }
        
        header.snp.makeConstraints { make in
            make.bottom.equalTo(animationView.snp.top).offset(-32)
            make.centerX.equalToSuperview()
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
            let random = voice2Array.randomElement()
            let headerRandom = header2Array.randomElement()
            header.text = headerRandom ?? "untitled"
            playStartSound(random ?? "voice2")
        } else if seconds > 2 && seconds <= 3 {
            let random = voice3Array.randomElement()
            playStartSound(random ?? "voice3")
            let headerRandom = header3Array.randomElement()
            header.text = headerRandom ?? "untitled"
        } else if seconds > 3 {
            let random = voice4Array.randomElement()
            playStartSound(random ?? "voice4")
            let headerRandom = header4Array.randomElement()
            header.text = headerRandom ?? "untitled"
        }
    }
}

