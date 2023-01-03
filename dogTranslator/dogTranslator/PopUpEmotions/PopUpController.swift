//
//  PopUpController.swift
//  dogTranslator
//
//  Created by Stas Dashkevich on 17.12.22.
//

import Foundation
import UIKit
import SnapKit

class PopUpController: UIViewController {
    
    public var image: UIImage?
    
    //lazy var header = Label(style: .navigationHeader, "Setting")
    lazy var closeView = View(style: .roundedView)
    lazy var backgroundBorder = View(style: .collectionPopUpBackgroundBorder)
    lazy var imageDog = ImageView(style: .emptyImage)
    lazy var closeButton = Button(style: .doneButton, "Done")
    lazy var houseImage = ImageView(style: .popUpImage)
    
    var sections = 6
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
    }
    
    func setUpUI() {
        
        view.addSubview(houseImage)
        view.addSubview(closeView)
        houseImage.addSubview(backgroundBorder)
        backgroundBorder.addSubview(imageDog)
        closeView.addSubview(closeButton)
        
        closeView.backgroundColor = UIColor(named: "dark-yellow")
        
        houseImage.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(337)
            make.width.equalTo(332)
        }
        
        closeView.snp.makeConstraints { make in
            make.top.equalTo(houseImage.snp.top).offset(25)
            make.right.equalTo(houseImage.snp.right).offset(-46)
        }
        
        closeButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        backgroundBorder.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-20)
            make.height.equalTo(88)
            make.width.equalTo(84)
        }
        
        imageDog.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        
    }
    
}
