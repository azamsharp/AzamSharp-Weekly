//
//  Validation+Extensions.swift
//  ValidationSwiftUI
//
//  Created by Mohammad Azam on 3/16/20.
//  Copyright © 2020 Mohammad Azam. All rights reserved.
//

import Foundation
import ValidatedPropertyKit

extension Validation where Value == String {
    
    static func required(errorMessage: String = "Is Empty") -> Validation {
           return .init { value in
               value.isEmpty ? .failure(.init(message: errorMessage)) : .success(())
           }
    }
    
}
