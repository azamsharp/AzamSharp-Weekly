//
//  UserViewModel.swift
//  PaginationSwiftUI
//
//  Created by Mohammad Azam on 8/15/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//

import Foundation

class UserListViewModel: ObservableObject {
    
    @Published var users = [UserViewModel]()
    
    init() {
        Webservice().fetchUsers(page: 1) { [weak self] users in
           // DispatchQueue.main.async {
                self?.users = users.map(UserViewModel.init)
           // }
        }
    }
    
    func nextPage(page: Int) {
        Webservice().fetchUsers(page: page) { [weak self] users in
            self?.users = users.map(UserViewModel.init)
        }
    }
    
    func previousPage(page: Int) {
           Webservice().fetchUsers(page: page) { [weak self] users in
               self?.users = users.map(UserViewModel.init)
           }
       }
    
}

class UserViewModel {
    
    var user: User
    
    init(user: User) {
        self.user = user
    }
    
    var name: String {
        return self.user.name
    }
    
}
