//
//  MockedHTTPClient.swift
//  IntroductionToMockingUITests
//
//  Created by Mohammad Azam on 4/26/20.
//  Copyright © 2020 Mohammad Azam. All rights reserved.
//

import Foundation
//@testable import IntroductionToMocking This doesn't make any sense

class MockedHTTPClient: HTTPClientProtocol {
    
    func authenticate(username: String, password: String, completion: @escaping (User?) -> Void) {
        
       guard let url = Bundle(for: MockedHTTPClient.self).url(forResource: "auth-success-response", withExtension: "json"),
                    let data = try? Data(contentsOf: url)
              else {
                  return completion(nil)
              }

              guard let user = try? JSONDecoder().decode(User.self, from: data)
              else {
                  return completion(nil)
              }
              
              completion(user)
        
    }
}
