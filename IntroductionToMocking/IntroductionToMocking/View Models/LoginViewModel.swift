//
//  LoginViewModel.swift
//  IntroductionToMocking
//
//  Created by Mohammad Azam on 4/25/20.
//  Copyright © 2020 Mohammad Azam. All rights reserved.
//

import Foundation

class UserViewModel {
    
    var user: User
    
    init(_ user: User) {
        self.user = user
    }
    
    var username: String {
        return self.user.username
    }
    
    var name: String {
        return self.user.name
    }
    
    var company: String {
        return self.user.company
    }
}

class LoginViewModel: ObservableObject {
    
    var username: String = ""
    var password: String = ""
    @Published var userVM: UserViewModel?
    
    var client: HTTPClientProtocol
    
    init(client: HTTPClientProtocol) {
        self.client = client
    }
    
    func login() {
        self.client.authenticate(username: self.username, password: self.password) { user in
            if let user = user {
                DispatchQueue.main.async {
                    self.userVM = UserViewModel(user)
                }
            }
        }
    }
}
