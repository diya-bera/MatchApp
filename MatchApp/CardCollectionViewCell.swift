//
//  CardCollectionViewCell.swift
//  MatchApp
//
//  Created by Diya Bera on 8/20/20.
//  Copyright © 2020 Diya Bera. All rights reserved.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var frontImageView: UIImageView!
    
    @IBOutlet weak var backImageView: UIImageView!
    
    var card: Card?
    
    func configureCell (card: Card) {
        
        if card.isMatched {
            
            backImageView.alpha = 0
            frontImageView.alpha = 0
            return
            
        }
        else {
            
            backImageView.alpha = 1
            frontImageView.alpha = 1
            
        }
        
        self.card = card
        frontImageView.image = UIImage(named: card.imageName)
        
        if card.isFlipped {
            
            flipUp(speed: 0)
            
        }
        
        else {
            
             UIView.transition(from: self.frontImageView, to: self.backImageView, duration: 0, options: [.showHideTransitionViews, .transitionFlipFromLeft], completion: nil)
                        
        }
    }
    
    func flipUp(speed: TimeInterval = 0.3) {
        
         UIView.transition(from: backImageView, to: frontImageView, duration: speed, options: [.showHideTransitionViews, .transitionFlipFromLeft], completion: nil)
        
        card?.isFlipped = true
        
    }
    
    func flipDown(speed: TimeInterval = 0.3) {
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.75) {
            
            UIView.transition(from: self.frontImageView, to: self.backImageView, duration: speed, options: [.showHideTransitionViews, .transitionFlipFromLeft], completion: nil)
            
        }
        
        card?.isFlipped = false
    
    }
    
    func remove() {
        
        backImageView.alpha = 0
        
        UIView.animate(withDuration: 0.3, delay: 0.5, options: .curveEaseOut, animations: {
           
            self.frontImageView.alpha = 0
            
        }, completion: nil)
    }
    
}
