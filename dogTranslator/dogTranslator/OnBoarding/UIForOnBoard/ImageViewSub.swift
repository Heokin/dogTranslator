//
//  ImageViewSub.swift
//  dogTranslator
//
//  Created by Stas Dashkevich on 21.12.22.
//

import Foundation
import UIKit

class ImageViewSub: UIImageView {
    
    enum TypeOfImage {
        case chevron
        case imageLiner
        case leftLiner
        case rightLiner
        case chevronRight
        case protractorOrange
        case protractorClear
        case ruler
        case rulerInc
        case camera
        case boardingBig
        case boardingSmall
        case chevronLeft
        case setting
        case crown
        case star
        case mail
        case doc
        case share
        case spokenText
        case vibro
        case sound
        case elips
        case nothing
        case infinity
        case xmark
    }
    
    init(image: TypeOfImage) {
        super.init(frame: .zero)
        contentMode = .scaleAspectFill
        translatesAutoresizingMaskIntoConstraints = false
        clipsToBounds = true
        
        switch image {
        case .nothing:
            self.image = nil
        case .elips:
            self.image = UIImage(named: "elips")
            widthAnchor.constraint(equalToConstant: 24).isActive = true
            heightAnchor.constraint(equalToConstant: 24).isActive = true
        case .xmark:
            self.image = UIImage(named: "xmark")
            tintColor = UIColor(named: "gray69")
            widthAnchor.constraint(equalToConstant: 14).isActive = true
            heightAnchor.constraint(equalToConstant: 14).isActive = true
        case .chevron:
            self.image = UIImage(systemName: "chevron.right")
            tintColor = UIColor(named: "orange")!
            widthAnchor.constraint(equalToConstant: 15).isActive = true
            heightAnchor.constraint(equalToConstant: 15).isActive = true
        case .imageLiner:
            self.image = UIImage(named: "ImageLiner")
            contentMode = .scaleAspectFill
        case .leftLiner:
            self.image = UIImage(named: "leftLiner")
            contentMode = .scaleAspectFill
        case .rightLiner:
            self.image = UIImage(named: "rightLiner")
            contentMode = .scaleAspectFill
        case .chevronRight:
            contentMode = .scaleAspectFill
            self.image = UIImage(systemName: "chevron.right")
            tintColor = UIColor(named: "orange")!
            widthAnchor.constraint(equalToConstant: 10).isActive = true
            heightAnchor.constraint(equalToConstant: 12).isActive = true
        case .protractorOrange:
            contentMode = .scaleAspectFit
            self.image = UIImage(named: "protractorOrange")
            heightAnchor.constraint(equalToConstant: 378).isActive = true
            widthAnchor.constraint(equalToConstant: 197).isActive = true
        case .protractorClear:
            contentMode = .scaleAspectFill
            self.image = UIImage(named: "protractorClear")
            heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 2.148).isActive = true
            widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 1.9).isActive = true
        case .ruler:
            contentMode = .scaleAspectFit
            self.image = UIImage(named: "rulerSm")?.withRenderingMode(.alwaysOriginal)
        case .rulerInc:
            contentMode = .scaleAspectFit
            self.image = UIImage(named: "rulerInc")?.withRenderingMode(.alwaysOriginal)
        case .boardingBig:
            self.image = UIImage(named: "mainSub")
            contentMode = .scaleAspectFit
        case .camera:
            self.image = UIImage(systemName: "camera.fill")
            tintColor = UIColor(named: "orange")
            widthAnchor.constraint(equalToConstant: 24).isActive = true
            heightAnchor.constraint(equalToConstant: 19).isActive = true
        case .setting:
            self.image = UIImage(named: "gearshape.fill")
            tintColor = UIColor(named: "orange")
            widthAnchor.constraint(equalToConstant: 20).isActive = true
            heightAnchor.constraint(equalToConstant: 20).isActive = true
        case .boardingSmall:
            self.image = UIImage(named: "camera.fill")
        case .chevronLeft:
            contentMode = .scaleAspectFill
            self.image = UIImage(systemName: "chevron.left")
            tintColor = UIColor(named: "orange")!
            widthAnchor.constraint(equalToConstant: 20).isActive = true
            heightAnchor.constraint(equalToConstant: 24).isActive = true
        case .crown:
            self.image = UIImage(named: "crown")
            tintColor = .black
            widthAnchor.constraint(equalToConstant: 18).isActive = true
            heightAnchor.constraint(equalToConstant: 14).isActive = true
        case .star:
            self.image = UIImage(named: "star")
            tintColor = .black
            widthAnchor.constraint(equalToConstant: 18).isActive = true
            heightAnchor.constraint(equalToConstant: 17).isActive = true
        case .mail:
            self.image = UIImage(named: "envelope")
            tintColor = .black
            widthAnchor.constraint(equalToConstant: 18).isActive = true
            heightAnchor.constraint(equalToConstant: 14).isActive = true
        case .doc:
            self.image = UIImage(named: "doc.text")
            tintColor = .black
            widthAnchor.constraint(equalToConstant: 14).isActive = true
            heightAnchor.constraint(equalToConstant: 18).isActive = true
        case .share:
            self.image = UIImage(named: "square.and.arrow.up")
            tintColor = .black
            widthAnchor.constraint(equalToConstant: 14).isActive = true
            heightAnchor.constraint(equalToConstant: 18).isActive = true
        case .spokenText:
            self.image = UIImage(systemName: "text.redaction")
            tintColor = .black
            widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 20.833).isActive = true
            heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 58).isActive = true
        case .sound:
            self.image = UIImage(named: "speaker.wave.3")
            tintColor = .black
            widthAnchor.constraint(equalToConstant: 18).isActive = true
            heightAnchor.constraint(equalToConstant: 14).isActive = true
        case .vibro:
            self.image = UIImage(named: "vibro")
            tintColor = .black
            widthAnchor.constraint(equalToConstant: 18).isActive = true
            heightAnchor.constraint(equalToConstant: 14).isActive = true
        case .infinity:
            self.image = UIImage(named: "infinity")
            tintColor = .white
            widthAnchor.constraint(equalToConstant: 26.75).isActive = true
            heightAnchor.constraint(equalToConstant: 12.35).isActive = true
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
