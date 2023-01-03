//
//  FirstSubViewControllerUI.swift
//  dogTranslator
//
//  Created by Stas Dashkevich on 21.12.22.
//

import Foundation
import UIKit

extension FirstSubscribeViewController {
    
    func setup() {
        
        view.backgroundColor = .white

        view.addSubview(bgImage)
        view.addSubview(imageHeader)
        view.backgroundColor = .white

        bgImage.snp.makeConstraints { make in
            make.left.right.bottom.top.equalToSuperview()
        }
        
        imageHeader.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(136)
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(unslockAllAccess)
        view.addSubview(firstSubLabel)
        view.addSubview(secondSubLabel)
        
        unslockAllAccess.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(imageHeader.snp.bottom).offset(5)
        }
        
        firstSubLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(unslockAllAccess.snp.bottom).offset(24)
        }
        
        secondSubLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(firstSubLabel.snp.bottom).offset(24)
        }
        
        //MARK: add Subview
                
        view.addSubview(restoreView)
        view.addSubview(restoreLabel)
        view.addSubview(dismissView)
        view.addSubview(xmark)
        
        view.addSubview(firstSubView)
        firstSubView.addSubview(firstSubPlace)
        firstSubView.addSubview(firstTopLabel!)
        firstSubView.addSubview(firstBottomLabel!)
        firstSubView.addSubview(firstImage)
        
        
        view.addSubview(secondSubView)
        secondSubView.addSubview(secondSubPlace)
        secondSubView.addSubview(secondTopLabel!)
        secondSubView.addSubview(secondBottomLabel!)
        secondSubView.addSubview(secondImage)
        
        
        view.addSubview(thirdSubView)
        thirdSubView.addSubview(thirdSubPlace)
        thirdSubView.addSubview(thirdTopLabel!)
        thirdSubView.addSubview(thirdBottomLabel!)
        thirdSubView.addSubview(thirdImage)
        
        
        view.addSubview(firstSelectedSubView)
        firstSelectedSubView.addSubview(firstSelectedSubPlace)
        firstSelectedSubView.addSubview(firstSelectedTopLabel!)
        firstSelectedSubView.addSubview(firstSelectedBottomLabel!)
        firstSelectedSubView.addSubview(firstImageSub)
        
        
        view.addSubview(secondSelectedSubView)
        secondSelectedSubView.addSubview(secondSelectedSubPlace)
        secondSelectedSubView.addSubview(secondSelectedTopLabel!)
        secondSelectedSubView.addSubview(secondSelectedBottomLabel!)
        secondSelectedSubView.addSubview(secondImageSub)
        
        
        view.addSubview(thirdSelectedSubView)
        thirdSelectedSubView.addSubview(thirdSelectedSubPlace)
        thirdSelectedSubView.addSubview(thirdSelectedTopLabel!)
        thirdSelectedSubView.addSubview(thirdSelectedBottomLabel!)
        thirdSelectedSubView.addSubview(thirdImageSub)
        
        
        firstSelectedSubView.isHidden = true
        firstSelectedTopLabel!.isHidden = true
        firstSelectedBottomLabel!.isHidden = true
        
        secondSubView.isHidden = true
        
        thirdSelectedSubView.isHidden = true
        thirdSelectedTopLabel!.isHidden = true
        thirdSelectedBottomLabel!.isHidden = true
        
        //mainImage.image = UIImage(named: "subImg")
        
        view.addSubview(continueButton)
        
        //MARK: Add target
        firstSubView.addGestureRecognizer(recognizeFirst)
        secondSubView.addGestureRecognizer(recognizeSecond)
        thirdSubView.addGestureRecognizer(recognizeThird)
        dismissView.addGestureRecognizer(dismissTap)
        restoreView.addGestureRecognizer(restoreTap)
        
        continueButton.addTarget(self, action: #selector(sub), for: .touchUpInside)
        continueButton.addTarget(self, action: #selector(fingerTapGrad), for: .touchDown)
        continueButton.addTarget(self, action: #selector(defaultButtonGradState), for: .touchUpInside)
        
     
        
        view.addSubview(spiner)
        
        spiner.color = .white
        spiner.translatesAutoresizingMaskIntoConstraints = false
        
    
        
        //MARK: Add constraint
        let constraint = [
            
            spiner.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            spiner.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            continueButton.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 16.9),
            continueButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            continueButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            continueButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            
      
            
//            imageViewTop.topAnchor.constraint(equalTo: view.topAnchor),
//            imageViewTop.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            imageViewTop.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            imageViewTop.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            restoreView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 19),
            restoreView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            
            restoreLabel.centerYAnchor.constraint(equalTo: restoreView.centerYAnchor),
            restoreLabel.leadingAnchor.constraint(equalTo: restoreView.leadingAnchor, constant: 15),
            
            dismissView.centerYAnchor.constraint(equalTo: restoreView.centerYAnchor),
            dismissView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            xmark.centerYAnchor.constraint(equalTo: dismissView.centerYAnchor),
            xmark.trailingAnchor.constraint(equalTo: dismissView.trailingAnchor, constant: -15),

        ]
        
        let constraintDefault = [

            
            firstSubView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -UIScreen.main.bounds.height / 4.5363),
            firstSubView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            firstSubView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 6.1984),
            firstSubView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3.7128),
            
            firstSubPlace.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 12.3969),
            firstSubPlace.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3.7128),
            
            firstImage.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 12.3969),
            firstImage.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3.7128),
            
            firstTopLabel!.heightAnchor.constraint(equalTo: firstSubView.heightAnchor, multiplier: 0.5),
            firstTopLabel!.centerXAnchor.constraint(equalTo: firstSubView.centerXAnchor),
            firstTopLabel!.widthAnchor.constraint(equalTo: firstSubView.widthAnchor),
            
            firstBottomLabel!.heightAnchor.constraint(equalTo: firstSubView.heightAnchor, multiplier: 1.5),
            firstBottomLabel!.centerXAnchor.constraint(equalTo: firstSubView.centerXAnchor),
            firstBottomLabel!.widthAnchor.constraint(equalTo: firstSubView.widthAnchor),
            
            
            firstSelectedSubView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -UIScreen.main.bounds.height / 4.9512),            firstSelectedSubView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            firstSelectedSubView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 5.075),
            firstSelectedSubView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2.9762),
            
            firstSelectedTopLabel!.heightAnchor.constraint(equalTo: firstSelectedSubView.heightAnchor, multiplier: 0.5),
            firstSelectedTopLabel!.centerXAnchor.constraint(equalTo: firstSelectedSubView.centerXAnchor),
            firstSelectedTopLabel!.centerYAnchor.constraint(equalTo: firstSelectedSubPlace.centerYAnchor),
            firstSelectedTopLabel!.widthAnchor.constraint(equalTo: firstSelectedSubView.widthAnchor),
            
            firstSelectedBottomLabel!.heightAnchor.constraint(equalTo: firstSelectedSubView.heightAnchor, multiplier: 1.4),
            firstSelectedBottomLabel!.centerXAnchor.constraint(equalTo: firstSelectedSubView.centerXAnchor),
            firstSelectedBottomLabel!.widthAnchor.constraint(equalTo: firstSelectedSubView.widthAnchor),
            
            firstSelectedSubPlace.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 11.6),
            firstSelectedSubPlace.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2.9762),
            
            firstImageSub.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 11.6),
            firstImageSub.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2.9762),
            
            secondSubView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -UIScreen.main.bounds.height / 4.5363),
            secondSubView.leadingAnchor.constraint(equalTo: firstSubView.trailingAnchor, constant: 8),
            secondSubView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 6.1984),
            secondSubView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3.7128),
            
            
            secondTopLabel!.heightAnchor.constraint(equalTo: secondSubView.heightAnchor, multiplier: 0.5),
            secondTopLabel!.centerXAnchor.constraint(equalTo: secondSubView.centerXAnchor),
            secondTopLabel!.widthAnchor.constraint(equalTo: secondSubView.widthAnchor),
            
            secondBottomLabel!.heightAnchor.constraint(equalTo: secondSubView.heightAnchor, multiplier: 1.5),
            secondBottomLabel!.centerXAnchor.constraint(equalTo: secondSubView.centerXAnchor),
            secondBottomLabel!.widthAnchor.constraint(equalTo: secondSubView.widthAnchor),
            
            secondSubPlace.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 12.3969),
            secondSubPlace.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3.7128),
            
            secondImage.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 12.3969),
            secondImage.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3.7128),
            
            secondSelectedSubView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -UIScreen.main.bounds.height / 4.9512),
            secondSelectedSubView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            secondSelectedSubView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 5.075),
            secondSelectedSubView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2.9762),
            
            secondSelectedTopLabel!.heightAnchor.constraint(equalTo: secondSelectedSubView.heightAnchor, multiplier: 0.5),
            secondSelectedTopLabel!.centerYAnchor.constraint(equalTo: firstSelectedSubPlace.centerYAnchor),
            secondSelectedTopLabel!.centerXAnchor.constraint(equalTo: secondSelectedSubView.centerXAnchor),
            secondSelectedTopLabel!.widthAnchor.constraint(equalTo: secondSelectedSubView.widthAnchor),
            
            secondSelectedBottomLabel!.heightAnchor.constraint(equalTo: secondSelectedSubView.heightAnchor, multiplier: 1.4),
            secondSelectedBottomLabel!.centerXAnchor.constraint(equalTo: secondSelectedSubView.centerXAnchor),
            secondSelectedBottomLabel!.widthAnchor.constraint(equalTo: secondSelectedSubView.widthAnchor),
            
            secondSelectedSubPlace.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 11.6),
            secondSelectedSubPlace.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2.9762),
            
            secondImageSub.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 11.6),
            secondImageSub.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2.9762),
         
            thirdSubView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -UIScreen.main.bounds.height / 4.5363),
            thirdSubView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            thirdSubView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 6.1984),
            thirdSubView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3.7128),
            
            thirdTopLabel!.heightAnchor.constraint(equalTo: thirdSubView.heightAnchor, multiplier: 0.5),
            thirdTopLabel!.centerXAnchor.constraint(equalTo: thirdSubView.centerXAnchor),
            thirdTopLabel!.widthAnchor.constraint(equalTo: thirdSubView.widthAnchor),
            
            thirdBottomLabel!.heightAnchor.constraint(equalTo: thirdSubView.heightAnchor, multiplier: 1.5),
            thirdBottomLabel!.centerXAnchor.constraint(equalTo: thirdSubView.centerXAnchor),
            thirdBottomLabel!.widthAnchor.constraint(equalTo: thirdSubView.widthAnchor),
            
            thirdSubPlace.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 12.3969),
            thirdSubPlace.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3.7128),
            
            thirdImage.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 12.3969),
            thirdImage.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3.7128),
            
            thirdSelectedSubView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -UIScreen.main.bounds.height / 4.9512),
            thirdSelectedSubView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            thirdSelectedSubView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 5.075),
            thirdSelectedSubView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2.9762),
            
            thirdSelectedSubPlace.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 11.6),
            thirdSelectedSubPlace.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2.9762),
            
            thirdImageSub.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 11.6),
            thirdImageSub.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2.9762),
            
            thirdSelectedTopLabel!.heightAnchor.constraint(equalTo: thirdSelectedSubView.heightAnchor, multiplier: 0.5),
            thirdSelectedTopLabel!.centerXAnchor.constraint(equalTo: thirdSelectedSubView.centerXAnchor),
            thirdSelectedTopLabel!.widthAnchor.constraint(equalTo: thirdSelectedSubView.widthAnchor),
            thirdSelectedTopLabel!.centerYAnchor.constraint(equalTo: thirdSelectedSubPlace.centerYAnchor),
            
            thirdSelectedBottomLabel!.heightAnchor.constraint(equalTo: thirdSelectedSubView.heightAnchor, multiplier: 1.4),
            thirdSelectedBottomLabel!.centerXAnchor.constraint(equalTo: thirdSelectedSubView.centerXAnchor),
            thirdSelectedBottomLabel!.widthAnchor.constraint(equalTo: thirdSelectedSubView.widthAnchor),

        ]
        
        let constraintSmall = [
            
            
            firstSubView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -UIScreen.main.bounds.height / 6.5363),
            firstSubView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            firstSubView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 5.5),
            firstSubView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3.7128),
            
            firstSubPlace.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 11),
            firstSubPlace.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3.7128),
            
            firstTopLabel!.heightAnchor.constraint(equalTo: firstSubView.heightAnchor, multiplier: 0.5),
            firstTopLabel!.centerXAnchor.constraint(equalTo: firstSubView.centerXAnchor),
            firstTopLabel!.widthAnchor.constraint(equalTo: firstSubView.widthAnchor),
            
            firstBottomLabel!.heightAnchor.constraint(equalTo: firstSubView.heightAnchor, multiplier: 1.5),
            firstBottomLabel!.centerXAnchor.constraint(equalTo: firstSubView.centerXAnchor),
            firstBottomLabel!.widthAnchor.constraint(equalTo: firstSubView.widthAnchor),
            
            
            firstSelectedSubView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -UIScreen.main.bounds.height / 6.9512),            firstSelectedSubView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            firstSelectedSubView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 4.8),
            firstSelectedSubView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2.9762),
            
            firstSelectedTopLabel!.heightAnchor.constraint(equalTo: firstSelectedSubView.heightAnchor, multiplier: 0.5),
            firstSelectedTopLabel!.centerXAnchor.constraint(equalTo: firstSelectedSubView.centerXAnchor),
            firstSelectedTopLabel!.centerYAnchor.constraint(equalTo: firstSelectedSubPlace.centerYAnchor),
            firstSelectedTopLabel!.widthAnchor.constraint(equalTo: firstSelectedSubView.widthAnchor),
            
            firstSelectedBottomLabel!.heightAnchor.constraint(equalTo: firstSelectedSubView.heightAnchor, multiplier: 1.4),
            firstSelectedBottomLabel!.centerXAnchor.constraint(equalTo: firstSelectedSubView.centerXAnchor),
            firstSelectedBottomLabel!.widthAnchor.constraint(equalTo: firstSelectedSubView.widthAnchor),
            
            firstSelectedSubPlace.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 11.6),
            firstSelectedSubPlace.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2.9762),
            
            secondSubView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -UIScreen.main.bounds.height / 6.5363),
            secondSubView.leadingAnchor.constraint(equalTo: firstSubView.trailingAnchor, constant: 8),
            secondSubView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 5.5),
            secondSubView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3.7128),
            
            
            secondTopLabel!.heightAnchor.constraint(equalTo: secondSubView.heightAnchor, multiplier: 0.5),
            secondTopLabel!.centerXAnchor.constraint(equalTo: secondSubView.centerXAnchor),
            secondTopLabel!.widthAnchor.constraint(equalTo: secondSubView.widthAnchor),
            
            secondBottomLabel!.heightAnchor.constraint(equalTo: secondSubView.heightAnchor, multiplier: 1.5),
            secondBottomLabel!.centerXAnchor.constraint(equalTo: secondSubView.centerXAnchor),
            secondBottomLabel!.widthAnchor.constraint(equalTo: secondSubView.widthAnchor),
            
            secondSubPlace.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 11),
            secondSubPlace.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3.7128),
            
            secondSelectedSubView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -UIScreen.main.bounds.height / 6.9512),
            secondSelectedSubView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            secondSelectedSubView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 4.8),
            secondSelectedSubView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2.9762),
            
            secondSelectedTopLabel!.heightAnchor.constraint(equalTo: secondSelectedSubView.heightAnchor, multiplier: 0.5),
            secondSelectedTopLabel!.centerYAnchor.constraint(equalTo: firstSelectedSubPlace.centerYAnchor),
            secondSelectedTopLabel!.centerXAnchor.constraint(equalTo: secondSelectedSubView.centerXAnchor),
            secondSelectedTopLabel!.widthAnchor.constraint(equalTo: secondSelectedSubView.widthAnchor),
            
            secondSelectedBottomLabel!.heightAnchor.constraint(equalTo: secondSelectedSubView.heightAnchor, multiplier: 1.4),
            secondSelectedBottomLabel!.centerXAnchor.constraint(equalTo: secondSelectedSubView.centerXAnchor),
            secondSelectedBottomLabel!.widthAnchor.constraint(equalTo: secondSelectedSubView.widthAnchor),
            
            secondSelectedSubPlace.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 11.6),
            secondSelectedSubPlace.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2.9762),
            
         
            thirdSubView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -UIScreen.main.bounds.height / 6.5363),
            thirdSubView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            thirdSubView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 5.5),
            thirdSubView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3.7128),
            
            thirdTopLabel!.heightAnchor.constraint(equalTo: thirdSubView.heightAnchor, multiplier: 0.5),
            thirdTopLabel!.centerXAnchor.constraint(equalTo: thirdSubView.centerXAnchor),
            thirdTopLabel!.widthAnchor.constraint(equalTo: thirdSubView.widthAnchor),
            
            thirdBottomLabel!.heightAnchor.constraint(equalTo: thirdSubView.heightAnchor, multiplier: 1.5),
            thirdBottomLabel!.centerXAnchor.constraint(equalTo: thirdSubView.centerXAnchor),
            thirdBottomLabel!.widthAnchor.constraint(equalTo: thirdSubView.widthAnchor),
            
            thirdSubPlace.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 11),
            thirdSubPlace.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3.7128),
            
            thirdSelectedSubView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -UIScreen.main.bounds.height / 6.9512),
            thirdSelectedSubView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            thirdSelectedSubView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 4.8),
            thirdSelectedSubView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2.9762),
            
            thirdSelectedSubPlace.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 11.6),
            thirdSelectedSubPlace.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2.9762),
            
            
            thirdSelectedTopLabel!.heightAnchor.constraint(equalTo: thirdSelectedSubView.heightAnchor, multiplier: 0.5),
            thirdSelectedTopLabel!.centerXAnchor.constraint(equalTo: thirdSelectedSubView.centerXAnchor),
            thirdSelectedTopLabel!.widthAnchor.constraint(equalTo: thirdSelectedSubView.widthAnchor),
            thirdSelectedTopLabel!.centerYAnchor.constraint(equalTo: thirdSelectedSubPlace.centerYAnchor),
            
            thirdSelectedBottomLabel!.heightAnchor.constraint(equalTo: thirdSelectedSubView.heightAnchor, multiplier: 1.4),
            thirdSelectedBottomLabel!.centerXAnchor.constraint(equalTo: thirdSelectedSubView.centerXAnchor),
            thirdSelectedBottomLabel!.widthAnchor.constraint(equalTo: thirdSelectedSubView.widthAnchor),

        ]
        
        //MARK: Constraints
        NSLayoutConstraint.activate(constraint)
        if UIScreen.main.bounds.height < 668 {
            NSLayoutConstraint.activate(constraintSmall)
        } else {
            NSLayoutConstraint.activate(constraintDefault)
        }
    }

}
