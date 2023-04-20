//
//  BlogSetupCollection.swift
//  dogTranslator
//
//  Created by Stas Dashkevich on 12.04.23.
//

import Foundation
import UIKit
import SnapKit

extension BlogViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BlogCell.id, for: indexPath) as! BlogCell
        cell.contentView.layer.borderWidth = 1
        cell.contentView.layer.cornerRadius = 15
        cell.contentView.layer.masksToBounds = true
        cell.contentView.layer.borderColor = UIColor(named: colorArray[indexPath.row])?.cgColor
        cell.image.image = UIImage(named: "blog\(indexPath.row)")
        cell.text.text = textArray[indexPath.row]
        
        if UserDefaults.standard.value(forKey: "FullAccess") as! Int == 0 {
            cell.chevronLock.image = UIImage(named: chevronLock[indexPath.row] )

        } else {
            cell.chevronLock.image = UIImage(named: chevronLockLock[indexPath.row] )
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let vc = BlogAction()
        vc.image.image = UIImage(named: blogActionImage[indexPath.row])
        vc.textView.text = textArrayAction[indexPath.row]
        vc.imageHeader.text = textArray[indexPath.row]
        
        if UserDefaults.standard.value(forKey: "FullAccess") as! Int == 0 {
            switch indexPath.row {
            case 0:
                present(vc, animated: true)
            case 1:
                present(vc, animated: true)
            default:
                if sub == "2" {
                    let vc = SecondSubscribeViewController()
                    vc.modalPresentationStyle = .fullScreen
                    present(vc, animated: true)
                } else if sub == "1" {
                    let vc = FirstSubscribeViewController()
                    vc.modalPresentationStyle = .fullScreen
                    present(vc, animated: true)
                }

            }
        } else {
            present(vc, animated: true)
        }
        
    }
    
    
    func setupCollection() {
        let layout = UICollectionViewFlowLayout()
        
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width-50, height: 76)
        
        layout.minimumLineSpacing = 16
        collection = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        
        guard let collection = collection else { return }
        
        collection.register(BlogCell.self, forCellWithReuseIdentifier: BlogCell.id)
        collection.delegate = self
        collection.dataSource = self
        collection.showsVerticalScrollIndicator = false
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .clear
        
        view.addSubview(collection)
        collection.snp.makeConstraints { make in
            make.top.equalTo(navigationView.snp.bottom).offset(24)
            make.left.right.equalTo(view).inset(15)
            make.bottom.equalTo(view).offset(-80)
        }

    }
}
