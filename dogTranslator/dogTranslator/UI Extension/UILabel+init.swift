//
//  UILabel+extension.swift
//  dogTranslator
//
//  Created by Stas Dashkevich on 10.12.22.
//

import Foundation
import UIKit

class Label: UILabel {
    
    enum Style {
        
        case semi17
        case semi171line
        case navigationHeader
        case medium18
        case holdBeer
        case semibold22
        case paw
        case semibold38
        case medium22
        case semibold30
        case setting
        case regular17
        case semibold24
        
        case subGreen
        case subReason
    }
    
    init(style: Style, _ text: String?) {
        super.init(frame: .zero)
        
        self.text = text
        translatesAutoresizingMaskIntoConstraints = false
        textAlignment = .center
        
        switch style {
            
        case .navigationHeader:
            font = UIFont.rounded(ofSize: 20, weight: .semibold)
            textColor = UIColor(named: "black3")
            
        case .medium18:
            font = UIFont.rounded(ofSize: 14, weight: .medium)
            textColor = UIColor(named: "grey9f")
            
        case .semibold22:
            font = UIFont.rounded(ofSize: 20, weight: .semibold)
            numberOfLines = 2
            
        case .semibold30:
            font = UIFont.rounded(ofSize: 27, weight: .semibold)
            textColor = UIColor(named: "black3")
            numberOfLines = 8
            
        case .setting:
            font = UIFont.rounded(ofSize: 17, weight: .medium)
            textColor = UIColor(named: "black3")
            
        case .subGreen:
            textColor = UIColor(named: "green78")
            textAlignment = .center
            font = UIFont.rounded(ofSize: 36, weight: .semibold)
            numberOfLines = 0
            
        case .subReason:
            textColor = UIColor(named: "black3")
            textAlignment = .center
            font = UIFont.rounded(ofSize: 24, weight: .medium)
        case .medium22:
            font = UIFont.rounded(ofSize: 20, weight: .medium)
            textAlignment = .left
            textColor = UIColor(named: "black3")
            numberOfLines = 0
            
        case .semibold38:
            font = UIFont.rounded(ofSize: 33, weight: .bold)
            textAlignment = .center
            numberOfLines = 0
            
        case .regular17:
            font = UIFont.rounded(ofSize: 17, weight: .regular)
            textAlignment = .left
            textColor = UIColor(named: "green78")
            
        case .holdBeer:
            font = UIFont.rounded(ofSize: 16, weight: .medium)
            textColor = UIColor(named: "grey9f")
            numberOfLines = 0
        case .paw:
            font = UIFont.rounded(ofSize: 20, weight: .semibold)
            numberOfLines = 2
            textColor = UIColor(named: "cardGreen")
     
        case .semi17:
            font = UIFont.rounded(ofSize: 17, weight: .medium)
            numberOfLines = 3
            textColor = UIColor(named: "black3")
            textAlignment = .left
        case .semi171line:
            font = UIFont.rounded(ofSize: 22, weight: .medium)
            numberOfLines = 2
            textColor = UIColor(named: "black3")
            textAlignment = .center
        case .semibold24:
            font = UIFont.rounded(ofSize: 24, weight: .semibold)
            numberOfLines = 1
            textColor = UIColor(named: "green78")
            textAlignment = .center
            isHidden = true
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
