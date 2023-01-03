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
        
        case navigationHeader
        case medium18
        case semibold22
        case semibold38
        case medium22
        case semibold30
        case setting
        case regular17
        
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
            font = UIFont.systemFont(ofSize: 20, weight: .semibold)
            textColor = UIColor(named: "black3")
            
        case .medium18:
            font = UIFont.systemFont(ofSize: 18, weight: .medium)
            textColor = UIColor(named: "grey9f")
            
        case .semibold22:
            font = UIFont.systemFont(ofSize: 22, weight: .semibold)
            
        case .semibold30:
            font = UIFont.systemFont(ofSize: 30, weight: .semibold)
            textColor = UIColor(named: "black3")
            
        case .setting:
            font = UIFont.systemFont(ofSize: 17, weight: .semibold)
            textColor = UIColor(named: "black3")
            
        case .subGreen:
            textColor = UIColor(named: "green78")
            textAlignment = .center
            font = UIFont.systemFont(ofSize: 36, weight: .semibold)
            
        case .subReason:
            textColor = UIColor(named: "black3")
            textAlignment = .center
            font = UIFont.systemFont(ofSize: 24, weight: .medium)
        case .medium22:
            font = UIFont.systemFont(ofSize: 22, weight: .medium)
            textAlignment = .left
            textColor = UIColor(named: "black3")
            
        case .semibold38:
            font = UIFont.systemFont(ofSize: 38, weight: .semibold)
            textAlignment = .left
            
        case .regular17:
            font = UIFont.systemFont(ofSize: 17, weight: .regular)
            textAlignment = .left
            textColor = UIColor(named: "green78")
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
