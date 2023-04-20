//
//  TabBarController.swift
//  dogTranslator
//
//  Created by Stas Dashkevich on 9.12.22.
//

import Foundation
import UIKit
import SnapKit

class TabBarController: UITabBarController {
    
    var select = 0
    override func viewDidLoad() {
        super.viewDidLoad()
//        selectedIndex = UserDefaults.standard.value(forKey: "index") as? Int ?? 0

        selectedIndex = select
        setup()
    }
}
