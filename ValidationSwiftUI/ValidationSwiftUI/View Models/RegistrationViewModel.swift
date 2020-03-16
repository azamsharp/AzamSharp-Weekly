//
//  RegistrationViewModel.swift
//  ValidationInSwiftUI
//
//  Created by Mohammad Azam on 3/15/20.
//  Copyright © 2020 Mohammad Azam. All rights reserved.
//

import Foundation
import ValidatedPropertyKit

class RegistrationViewModel: ObservableObject {
    
    @Published private(set) var brokenRules = [BrokenRule]()
    
    @Validated(.required(errorMessage: "Please enter First Name"))
    var firstName: String? = ""
    
    @Validated(.nonEmpty)
    var lastName: String? = ""
    
    @Validated(.nonEmpty)
    var userName: String? = ""
    
    @Validated(.nonEmpty)
    var password: String? = ""
    
    func register() {
           if self.validate() {
               // register the user
           }
       }
    
    private func validate() -> Bool {
        
        self.brokenRules.removeAll()
        
        let rules = [
            "First name": _firstName.validationError,
            "Last name": _lastName.validationError,
            "User name": _userName.validationError,
            "Password": _password.validationError
        ]
        
        _ = rules.compactMap { pair in
            guard let errorMessage = pair.1?.failureReason else {
                return
            }
            
            self.brokenRules.append(BrokenRule(propertyName: pair.0, message: "\(errorMessage)"))
        }
        
        return self.brokenRules.count == 0
        
    }
    
}
