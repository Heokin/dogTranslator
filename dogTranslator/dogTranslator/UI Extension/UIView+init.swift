//
//  UIView+extension.swift
//  dogTranslator
//
//  Created by Stas Dashkevich on 10.12.22.
//

import Foundation
import UIKit

class View: UIView {
    let gradient = Gradient()

    enum Style {
        
        case navigationView
        case roundedView
        case roundedViewSetting
        case clearView
        case settingView
        
        case collectionPopUpBackgroundBorder
    }
    
    init(style: Style) {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        switch style {
            
        case .navigationView:
            backgroundColor = .clear
            
        case .roundedView:
            widthAnchor.constraint(equalToConstant: 32).isActive = true
            heightAnchor.constraint(equalToConstant: 32).isActive = true
            layer.cornerRadius = 16
            
        case .clearView:
            backgroundColor = .clear
            
        case .settingView:
            widthAnchor.constraint(equalToConstant: 35).isActive = true
            heightAnchor.constraint(equalToConstant: 35).isActive = true
            layer.cornerRadius = 10
            layer.masksToBounds = false
            gradient.setGradientBackground(view: self)
            
        case .collectionPopUpBackgroundBorder:
            layer.borderWidth = 2
            layer.borderColor = UIColor(named: "black3") as! CGColor
            backgroundColor = .white
            
        case .roundedViewSetting:
            widthAnchor.constraint(equalToConstant: 32).isActive = true
            heightAnchor.constraint(equalToConstant: 32).isActive = true
            layer.cornerRadius = 16
            backgroundColor = UIColor(named: "gray9f")
        }
        
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class Gradient {
    
    private let gradient: CAGradientLayer!
    
    public func setGradientBackground(view: UIView) {
        let backgroundLayer    = self.gradient
        backgroundLayer?.frame = CGRect(x: 0, y: 0, width: 340, height: 100)
        
        view.layer.insertSublayer(backgroundLayer!, at: 0)
    }
    
    init() {
        let topColor    = UIColor(named: "topGrad")!
        let bottomColor = UIColor(named: "bottomGrad")!
        
        self.gradient           = CAGradientLayer()
        self.gradient.colors    = [topColor, bottomColor]
        self.gradient.locations = [0.0, 1.0]
    }
    
}
