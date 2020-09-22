//
//  CardModel.swift
//  MatchApp
//
//  Created by Diya Bera on 8/20/20.
//  Copyright © 2020 Diya Bera. All rights reserved.
//

import Foundation

class CardModel {
    
    func getCards () -> [Card] {
        
        var generatedCards = [Card]()
        var randomNumArray = [Int] ()
        while randomNumArray.count < 8 {
            
            let randomNumber = Int.random(in: 1...13)
            if !randomNumArray.contains(randomNumber) {
                
                randomNumArray.append(randomNumber)
                
            }
            
        }
        
        for random in randomNumArray {
            
            let cardOne = Card()
            let cardTwo = Card()
            
            cardOne.imageName = "card\(random)"
            cardTwo.imageName = "card\(random)"
            
            //print(random)
            
            generatedCards += [cardOne, cardTwo]
            generatedCards.shuffle()
        }
        
        return generatedCards
        
    }
    
}
