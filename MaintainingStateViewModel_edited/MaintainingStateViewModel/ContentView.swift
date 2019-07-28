//
//  ContentView.swift
//  Demo-ViewModel
//
//  Created by Mohammad Azam on 7/27/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    //@State private var username: String = ""
    //@State private var password: String = ""
    
    private var authenticationService: AuthenticationService
    @ObjectBinding private var loginVM: LoginViewModel
    
    init() {
        self.authenticationService = AuthenticationService()
        self.loginVM = LoginViewModel(authService: self.authenticationService)
    }
    
    var body: some View {
        
        NavigationView {
        
        Group {
        VStack {
            TextField(self.$loginVM.username, placeholder: Text("Enter username")).padding().border(Color.gray, width: 1)
            SecureField(self.$loginVM.password, placeholder: Text("Enter password")).padding().border(Color.gray, width: 1)
            Button("Login") {
                self.loginVM.login()
            }
            
            Text(self.loginVM.isLoggedIn ? "LOGGED IN" : "NOT LOGGED IN")
            
        }
        }.padding()
            .navigationBarTitle("Login Screen")
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView()
        }
    }
}
#endif
