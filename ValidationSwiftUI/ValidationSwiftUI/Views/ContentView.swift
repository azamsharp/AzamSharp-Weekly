//
//  ContentView.swift
//  ValidationInSwiftUI
//
//  Created by Mohammad Azam on 3/15/20.
//  Copyright © 2020 Mohammad Azam. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var registrationVM = RegistrationViewModel()
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                Form {
                    
                    TextField("First name", text: self.$registrationVM.firstName.bound)
                    TextField("Last name", text: self.$registrationVM.lastName.bound)
                    TextField("User name", text: self.$registrationVM.userName.bound)
                    SecureField("Password", text: self.$registrationVM.password.bound)
                    
                    HStack {
                        Spacer()
                        Button("Register") {
                            self.registrationVM.register()
                        }
                        Spacer()
                    }
                }
                
                 BrokenRulesView(brokenRules: self.registrationVM.brokenRules)
              
            }
                
            .navigationBarTitle("Registration")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
