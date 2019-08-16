//
//  Webservice.swift
//  PaginationSwiftUI
//
//  Created by Mohammad Azam on 8/15/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//

import Foundation

class Webservice {
    
    func fetchUsers(page: Int, completion: @escaping (([User]) -> ())) {
             
             let url = URL(string: "https://giddy-tower.glitch.me/users?page=\(page)")!
             
             URLSession.shared.dataTask(with: url) { data, _, _ in
                 
                 if let data = data {
                     let users = try? JSONDecoder().decode([User].self, from: data)
                     DispatchQueue.main.async {
                          completion(users!)
                     }
                 }
                 
             }.resume()
             
         }
    
}
