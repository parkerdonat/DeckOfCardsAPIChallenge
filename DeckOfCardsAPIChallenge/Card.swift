//
//  Card.swift
//  DeckOfCardsApi
//
//  Created by Parker Donat on 2/17/16.
//  Copyright © 2016 Parker Donat. All rights reserved.
//

import Foundation

// data for the cards is found in the API

/*

"image": "http://deckofcardsapi.com/static/img/KH.png",
"value": "KING",
"suit": "HEARTS"
"code": "KH"

 Get brand new deck
 http://deckofcardsapi.com/api/deck/new/
 
*/


class Card {
    
    private let kValue = "value"
    private let kSuit = "suit"
    private let kImage = "image"
    
    var value: String
    var suit: String
    var imageURLString: String
    
    // Take in json then spit out Card
    init?(jsonDictionary: [String: AnyObject]) {
        
        guard let value = jsonDictionary[kValue] as? String,
            let suit = jsonDictionary[kSuit] as? String,
            let image = jsonDictionary[kImage] as? String else {
                self.value = ""
                self.imageURLString = ""
                self.suit = ""
                return
        }
        // if the values exist in the way we want them then set their properties
        self.value = value
        self.suit = suit
        self.imageURLString = image 
    }
}




