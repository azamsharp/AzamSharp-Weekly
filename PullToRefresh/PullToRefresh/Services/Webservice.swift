//
//  Webservice.swift
//  PullToRefresh
//
//  Created by Mohammad Azam on 8/19/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//

import Foundation

class Webservice {
    
    func fetchPosts(completion: @escaping ([Post]) -> ()) {
        
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            
            if let data = data {
                let posts = try! JSONDecoder().decode([Post].self, from: data)
                DispatchQueue.main.async {
                    completion(posts)
                }
            }
            
        }.resume()
        
    }
    
}
