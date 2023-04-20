//
//  GameLogic.swift
//  dogTranslator
//
//  Created by Stas Dashkevich on 11.04.23.
//

import Foundation
import UIKit
import SnapKit
import Lottie
import AVFAudio

extension NewGameController {
    
    @objc func handleNext(paramSander: Any){
        if UserDefaults.standard.value(forKey: "Level") as? Int == 1 {
            UserDefaults.standard.set(2, forKey: "Level")
        } else if UserDefaults.standard.value(forKey: "Level") as? Int == 2 {
            UserDefaults.standard.set(3, forKey: "Level")
        } else {
            UserDefaults.standard.set(1, forKey: "Level")
        }
        loadView()
        level = UserDefaults.standard.value(forKey: "Level") as? Int ?? 1

        collectionView.isHidden = false
        continueButton.isHidden = true
        scoreLottie.isHidden = true
        
        switch(level) {
        case 1:  cardArray = cardModel.getCard()
        case 2:  cardArray = cardModel.getCardSecond()
        case 3:  cardArray = cardModel.getCardThird()
        default: cardArray = cardModel.getCard()
        }
        
        cardArray.shuffle()
        
        setUpUI()
        setUpLogic()
        
        view.layoutIfNeeded()
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "reload"), object: nil)
        if UserDefaults.standard.value(forKey: "hide") as? String == "1" {
            let vc = TabBarController()
            vc.selectedIndex = 2
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: false)
        } else {
            let vc = TabBarController()
            vc.selectedIndex = 3
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: false)
        }

    }
    
    func didload() {
        continueButton.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        view.addSubview(scoreLottie)
        view.addSubview(scoreHeaderLabel)
        view.addSubview(continueButton)
        
        scoreHeaderLabel.snp.makeConstraints { make in
            make.top.equalTo(navigationHeader.snp.bottom).offset(74)
            make.centerX.equalToSuperview()
        }
        
        continueButton.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(60)
            make.bottom.equalToSuperview().offset(-105)
        }
        
        scoreLottie.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(scoreHeaderLabel.snp.bottom).offset(24)
            make.bottom.equalTo(continueButton.snp.top).offset(-60)
        }
        scoreLottie.play()
    }
    
    func setUpLogic() {
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 9
        layout.minimumInteritemSpacing = 9
    
        layout.itemSize = CGSize(width: cellWidth-2, height: cellHeight)

        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        
        guard let collection = collectionView else { return }
        
        collection.backgroundColor = .clear

        collection.register(CardCollectionViewCell.self, forCellWithReuseIdentifier: CardCollectionViewCell.id)
        collection.delegate = self
        collection.dataSource = self
        collection.showsVerticalScrollIndicator = false
        collection.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(collection)
        collection.snp.makeConstraints { make in
            make.top.equalTo(scoreImage.snp.bottom).offset(20)
            make.left.right.equalTo(view).inset(UIScreen.main.bounds.width/25)
            make.bottom.equalTo(view).offset(0)
        }
    }
    
    @objc func handleClose(paramSander: Any){
        
        dismiss(animated: true, completion: nil)
    }
    
    @objc func handleRefresh(){
        
        cardArray = []
        collectionView.reloadData()
        print(cardArray.count)
        cardArray = cardModel.getCard()
        cardArray.shuffle()
        level = 1
        UserDefaults.standard.set(1, forKey: "Level")
        reloadFlag = 20
        
        collectionView.reloadData()
        collectionView.collectionViewLayout.invalidateLayout()
    }
    
    func checkGameEnded()
    {
        counter += 1
        if counter == 10 {
            let delay : Double = 1
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {

                self.collectionView.isHidden = true
                self.continueButton.isHidden = false
                self.scoreLottie.isHidden = false
                self.scoreHeaderLabel.isHidden = false
                self.counter = 0
                self.scoreLottie.play()
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCollectionViewCell.id, for: indexPath) as! CardCollectionViewCell
        
        let card = cardArray[indexPath.row]
        
        cell.setCard(card)
        
        if reloadFlag != 0 {
            cell.alpha = 1;
            cell.frontImageView.alpha = 1;
            cell.backImageView.alpha = 1;
            cell.flipback()
            reloadFlag -= 1
        }
        
        cell.flipCard()
        let delay : Double = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            cell.flipback()
        }
        
        
        
        return cell;
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath) as! CardCollectionViewCell

        let card = cardArray[indexPath.row]
        if card.isFlipped == false && card.isMatched == false {
            card.isFlipped = true
            cell.flipCard()
            
            do {
                try AVAudioSession.sharedInstance().setCategory(.playback)
            } catch(let error) {
                print(error.localizedDescription)
            }
            
            //SoundManager.playSound(.flip)
            
            playSound(name: "open")
            print(player?.volume)
            
            if firstIndexFlippedPathIndex == nil {
                firstIndexFlippedPathIndex = indexPath
            }
            else{
                checkForMatchs(indexPath)
            }
        }
    }
    
    func checkForMatchs(_ secondFlippedCardIndexIndexPath :IndexPath) {
        
        
        let fistIndexCell = collectionView.cellForItem(at: firstIndexFlippedPathIndex!) as? CardCollectionViewCell
        
        let secondIndexCell = collectionView.cellForItem(at: secondFlippedCardIndexIndexPath) as? CardCollectionViewCell
        
        let firstFliipedIndexCard  = cardArray[firstIndexFlippedPathIndex!.row]
        let secondFlippedIndexCard = cardArray[secondFlippedCardIndexIndexPath.row]
        
        if firstFliipedIndexCard.imageName == secondFlippedIndexCard.imageName
        {
            firstFliipedIndexCard.isMatched = true
            secondFlippedIndexCard.isMatched = true
            fistIndexCell?.remove()
            secondIndexCell?.remove()
            
            do {
                try AVAudioSession.sharedInstance().setCategory(.playback)
            } catch(let error) {
                print(error.localizedDescription)
            }
            
            playSound(name: "match")
            //print(player?.volume)
            //SoundManager.playSound(.match)
            
            supportUD = UserDefaults.standard.value(forKey: "score") as? String ?? "0"
            let helper = Int(supportUD)! + 1
            supportUD = String(helper)
            UserDefaults.standard.set(supportUD, forKey: "score")
            scoreLabel.text = String(supportUD)
            
            scoreLabel.rotateCell()
            
            checkGameEnded()
        }
        else{
            fistIndexCell?.flipback()
            secondIndexCell?.flipback()
            firstFliipedIndexCard.isFlipped = false
            secondFlippedIndexCard.isFlipped = false;
            
            //SoundManager.playSound(.noMatch)
            
        }
        if fistIndexCell == nil {
            collectionView.reloadItems(at: [firstIndexFlippedPathIndex!])
        }
        firstIndexFlippedPathIndex = nil
    }
    
    func playSound(name: String) {
                guard let path = Bundle.main.path(forResource: name, ofType: "mp3") else { return }
                let url = URL(fileURLWithPath: path)

                do {
                    player = try AVAudioPlayer(contentsOf: url)
                    player?.prepareToPlay()
                    player?.play()
                    player?.volume = 1.0
                } catch _ {
                }
                do {
                    try AVAudioSession.sharedInstance().setCategory(.playback)
                } catch(let error) {
                    print(error.localizedDescription)
            }
        }
    
}

extension NewGameController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSizeMake(CGFloat(cellWidth)-2, CGFloat(cellHeight))

      }
    
}

