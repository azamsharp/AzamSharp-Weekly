//
//  AuthenticationService.swift
//  Demo-ViewModel
//
//  Created by Mohammad Azam on 7/27/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//

import Foundation

class AuthenticationService {
    
    func authenticate(user: User, completion: @escaping (Bool) -> ())  {
        completion(true)
    }
    
}
