//
//  DogCell.swift
//  dogTranslator
//
//  Created by Stas Dashkevich on 10.12.22.
//

import Foundation
import UIKit
import SnapKit
import Lottie

class DogCell: UICollectionViewCell {
    
    public var image = ImageView(style: .changeIcon)
    public var text = Label(style: .medium18, "")
    public var approach = false
    public var blurImageView = UIImageView()
    static let id = "dogID"
    var animationView: LottieAnimationView = {
        var animation = LottieAnimationView()
        animation = .init(name: "stars")
        animation.animationSpeed = 0.6
        animation.loopMode = .loop
        animation.translatesAutoresizingMaskIntoConstraints = false
        animation.isUserInteractionEnabled = false
        
        return animation
    }()
    
    override init(frame: CGRect) {
         super.init(frame: frame)
         
         setUp()
    }
    
    public func setup(image: String, text: String, approach: Bool) {
        self.text.text = text
        self.image.image = UIImage(named: image)
        self.blurImageView.image = UIImage(named: "lock" + text)
        
        if approach {
            self.text.isHidden = false
            self.image.isHidden = false
            self.blurImageView.isHidden = true
            self.animationView.isHidden = true
        } else {
            self.text.isHidden = true
            self.image.isHidden = true
            self.blurImageView.isHidden = false
            self.animationView.isHidden = false
        }
    }
    
    func setUp() {
        contentView.backgroundColor = #colorLiteral(red: 0.986459434, green: 0.9964066148, blue: 0.9833038449, alpha: 1)
        contentView.layer.borderWidth = 2
        contentView.layer.borderColor = UIColor.black.cgColor
        contentView.layer.cornerRadius = 8
        addSubview(image)
        addSubview(blurImageView)
        blurImageView.addSubview(animationView)
        addSubview(text)
        text.textColor = UIColor(named: "black3")
        
        text.snp.makeConstraints { make in
            make.bottom.equalTo(contentView).offset(-12)
            make.centerX.equalTo(contentView)
        }
        
        image.snp.makeConstraints { make in
            make.top.equalTo(12)
            make.left.right.equalTo(contentView).inset(16)
            make.bottom.equalTo(text.snp.top).offset(-8)
        }
        
        blurImageView.snp.makeConstraints { make in
            make.left.right.top.bottom.equalToSuperview()
        }
        
        animationView.snp.makeConstraints { make in
            make.left.right.top.bottom.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
