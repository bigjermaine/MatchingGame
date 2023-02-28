//
//  CardViewModel.swift
//  MatchingAPP
//
//  Created by Apple on 27/02/2023.
//

import Foundation

class carModel {
    
    
    
    
    func getCards() -> [card] {
        
        
        var  generateCards = [card]()
        
        for _ in 1...8 {
            let randomNumber = Int.random(in: 1...13)
            
            var cardOne =  card()
            var cardTwo =  card()
            
            
            
            cardOne.imageName = "card\(randomNumber)"
            cardTwo.imageName = "card\(randomNumber)"
            
            generateCards.append(contentsOf: [cardOne,cardTwo])
        }
        
        return generateCards
    }
    
    
    
}
