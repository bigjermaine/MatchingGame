//
//  ViewController.swift
//  MatchingAPP
//
//  Created by Apple on 27/02/2023.
//

import UIKit

class ViewController: UIViewController{

    let model = carModel()
    
    var firtsIndexpath: IndexPath?
    
    
    
    @IBOutlet weak var Collections: UICollectionView!
    
    
    
    var cardArray = [card]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        cardArray = model.getCards()
        
        Collections.delegate = self
        Collections.dataSource = self
      
    }


}

extension ViewController: UICollectionViewDelegate,UICollectionViewDataSource  {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
      return   cardArray.count
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = Collections.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as? CardCollectionViewCell
      
         
        let cardIndex = cardArray[indexPath.row]
        
        cell?.configurecell(Card: cardIndex)
        
        return cell!
        
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath) as? CardCollectionViewCell
        if  cell?.Card?.isFlipped == false  && cell? .Card?.isMatched == false {
            cell?.flipUp()
            
            if firtsIndexpath == nil {
                firtsIndexpath = indexPath
            }else{
                checkForMatch( indexPath)
            }
            
            
            
            
        }
    }
    
    func checkForMatch(_ secondFlippedCardIndex:IndexPath) {
        var cardOne =  cardArray[firtsIndexpath!.row]
        var cardTwo =  cardArray[secondFlippedCardIndex.row]
        
        
        let cardOneCell = Collections.cellForItem(at: firtsIndexpath!)  as? CardCollectionViewCell
        let cardTwoCell = Collections.cellForItem(at: secondFlippedCardIndex)  as? CardCollectionViewCell
        
        if cardOne.imageName == cardTwo.imageName  {
            cardTwo.isMatched = true
            cardOne.isMatched = true
            
            cardOneCell?.remove()
            cardTwoCell?.remove()
           
 
        }else {
            
            cardOneCell?.flipDown()
            cardTwoCell?.flipDown()
        }
        
        
    }
    
}
