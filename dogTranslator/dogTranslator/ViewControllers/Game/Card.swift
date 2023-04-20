//
//  Card.swift
//  dogTranslator
//
//  Created by Stas Dashkevich on 11.04.23.
//

import Foundation

class CardModel{
    
    var genearatedCardArray = [Card]()

    func getCard() -> [Card] {
    
        for i in 1...10 {
            
            let card = Card()
            card.imageName = "dog\(i)"
            
            genearatedCardArray.append(card)
            
            let card2 = Card()
            card2.imageName = "dog\(i)"
            
            genearatedCardArray.append(card2)
        }
        
        return genearatedCardArray;
    }
    
    func getCardSecond() -> [Card] {
    
        for i in 11...20 {
            
            let card = Card()
            card.imageName = "dog\(i)"
            
            genearatedCardArray.append(card)
            
            let card2 = Card()
            card2.imageName = "dog\(i)"
            
            genearatedCardArray.append(card2)
        }
    
        return genearatedCardArray;
    }
    
    func getCardThird() -> [Card] {
    
        for i in 21...30 {
            
            let card = Card()
            card.imageName = "dog\(i)"
            
            genearatedCardArray.append(card)
            
            let card2 = Card()
            card2.imageName = "dog\(i)"
            
            genearatedCardArray.append(card2)
        }
    
        return genearatedCardArray;
    }
}
