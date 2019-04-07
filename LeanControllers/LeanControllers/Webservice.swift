//
//  Webservice.swift
//  LeanControllers
//
//  Created by Mohammad Azam on 4/6/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//

import Foundation

class Webservice {
    
    func loadPosts(completion: @escaping ([Post]?) -> ()) {
     
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            fatalError("URL is incorrect")
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            let posts = try? JSONDecoder().decode([Post].self, from: data)
            DispatchQueue.main.async {
                completion(posts)
            }
            
        }.resume()
        
    }
    
}
