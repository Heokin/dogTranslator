//
//  SecondOnBoarding.swift
//  dogTranslator
//
//  Created by Stas Dashkevich on 21.12.22.
//

import Foundation
import UIKit

class SecondOnBoarding: UICollectionViewCell {

    public static var id = "second"
    var wid = UIScreen.main.bounds.height / 16.9 + 16 + 64

    let local = LocalizationVariables()
    
    lazy var background = ImageView(style: .secondSlideBG)
    lazy var labelFirst = Label(style: .semibold38, "Express Emotions")
    lazy var labelSecond = Label(style: .semibold38, "with Sounds")
    lazy var reasoneBackground = ImageView(style: .secondSlideImage)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SecondOnBoarding {
    
    func setup() {
        backgroundColor = .white
        addSubview(background)
        addSubview(labelFirst)
        addSubview(labelSecond)
        addSubview(reasoneBackground)
        
        labelSecond.textColor = UIColor(named: "green78")
        labelFirst.textColor = UIColor(named: "browndd")
        
        background.snp.makeConstraints { make in
            make.left.right.top.bottom.equalToSuperview()
        }
        
        reasoneBackground.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(130)
            make.left.right.equalToSuperview()
        }
        
        labelFirst.snp.makeConstraints { make in
            make.top.equalTo(reasoneBackground.snp.bottom).offset(72)
            make.centerX.equalToSuperview()
        }
        labelSecond.snp.makeConstraints { make in
            make.top.equalTo(labelFirst.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
    }
}
