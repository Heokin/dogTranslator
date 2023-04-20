//
//  CardCell.swift
//  dogTranslator
//
//  Created by Stas Dashkevich on 11.04.23.
//

import Foundation
import UIKit
import SnapKit

class CardCollectionViewCell: UICollectionViewCell {
    
    var backImageView: UIImageView!
    var frontImageView: UIImageView!
    var level = UserDefaults.standard.value(forKey: "Level") as? Int ?? 1
    var card : Card?
    static let id = "cardID"
    
    func setCard(_ card:Card) {
        
        contentView.layer.cornerRadius = 8
        contentView.backgroundColor = .white
        contentView.layer.borderWidth = 1
        
        self.card = card
        
        backImageView = UIImageView()
        frontImageView = UIImageView()
        
        backImageView.frame = contentView.bounds
        
        addSubview(frontImageView)
        addSubview(backImageView)
        
        frontImageView.translatesAutoresizingMaskIntoConstraints = true
        
        frontImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        if UIScreen.main.bounds.width > 500 {
            frontImageView.snp.makeConstraints { make in
                make.height.width.equalTo(100)
            }
        }
        
        frontImageView.image = UIImage(named:card.imageName)
        
        switch(level) {
        case 1:
            contentView.layer.borderColor = UIColor(named: "cardGreen")?.cgColor
            backImageView.image = UIImage(named: "cardFirstTourBack")
        case 2:
            contentView.layer.borderColor = UIColor(named: "cardBrown")?.cgColor
            backImageView.image = UIImage(named: "cardSecondTourBack")
        case 3:
            contentView.layer.borderColor = UIColor(named: "cardBlue")?.cgColor
            backImageView.image = UIImage(named: "cardThirdTourBack")
        default:
            backImageView.image = UIImage(named: "cardThirdTourBack")
        }
        
        if(card.isMatched == true)
        {
            backImageView.alpha = 0
            frontImageView.alpha = 0
            return
        }
        else{
            backImageView.alpha = 1
            frontImageView.alpha = 1
        }
        if(card.isFlipped == true)
        {
              UIView.transition(from: backImageView, to: frontImageView, duration: 0, options: [.transitionFlipFromLeft,.showHideTransitionViews], completion: nil)
        }
        else{
             UIView.transition(from: frontImageView, to: backImageView, duration: 0, options: [.transitionFlipFromRight,.showHideTransitionViews], completion: nil)
        }
        
    }
    
    func flipCard(){
        UIView.transition(from: backImageView, to: frontImageView, duration: 0.3, options: [.transitionFlipFromLeft,.showHideTransitionViews], completion: nil)
    }
    
    func flipback()  {
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {
             UIView.transition(from: self.frontImageView, to: self.backImageView, duration: 0.3, options: [.transitionFlipFromRight,.showHideTransitionViews], completion: nil)
        }
    }
    
    func remove() {
        
        backImageView.rotateCell()
        frontImageView.rotateCell()
        
        UIView.animate(withDuration: 0.8, delay: 0.8, options: .curveEaseOut, animations: {
            self.contentView.alpha = 0;
            self.frontImageView.alpha = 0;
            self.backImageView.alpha = 0;
        }, completion: nil)
       
    }
}

extension UIView{
    
    func rotate() {
        
        let rotation : CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotation.fromValue = NSNumber(value: -Double.pi + 2.5)
        rotation.toValue = NSNumber(value: 0.6)
        rotation.duration = 0.4
        rotation.autoreverses = true
        rotation.repeatCount = Float.infinity
        self.layer.add(rotation, forKey: "rotationAnimation")
        
        let delay : Double = 2.0    // 2 seconds here
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            self.layer.removeAllAnimations()
        }
    }
    
    func rotateLong() {
        
        
        let rotation : CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotation.fromValue = NSNumber(value: -Double.pi + 2.5)
        rotation.toValue = NSNumber(value: 0.6)
        rotation.duration = 0.4
        rotation.autoreverses = true
        rotation.repeatCount = Float.infinity
        self.layer.add(rotation, forKey: "rotationAnimation")
        
        let delay : Double = 4.0    // 2 seconds here
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            self.layer.removeAllAnimations()
        }
    }
    
    func rotateCell() {
        
        let rotation : CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotation.fromValue = NSNumber(value: -0.1)
        rotation.toValue = NSNumber(value: 0.1)
        rotation.duration = 0.4
        rotation.autoreverses = true
        rotation.repeatCount = Float.infinity
        self.layer.add(rotation, forKey: "rotationAnimation")
        
        let delay : Double = 1.0    // 2 seconds here
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            self.layer.removeAllAnimations()
        }
    
    }
}

