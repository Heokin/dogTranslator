//
//  FAQController.swift
//  dogTranslator
//
//  Created by Stas Dashkevich on 27.12.22.
//

import Foundation
import UIKit
import SnapKit

class FAQController: UIViewController {
    
    var l = LocalizationVariables()
    lazy var textView: UITextView = {
        let tf = UITextView()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.backgroundColor = .white
        tf.text = l.settingFaq
        tf.textColor = UIColor(named: "grey9f")
        tf.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        tf.textAlignment = .left
        tf.backgroundColor = .white
        return tf
    }()
    
    lazy var gesture = UITapGestureRecognizer(target: self, action: #selector(dismistoSetting))
    lazy var image = ImageView(style: .faqImage)
    lazy var header = Label(style: .navigationHeader, NSLocalizedString("settingFAQ", comment: ""))
    lazy var imageHeader = Label(style: .semibold22, NSLocalizedString("faq1", comment: ""))
    lazy var settingLabel = Label(style: .regular17, NSLocalizedString("titleSetting", comment: ""))
    lazy var chevron = ImageView(style: .chev)
    lazy var dismisView = View(style: .clearView)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

extension FAQController {
    
    @objc func dismistoSetting() {
        dismiss(animated: true)
    }
    
    func setupUI() {
        
        if Locale.current.languageCode == "ru" {
            settingLabel.text = "Назад"
        }
        if Locale.current.languageCode == "vi" {
            settingLabel.text = "Hủy"
        }
        
        if Locale.current.languageCode == "es" {
            settingLabel.text = "Atrás"
        }
        
        dismisView.addGestureRecognizer(gesture)
        view.backgroundColor = .white
        view.addSubview(header)
        view.addSubview(image)
        view.addSubview(textView)
        view.addSubview(imageHeader)
        view.addSubview(dismisView)
        dismisView.addSubview(chevron)
        dismisView.addSubview(settingLabel)
        
        header.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(30)
            make.centerX.equalToSuperview()
        }
        
        image.snp.makeConstraints { make in
            make.top.equalTo(header.snp.bottom).offset(14)
            make.left.right.equalToSuperview()
            make.height.equalTo(250)
        }
        
        imageHeader.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(30)
            make.top.equalTo(image.snp.bottom).offset(32)
        }
        
        textView.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(16)
            make.top.equalTo(imageHeader.snp.bottom).offset(16)
            make.bottom.equalToSuperview()
        }
        
        dismisView.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.top.equalToSuperview().offset(22)
            make.height.equalTo(40)
            make.width.equalTo(140)
        }
        
        chevron.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(18)
            make.centerY.equalToSuperview().inset(10)
            make.height.equalTo(25)
            make.width.equalTo(30)
        }
        
        settingLabel.snp.makeConstraints { make in
            make.left.equalTo(chevron.snp.right)
            make.centerY.equalToSuperview().inset(9)
            make.width.equalTo(200)
        }
    }
}
