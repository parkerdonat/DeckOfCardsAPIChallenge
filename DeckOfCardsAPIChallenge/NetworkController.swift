//
//  NetworkController.swift
//  DeckOfCardsApi
//
//  Created by Parker Donat on 2/17/16.
//  Copyright © 2016 Parker Donat. All rights reserved.
//

import Foundation
import UIKit

class NetworkController {
    
    static func dataAtURL(completion:(returnedData: NSData?) -> Void) {
        
        let url = NSURL(string: "http://deckofcardsapi.com/api/deck/new/draw/?count=52")!
        
        let dataTask = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, _, error) -> Void in
            
            // Check for error returned
            if let error = error {
                print("There was an error with dataTask: \(error.localizedDescription)")
            }
            // satisfy the closure
            completion(returnedData: data)
        }
        dataTask.resume()
    }
    
    static func fetchImageAtURL(imageURLString: String, completion: (image: UIImage?) -> Void) {
        
        if let url = NSURL(string: imageURLString) {
            
            NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: { (data, _, error) -> Void in
                if let error = error {
                    print(error.localizedDescription)
                    completion(image: nil)
                }
                
                if let data = data {
                    let image = UIImage(data: data)
                    completion(image: image)
                }
            })
           .resume()
        } else {
            completion(image: nil)
        }
        
    }
    
}








