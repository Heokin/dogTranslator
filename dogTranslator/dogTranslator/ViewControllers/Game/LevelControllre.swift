////
////  LevelControllre.swift
////  dogTranslator
////
////  Created by Stas Dashkevich on 11.04.23.
////
//
//import Foundation
//import UIKit
//import Lottie
//
//class LevelController: UIViewController {
//    
//    lazy var activityViewController: UIActivityViewController? = nil
//    
//    let local = LocalizationVariables()
//    lazy var navigationHeader = Label(style: .semibold22, "Game")
//        
//    var imageView: UIImageView = {
//        let imageView = UIImageView(frame: .zero)
//        imageView.image = UIImage(named: "backgroundSub")
//            
//        imageView.contentMode = .scaleAspectFill
//        imageView.clipsToBounds = true
//        imageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height).isActive = true
//        imageView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        return imageView
//    }()
//    
//    var animationView: LottieAnimationView = {
//            var animation = LottieAnimationView()
//            animation = .init(name: "congrats")
//            animation.animationSpeed = 1
//            animation.loopMode = .loop
//            animation.translatesAutoresizingMaskIntoConstraints = false
//            animation.isUserInteractionEnabled = false
//            return animation
//        }()
//    
//    var score = UserDefaults.standard.value(forKey: "score")
//    lazy var continueButton = Button(style: .subscribeContinue, NSLocalizedString("subscribeSaveButton", comment: ""))
//    lazy var scoreLabel = Label(style: .paw, score as? String)
//    lazy var scoreImage = ImageView(style: .paw)
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        continueButton.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
//        view.backgroundColor = UIColor.white
//        view.addSubview(imageView)
//        view.addSubview(animationView)
//        view.addSubview(continueButton)
//        
//        animationView.snp.makeConstraints { make in
//            make.center.equalToSuperview()
//            make.height.equalTo(301)
//            make.width.equalTo(344)
//        }
//        continueButton.snp.makeConstraints { make in
//            make.left.right.equalToSuperview().inset(16)
//            make.height.equalTo(60)
//            make.bottom.equalToSuperview().offset(-105)
//        }
//        view.addSubview(scoreImage)
//        view.addSubview(scoreLabel)
//        view.addSubview(navigationHeader)
//        NSLayoutConstraint.activate([
//            
//            scoreImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 14),
//            scoreImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
//            
//            scoreLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 14),
//            scoreLabel.trailingAnchor.constraint(equalTo: scoreImage.leadingAnchor, constant: -8),
//            
//            navigationHeader.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 14),
//            navigationHeader.centerXAnchor.constraint(equalTo: view.centerXAnchor)
//        ])
//        
//        animationView.play()
//        
//    }
//    
//    @objc func handleNext(paramSander: Any){
//        if UserDefaults.standard.value(forKey: "Level") as? Int == 1 {
//            UserDefaults.standard.set(2, forKey: "Level")
//        } else if UserDefaults.standard.value(forKey: "Level") as? Int == 2 {
//            UserDefaults.standard.set(3, forKey: "Level")
//        } else {
//            UserDefaults.standard.set(1, forKey: "Level")
//        }
//
//        dismiss(animated: true)
//    }
//    
//    override var preferredStatusBarStyle: UIStatusBarStyle {
//        .darkContent
//    }
//    
//}
