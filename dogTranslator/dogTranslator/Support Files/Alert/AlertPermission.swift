//
//  AlertPermission.swift
//  dogTranslator
//
//  Created by Stas Dashkevich on 13.01.23.
//

import Foundation
import UIKit

class AlertPermission: UIViewController {
    
    lazy var activityViewController: UIActivityViewController? = nil
    
    let local = LocalizationVariables()
    
    lazy var header = LabelSub(type: .alertText, NSLocalizedString("alertMicrophonePermission", comment: ""), NSLocalizedString("alertPermissionDenied", comment: ""))
    lazy var viewBoard = UIView()
    lazy var img = ImageView(style: .subImageHeader)
    lazy var cancel = Button(style: .alertButton, NSLocalizedString("alertCancel", comment: ""))
    lazy var setting = Button(style: .alertButton, NSLocalizedString("titleSetting", comment: ""))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(viewBoard)
        
        view.backgroundColor = UIColor(red: 0.046, green: 0.046, blue: 0.046, alpha: 0.4)
        
        viewBoard.backgroundColor = UIColor(red: 0.949, green: 0.949, blue: 0.949, alpha: 0.8)
        img.image = UIImage(named: "mic")

        viewBoard.applyBlurEffect()
        viewBoard.translatesAutoresizingMaskIntoConstraints = false
        
        viewBoard.addSubview(header)
        viewBoard.addSubview(img)
        viewBoard.addSubview(setting)
        viewBoard.addSubview(cancel)
        header.numberOfLines = 0
        setting.addTopBorder(with: UIColor(red: 0.29, green: 0.294, blue: 0.306, alpha: 1), andWidth: 0.5)
        cancel.addTopBorder(with: UIColor(red: 0.29, green: 0.294, blue: 0.306, alpha: 1), andWidth: 0.5)
        setting.addLeftBorder(with: UIColor(red: 0.29, green: 0.294, blue: 0.306, alpha: 1), andWidth: 0.5)
       
        viewBoard.layer.masksToBounds = true
        viewBoard.layer.cornerRadius = 14
        
        cancel.addTarget(self, action: #selector(handleClose), for: .touchUpInside)
        setting.addTarget(self, action: #selector(handleSetting), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            
            viewBoard.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            viewBoard.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            viewBoard.heightAnchor.constraint(equalToConstant: 285),
            viewBoard.widthAnchor.constraint(equalToConstant: 270),
            
            img.topAnchor.constraint(equalTo: viewBoard.topAnchor, constant: 16),
            img.centerXAnchor.constraint(equalTo: viewBoard.centerXAnchor),
            img.widthAnchor.constraint(equalToConstant: 56),
            img.heightAnchor.constraint(equalToConstant: 56),
            
            header.topAnchor.constraint(equalTo: img.bottomAnchor, constant: 2),
            header.leadingAnchor.constraint(equalTo: viewBoard.leadingAnchor, constant: 10),
            header.trailingAnchor.constraint(equalTo: viewBoard.trailingAnchor, constant: -10),
            
            cancel.widthAnchor.constraint(equalToConstant: 135),
            cancel.heightAnchor.constraint(equalToConstant: 44),
            cancel.leadingAnchor.constraint(equalTo: viewBoard.leadingAnchor),
            cancel.bottomAnchor.constraint(equalTo: viewBoard.bottomAnchor),
            
            setting.widthAnchor.constraint(equalToConstant: 135),
            setting.heightAnchor.constraint(equalToConstant: 44),
            setting.trailingAnchor.constraint(equalTo: viewBoard.trailingAnchor),
            setting.bottomAnchor.constraint(equalTo: viewBoard.bottomAnchor),
        ])
        print(Locale.current.languageCode)
        if Locale.current.languageCode == "ar" || Locale.current.languageCode == "zh" {
            NSLayoutConstraint.activate([
       
            viewBoard.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            viewBoard.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            viewBoard.heightAnchor.constraint(equalToConstant: 225),
            viewBoard.widthAnchor.constraint(equalToConstant: 270),
            
            ])
        }
        
        if  Locale.current.languageCode == "en" {
            NSLayoutConstraint.activate([
       
            viewBoard.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            viewBoard.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            viewBoard.heightAnchor.constraint(equalToConstant: 245),
            viewBoard.widthAnchor.constraint(equalToConstant: 270),
            
            ])
        }
        
        if  Locale.current.languageCode == "vi" {
            NSLayoutConstraint.activate([
       
            viewBoard.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            viewBoard.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            viewBoard.heightAnchor.constraint(equalToConstant: 265),
            viewBoard.widthAnchor.constraint(equalToConstant: 270),
            
            ])
        }

        
        if  Locale.current.languageCode == "fr" {
            NSLayoutConstraint.activate([
       
            viewBoard.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            viewBoard.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            viewBoard.heightAnchor.constraint(equalToConstant: 265),
            viewBoard.widthAnchor.constraint(equalToConstant: 270),
            
            ])
        }
        
        if  Locale.current.languageCode == "de" {
            NSLayoutConstraint.activate([
       
            viewBoard.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            viewBoard.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            viewBoard.heightAnchor.constraint(equalToConstant: 245),
            viewBoard.widthAnchor.constraint(equalToConstant: 270),
            
            ])
        }
        
        if  Locale.current.languageCode == "ja" {
            NSLayoutConstraint.activate([
       
            viewBoard.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            viewBoard.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            viewBoard.heightAnchor.constraint(equalToConstant: 245),
            viewBoard.widthAnchor.constraint(equalToConstant: 270),
            
            ])
        }
        
        if  Locale.current.languageCode == "pt" {
            NSLayoutConstraint.activate([
       
            viewBoard.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            viewBoard.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            viewBoard.heightAnchor.constraint(equalToConstant: 245),
            viewBoard.widthAnchor.constraint(equalToConstant: 270),
            
            ])
        }
        
        if  Locale.current.languageCode == "tr" {
            NSLayoutConstraint.activate([
       
            viewBoard.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            viewBoard.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            viewBoard.heightAnchor.constraint(equalToConstant: 245),
            viewBoard.widthAnchor.constraint(equalToConstant: 270),
            
            ])
        }
        
        if  Locale.current.languageCode == "es" {
            NSLayoutConstraint.activate([
       
            viewBoard.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            viewBoard.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            viewBoard.heightAnchor.constraint(equalToConstant: 245),
            viewBoard.widthAnchor.constraint(equalToConstant: 270),
            
            ])
        }

        
        if  Locale.current.languageCode == "ko" {
            NSLayoutConstraint.activate([
       
            viewBoard.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            viewBoard.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            viewBoard.heightAnchor.constraint(equalToConstant: 225),
            viewBoard.widthAnchor.constraint(equalToConstant: 270),
            
            ])
        }

        
        if  Locale.current.languageCode == "it" {
            NSLayoutConstraint.activate([
       
            viewBoard.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            viewBoard.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            viewBoard.heightAnchor.constraint(equalToConstant: 245),
            viewBoard.widthAnchor.constraint(equalToConstant: 270),
            
            ])
        }

    }
    
    @objc func handleClose(paramSander: Any){
        dismiss(animated: false, completion: nil)
    }
    
    @objc func handleSetting(paramSander: Any){
        if let url = URL(string: UIApplication.openSettingsURLString) {
            UIApplication.shared.open(url, options: [:], completionHandler: { _ in
            })
        }
    }
}
