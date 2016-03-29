//
//  CardController.swift
//  DeckOfCardsApi
//
//  Created by Parker Donat on 2/17/16.
//  Copyright © 2016 Parker Donat. All rights reserved.
//

import Foundation

class CardController {
    
    static func getWholeCardDeck(completion:([Card]?) -> Void) {
        
        NetworkController.dataAtURL { (returnedData) -> Void in
            guard let data = returnedData else {
                print("No data returned")
                completion(nil)
                return
            }
            
            // error handling
            do {
                let resultsAnyObject = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments)
                
                // Good place to print out and see results
                if let resultsDictionary = resultsAnyObject as? [String:AnyObject], let cardArray = resultsDictionary["cards"] as? [[String:AnyObject]] {

                    var tempCards: [Card] = []
                    // Iterate through the array
                    for card in cardArray {
                        if let newCard = Card(jsonDictionary: card) {
                            tempCards.append(newCard)
                        }
                    }
                    
                    print(tempCards.count)
                    completion(tempCards)
                } else {
                    completion(nil)
                }
                
            } catch {
                completion(nil)
            }
            
            
        }
    }
}

















