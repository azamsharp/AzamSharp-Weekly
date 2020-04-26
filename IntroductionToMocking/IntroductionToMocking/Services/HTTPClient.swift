//
//  HTTPClient.swift
//  IntroductionToMocking
//
//  Created by Mohammad Azam on 4/25/20.
//  Copyright © 2020 Mohammad Azam. All rights reserved.
//

import Foundation

class HTTPClient: HTTPClientProtocol {
    
    func authenticate(username: String, password: String, completion: @escaping (User?) -> Void ) {
          
        guard let url = URL(string: "https://numerous-manager.glitch.me/login") else {
            fatalError("Invalid URL")
        }
        
        let params = ["username": username, "password": password]
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = try? JSONEncoder().encode(params)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let data = data, error == nil else {
                return completion(nil)
            }
            
            let user = try! JSONDecoder().decode(User.self, from: data)
            completion(user)
            
        }.resume()

    }
    
}
