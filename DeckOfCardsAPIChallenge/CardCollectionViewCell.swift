//
//  CardCollectionViewCell.swift
//  DeckOfCardsAPIChallenge
//
//  Created by Parker Donat on 3/29/16.
//  Copyright © 2016 Parker Donat. All rights reserved.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    
    // Outlets
    @IBOutlet weak var suitValueLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    // update with model objects
    
    func updateCellWithCard(card: Card) {
        
        // set suit value label and fetch image
        suitValueLabel.text = card.suit
        
        NetworkController.fetchImageAtURL(card.imageURLString) { (image) in
            
            if let image = image {
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.imageView.image = image
                })
            }
        }
        
    }
}
