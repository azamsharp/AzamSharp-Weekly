//
//  Date+Extensions.swift
//  stocks
//
//  Created by Mohammad Azam on 12/31/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//

import Foundation

extension Date {
    
    static func formatDateForTitle() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d yyyy"
        return formatter.string(from: Date())
    }
    
}
