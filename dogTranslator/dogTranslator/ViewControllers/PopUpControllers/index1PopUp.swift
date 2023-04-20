
import Foundation
import UIKit
import SnapKit
import Lottie
import AVFAudio

class PopUpDogResultControllerIndex1: UIViewController {

    lazy var header = Label(style: .semibold30, "Woof! Woof!")
    lazy var background = ImageView(style: .mainBackgroundImage)
    var counterForLimit = UserDefaults.standard.value(forKey: "counterLimit") as! Int
    var player: AVAudioPlayer?
    var seconds: Double = 0.0
    var selectedIndex: Int?
    
    var voice1Array = ["110", "111", "112", "113", "114", "115", "116", "117", "118", "119"]
    var voice2Array = ["120", "121", "122", "123", "125", "126", "128", "129"]
    var voice3Array = [ "32","35", "36", "38", "39"]
    var voice4Array = ["40", "41", "42", "43", "44", "45", "46"]
    var voice5Array = ["50", "51", "52", "53", "58"]
    
    var header2Array = ["header2", "header2-1"]
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
        
        for number in 1..<46 {
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
        
        Timer.scheduledTimer(withTimeInterval: 4, repeats: false) { Timer in
            self.dismiss(animated: false)
        }
                
        counterForLimit += 1
        UserDefaults.standard.set(counterForLimit, forKey: "counterLimit")
    }
}

extension PopUpDogResultControllerIndex1 {
    
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
            make.centerY.equalToSuperview().offset(60)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(260)
        }
        
        header.snp.makeConstraints { make in
            make.bottom.equalTo(animationView.snp.top).offset(-42)
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
                
        if seconds <= 1 {
            let random = voice1Array.randomElement()
            do {
                        try  AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playAndRecord, options: [.defaultToSpeaker])
                    } catch(let error) {
                        print(error.localizedDescription)
                    }

            playStartSound(random ?? "111")

            header.text = NSLocalizedString("woof", comment: "")
            
        } else if seconds > 1 && seconds <= 2 {
            let random = voice2Array.randomElement()
            do {
                        try  AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playAndRecord, options: [.defaultToSpeaker])
                    } catch(let error) {
                        print(error.localizedDescription)
                    }

            playStartSound(random ?? "111")
            
            header.text = NSLocalizedString("woof2", comment: "")

        } else if seconds > 2 && seconds <= 3 {
            let random = voice3Array.randomElement()
            do {
                        try  AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playAndRecord, options: [.defaultToSpeaker])
                    } catch(let error) {
                        print(error.localizedDescription)
                    }

            playStartSound(random ?? "111")

            header.text = NSLocalizedString("woof3", comment: "")

        } else if seconds > 3 && seconds <= 4 {
            let random = voice4Array.randomElement()
            do {
                        try  AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playAndRecord, options: [.defaultToSpeaker])
                    } catch(let error) {
                        print(error.localizedDescription)
                    }

            playStartSound(random ?? "111")

            header.text = NSLocalizedString("woof4", comment: "")
        } else if seconds > 4 {
            let random = voice5Array.randomElement()
            do {
                        try  AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playAndRecord, options: [.defaultToSpeaker])
                    } catch(let error) {
                        print(error.localizedDescription)
                    }

            playStartSound(random ?? "111")

            header.text = NSLocalizedString("woof4", comment: "")
        }
    }
}
