//
//  SettingTableViewCell.swift
//  dogTranslator
//
//  Created by Stas Dashkevich on 15.12.22.
//

import Foundation
import UIKit

class TableViewCell: UITableViewCell {
    
    var image: ImageView?
    var label: Label?
    var chevron: ImageView?
    var bgViewImage = View(style: .settingView)
    public var whiteView = View(style: .clearView)
    
    init(id: String, image: ImageView, label: Label, chevron: ImageView) {
        super.init(style: .default, reuseIdentifier: id)
        self.label = label
        self.image = image
        self.chevron = chevron
        
        image.contentMode = .scaleAspectFit
//        image.layer.opacity = 1.0
        backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        image.translatesAutoresizingMaskIntoConstraints = false
        chevron.tintColor = UIColor(named: "grayCell")
        self.chevron?.translatesAutoresizingMaskIntoConstraints = false
        self.chevron?.tintColor = .red
        
        let selectedView = UIView()
        selectedView.backgroundColor = .clear
        selectedBackgroundView = selectedView
        bgViewImage.backgroundColor = .white
        
        addSubview(label)
        addSubview(chevron)
        addSubview(whiteView)
        whiteView.addSubview(bgViewImage)
        whiteView.backgroundColor = .white.withAlphaComponent(1.0)
        whiteView.bringSubviewToFront(bgViewImage)
        bgViewImage.addSubview(image)

        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TableViewCell {
    
    func setup() {
        NSLayoutConstraint.activate([
            self.whiteView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            self.whiteView.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            self.bgViewImage.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor),
            self.bgViewImage.centerYAnchor.constraint(equalTo: whiteView.centerYAnchor),
            
            self.image!.centerYAnchor.constraint(equalTo: bgViewImage.centerYAnchor),
            self.image!.centerXAnchor.constraint(equalTo: bgViewImage.centerXAnchor),
            
            self.label!.leadingAnchor.constraint(equalTo: image!.trailingAnchor, constant: 15),
            self.label!.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            self.chevron!.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            self.chevron!.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
