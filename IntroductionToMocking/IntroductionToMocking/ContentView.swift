//
//  ContentView.swift
//  IntroductionToMocking
//
//  Created by Mohammad Azam on 4/25/20.
//  Copyright © 2020 Mohammad Azam. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var username: String = ""
    @State private var password: String = ""
    
    @ObservedObject var loginVM = LoginViewModel(client: HTTPClientFactory.create())
    
    private func shouldShowUserDetails() -> Bool {
        
        if let _ = self.loginVM.userVM {
            return true
        }
        return false
    }
    
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter User Name", text: self.$loginVM.username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .accessibility(identifier: "usernameTextField")
                
                TextField("Enter Password", text: self.$loginVM.password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .accessibility(identifier: "passwordTextField")
                
                Button("Login") {
                    self.loginVM.login()
                    
                }.accessibility(identifier: "loginButton")
                
                if shouldShowUserDetails() {
                    
                    Text(self.loginVM.userVM!.company)
                        .accessibility(identifier: "companyLabel")
                    
                    Text(self.loginVM.userVM!.name)
                    .accessibility(identifier: "nameLabel")
                }
                
                Spacer()
                
                }.padding()
            
            .navigationBarTitle("Login")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
