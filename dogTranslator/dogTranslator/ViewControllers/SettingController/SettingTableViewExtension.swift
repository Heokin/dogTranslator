//
//  SettingTableViewExtension.swift
//  dogTranslator
//
//  Created by Stas Dashkevich on 15.12.22.
//

import Foundation
import UIKit
import MessageUI

extension SettingController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = TableViewCell(id: "cell", image: ImageView(style: .star), label: Label(style: .navigationHeader, "123"), chevron: ImageView(style: .chevron))
        cell.selectionStyle = .none
        cell.selectedBackgroundView = .none
        
        switch indexPath.row {
        case 0:
            cell = TableViewCell(id: "cell", image: ImageView(style: .star), label: Label(style: .setting, NSLocalizedString("settingRateUs", comment: "")), chevron: ImageView(style: .chevron))
            cell.bgViewImage.backgroundColor = UIColor(named: "green")
        case 1:
            cell = TableViewCell(id: "cell", image: ImageView(style: .envelope), label: Label(style: .setting, NSLocalizedString("settingSupport", comment: "")), chevron: ImageView(style: .chevron))
            cell.bgViewImage.backgroundColor = UIColor(named: "red1")
        case 2:
            cell = TableViewCell(id: "cell", image: ImageView(style: .lockShield), label: Label(style: .setting, NSLocalizedString("settingPrivacyPolicy", comment: "")), chevron: ImageView(style: .chevron))
            cell.bgViewImage.backgroundColor = UIColor(named: "purple7f")
        case 3:
            cell = TableViewCell(id: "cell", image: ImageView(style: .docText), label: Label(style: .setting, NSLocalizedString("settingTermsOfUse", comment: "")), chevron: ImageView(style: .chevron))
            cell.bgViewImage.backgroundColor = UIColor(named: "yellowed")
        case 4:
            cell = TableViewCell(id: "cell", image: ImageView(style: .squary), label: Label(style: .setting, NSLocalizedString("settingShareTheApp", comment: "")), chevron: ImageView(style: .chevron))
            cell.bgViewImage.backgroundColor = UIColor(named: "bluead")
        case 5:
            cell = TableViewCell(id: "cell", image: ImageView(style: .questions), label: Label(style: .setting, NSLocalizedString("settingFAQ", comment: "")), chevron: ImageView(style: .chevron))
            cell.bgViewImage.backgroundColor = UIColor(named: "browndd")
            cell.separatorInset = UIEdgeInsets(top: 0, left: tableView.bounds.size.width, bottom: 0, right: 0)

        default:
            print("")
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        switch indexPath.row {
        case 0:
            rateApp()
        case 1:
            if MFMailComposeViewController.canSendMail() {
                let mail = MFMailComposeViewController()
                mail.mailComposeDelegate = self
                let systemVersion = UIDevice.current.systemVersion
                let devicename = UIDevice.modelName
                let buildNumber: String = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as! String
                let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
                mail.setToRecipients(["support@mindateq.io"])
                mail.setSubject("Dog Games — User Question ")
                mail.setMessageBody("<p>\(systemVersion) \(devicename)<p>build Number -  \(appVersion!) (\(buildNumber))</p> </p>", isHTML: true)
                
                present(mail, animated: true)
            } else { }
        case 2:
            if let url = URL(string: "https://www.mindateq.io/privacy-policy") {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        case 3:
            if let url = URL(string: "https://www.mindateq.io/terms-of-use") {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        case 4:
            shareApplication()
        case 5:
            let vc = FAQController()
            vc.modalPresentationStyle = .pageSheet
            present(vc, animated: true)
        default:
            break
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension SettingController: MFMailComposeViewControllerDelegate {
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
}
