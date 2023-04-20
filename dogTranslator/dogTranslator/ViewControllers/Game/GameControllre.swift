//
//  GameControllre.swift
//  dogTranslator
//
//  Created by Stas Dashkevich on 11.04.23.
//

import UIKit
import SnapKit
import AVFAudio
import Lottie

class NewGameController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    var cardModel = CardModel()
    var cardArray = [Card]()
    var firstIndexFlippedPathIndex:IndexPath?
    
    var player : AVAudioPlayer?
    
    var collectionView: UICollectionView!
    
    var score = UserDefaults.standard.value(forKey: "score")
    
    var level = UserDefaults.standard.value(forKey: "Level") as? Int ?? 1
    
    var supportUD = "0"
    var counter = 0
    var reloadFlag = 0
    
    var cellHeight = UIScreen.main.bounds.height / 7.25
    var cellWidth = UIScreen.main.bounds.width / 4.6875
 
    
    let local = LocalizationVariables()
    lazy var navigationView = View(style: .clearView)
    lazy var navigationHeader = Label(style: .semibold22, NSLocalizedString("voiceButton", comment: ""))
    
    lazy var scoreHeaderLabel = Label(style: .semibold24, "Congratulations!")
    
    var imageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "backgroundSub")
            
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var scoreView = View(style: .clearView)
    lazy var scoreLabel = Label(style: .paw, score as? String)
    lazy var scoreImage = ImageView(style: .paw)
    
    // score
    
    lazy var scoreNav = Label(style: .semibold22, "Game")
        
    var lvlImage: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "backgroundSub")
            
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var scoreLottie: LottieAnimationView = {
            var animation = LottieAnimationView()
            animation = .init(name: "congrats")
            animation.animationSpeed = 1
            animation.loopMode = .loop
            animation.translatesAutoresizingMaskIntoConstraints = false
            animation.isUserInteractionEnabled = false
            return animation
        }()
    
    lazy var continueButton = Button(style: .subscribeContinue, NSLocalizedString("playAgainButton", comment: ""))
    lazy var levelScore = Label(style: .paw, score as? String)
    lazy var levelImage = ImageView(style: .paw)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
        didload()
        switch(level) {
        case 1:  cardArray = cardModel.getCard()
        case 2:  cardArray = cardModel.getCardSecond()
        case 3:  cardArray = cardModel.getCardThird()
        default: cardArray = cardModel.getCard()
        }
        
        cardArray.shuffle()

        setUpLogic()
        continueButton.isHidden = true
        scoreLottie.isHidden = true
        scoreHeaderLabel.isHidden = true
        level = UserDefaults.standard.value(forKey: "Level") as? Int ?? 1
        
        
        if UIScreen.main.bounds.height < 670 {
            cellHeight = 95
            cellWidth = 80
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .darkContent
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
    
}
