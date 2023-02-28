//
//  CardCollectionViewCell.swift
//  MatchingAPP
//
//  Created by Apple on 27/02/2023.
//

import UIKit





class CardCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var FrontImage: UIImageView!
    
    
    @IBOutlet weak var backImage: UIImageView!
    
    var Card:card?
  
    func configurecell(Card:card) {
        
        
        self.Card = Card
        
        
        FrontImage.image = UIImage(named: Card.imageName)
        
        
        
        if  Card.isMatched == true {
            backImage.alpha = 0
            FrontImage.alpha = 0
            return
        }else {
            backImage.alpha = 1
            FrontImage.alpha = 1
        }
        if Card.isFlipped == true {
            flipUp(speed: 0)
        }else {
            flipDown(speed: 0,delay: 0)
        }
        
    }
    
    func flipUp(speed:TimeInterval = 0.3) {
        UIView.transition(from: self.backImage, to: self.FrontImage, duration: speed,options: [.showHideTransitionViews,.transitionFlipFromLeft],completion: nil)
        self.Card?.isFlipped = true
    }
    func flipDown(speed:TimeInterval = 0.3 , delay:TimeInterval = 0.5) {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delay) {
            
            
            UIView.transition(from: self.FrontImage, to: self.backImage, duration: speed,options: [.showHideTransitionViews,.transitionFlipFromLeft],completion: nil)
              self.Card?.isFlipped = false
        }
    }
    
    func remove() {
        self.backImage.alpha = 0
        UIView.animate(withDuration: 0.3, delay: 0.5,options: .curveEaseOut,animations:  {
            self.FrontImage.alpha = 0
        },completion: nil)
    }
}
