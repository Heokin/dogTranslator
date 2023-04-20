//
//  UIButton+extension.swift
//  dogTranslator
//
//  Created by Stas Dashkevich on 10.12.22.
//

import Foundation
import UIKit

class Button: UIButton {
    
    enum Style {
        
        case navigationSetting
        case navigationSubscribe
        case recordButton
        case humanIcon
        case dogIcon
        case whistleBackground
        case doneButton
        case closeButton
        
        case subscribeContinue
        case restoreButton
        
        case alertButton
    }
    
    init(style: Style, _ text: String?) {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        setTitle(text, for: .normal)
        sizeToFit()
        
        switch style {
            
        case .navigationSetting:
            setImage(UIImage(systemName: "crown"), for: .normal)
            tintColor = .white
            
        case .navigationSubscribe:
            setImage(UIImage(systemName: "gearshape"), for: .normal)
            tintColor = .white
            
        case .recordButton:
            setImage(UIImage(named: "green"), for: .normal)
            showsTouchWhenHighlighted = true
            
        case .humanIcon:
            setImage(UIImage(named: "person"), for: .normal)
            contentVerticalAlignment = .fill
            contentHorizontalAlignment = .fill
            
        case .dogIcon:
            setImage(UIImage(named: "dogButton"), for: .normal)
            contentVerticalAlignment = .fill
            contentHorizontalAlignment = .fill
            
        case .whistleBackground:
            setImage(UIImage(named: "whistleBackground"), for: .normal)
            showsTouchWhenHighlighted = true
            
        case .doneButton:
            setTitleColor(UIColor(named: "green78"), for: .normal)
            setTitle(text, for: .normal)
            titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .medium)
            
        case .closeButton:
            backgroundColor = .clear
            
        case .subscribeContinue:
            setTitle(text, for: .normal)
            setTitleColor(UIColor(named: "black3"), for: .normal)
            backgroundColor = UIColor(named: "green78")
            layer.cornerRadius = 15
            titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
            layer.borderWidth = 2.0
            layer.borderColor = UIColor.black.cgColor
            
        case .restoreButton:
            setTitle(text, for: .normal)
            setTitleColor(.white, for: .normal)
            backgroundColor = .clear
        case .alertButton:
            setTitle(text, for: .normal)
                        setTitleColor(UIColor(red: 0, green: 0.591, blue: 0.917, alpha: 1), for: .normal)
                        titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
                        backgroundColor = .clear
        }
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
