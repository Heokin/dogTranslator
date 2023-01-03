//
//  ImageView+extension.swift
//  dogTranslator
//
//  Created by Stas Dashkevich on 10.12.22.
//

import Foundation
import UIKit

class ImageView: UIImageView {
    
    enum Style {
        case mainBackgroundImage
        case changeIcon
        case emptyImage
        case faqImage
        
        case star
        case envelope
        case lockShield
        case docText
        case squary
        case questions
        case chevron
        case settingSub
        
        case popUpImage
        case chev
        
        case firstSlideImage
        case secondSlideImage
        
        case firstSlideBG
        case secondSlideBG
        case subscribeSubView
        case subImageHeader
        case subMainBGImage
        
        case settingCrown
    }
    
    init(style: Style) {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        contentMode = .scaleAspectFit
        clipsToBounds = true
        
        switch style {
            
        case .subscribeSubView:
            self.image = UIImage(named: "")
            
        case .popUpImage:
            self.image = UIImage(named: "house")
            
        case .mainBackgroundImage:
            self.image = UIImage(named: "mainBG")
            
        case .changeIcon:
            self.image = UIImage(named: "changeIcon")?.withRenderingMode(.alwaysOriginal)
            
        case .emptyImage:
            translatesAutoresizingMaskIntoConstraints = false
            
        case .star:
            self.image = UIImage(systemName: "star")?.withRenderingMode(.alwaysOriginal).withTintColor(.white)
            tintColor = .white
        case .envelope:
            self.image = UIImage(systemName: "envelope")?.withRenderingMode(.alwaysOriginal).withTintColor(.white)
            tintColor = .white
        case .lockShield:
            self.image = UIImage(systemName: "lock.shield")?.withRenderingMode(.alwaysOriginal).withTintColor(.white)
            tintColor = .white
        case .docText:
            self.image = UIImage(systemName: "doc.text")?.withRenderingMode(.alwaysOriginal).withTintColor(.white)
            tintColor = .white
        case .squary:
            self.image = UIImage(systemName:"square.and.arrow.up")?.withRenderingMode(.alwaysOriginal).withTintColor(.white)
            tintColor = .white
        case .questions:
            self.image = UIImage(systemName: "questionmark.circle")?.withRenderingMode(.alwaysOriginal).withTintColor(.white)
            tintColor = .white
        case .chevron:
            self.image = UIImage(named: "chevron.right")
//            tintColor = .red
        case .settingSub:
            self.image = UIImage(named: "bg")?.withRenderingMode(.alwaysOriginal)
        case .firstSlideImage:
            self.image = UIImage(named: "obbgImage")
        case .secondSlideImage:
            self.image = UIImage(named: "obbgImage2")
        case .firstSlideBG:
            self.image = UIImage(named: "obbg1")
        case .secondSlideBG:
            self.image = UIImage(named: "obbg2")
        case .subImageHeader:
            self.image = UIImage(named: "subDog")
        case .subMainBGImage:
            self.image = UIImage(named: "subBGMain")
        case .settingCrown:
            self.image = UIImage(named: "crownSetting")
        case .faqImage:
            self.image = UIImage(named: "faq")
        case .chev:
            self.image = UIImage(named: "chev")

        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
