//
//  BlogCell.swift
//  dogTranslator
//
//  Created by Stas Dashkevich on 12.04.23.
//

import Foundation
import UIKit
import SnapKit
import Lottie

class BlogCell: UICollectionViewCell {
    
    public var image = ImageView(style: .changeIcon)
    public var text = Label(style: .semi17, "JLFHSDILOJFHJKLSDHFKLSDHFKLDSHF:KLSDHFKL:SDHFKLSDHFK:LSDFHKL:H")
    public var chevronLock = ImageView(style: .chevron)
    static let id = "dogI"
    
    override init(frame: CGRect) {
         super.init(frame: frame)
         
         setUp()
    }
    
    public func setup(image: String, text: String, chevronLock: ImageView) {
        self.text.text = text
        self.image.image = UIImage(named: image)
    
    }
    
    func setUp() {
        contentView.backgroundColor = .white
        addSubview(image)
        addSubview(text)
        addSubview(chevronLock)
   
        text.textColor = UIColor(named: "black3")
        
        chevronLock.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-28)
            make.centerY.equalToSuperview()
            make.height.equalTo(16)
            make.width.equalTo(12)
        }
        text.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(image.snp.right).offset(8)
            make.right.equalTo(chevronLock.snp.left).offset(-8)
        }
        
        image.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(16)
            make.height.width.equalTo(48)
        }

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
