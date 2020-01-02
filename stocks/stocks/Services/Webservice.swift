//
//  Webservice.swift
//  stocks
//
//  Created by Mohammad Azam on 12/24/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//

import Foundation

class Webservice {
    
    func getTopNews(completion: @escaping (([Article]?) -> Void)) {
        
        guard let url = URL(string: "https://silicon-rhinoceros.glitch.me/top-news") else {
                   fatalError("URL is not correct!")
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else {
                           completion(nil)
                           return
                }
            
            let articles = try? JSONDecoder().decode([Article].self, from: data)
            articles == nil ? completion(nil) : completion(articles)
            
            
        }.resume()
    }
    
    func getStocks(completion: @escaping (([Stock]?) -> Void)) {
        
        guard let url = URL(string: "https://silicon-rhinoceros.glitch.me/stocks") else {
            fatalError("URL is not correct!")
        }
         
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            let stocks = try? JSONDecoder().decode([Stock].self, from: data)
            stocks == nil ? completion(nil) : completion(stocks)
            
        }.resume()
        
        
        
    }
    
}
