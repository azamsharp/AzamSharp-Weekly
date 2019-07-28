//
//  LoginViewModel.swift
//  MaintainingStateViewModel
//
//  Created by Mohammad Azam on 7/28/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class LoginViewModel: BindableObject {
    
    let willChange = PassthroughSubject<Void, Never>()
    var authenticationService: AuthenticationService
    
    var username: String = ""
    var password: String = ""
    
    init(authService: AuthenticationService) {
        self.authenticationService = authService
    }
    
    var isLoggedIn: Bool = false {
        willSet {
            DispatchQueue.main.async {
                self.willChange.send()
            }
        }
    }
    
}

extension LoginViewModel {
    
    func login() {
        // call a web servive and authenticate the user
        let user = User(username: self.username, password: self.password)
        self.authenticationService.authenticate(user: user) {
            self.isLoggedIn = $0
        }
    }
}
