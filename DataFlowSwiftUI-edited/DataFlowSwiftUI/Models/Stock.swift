//
//  Stock.swift
//  DataFlowSwiftUI
//
//  Created by Mohammad Azam on 7/24/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//

import Foundation

struct Stock {
    let symbol: String
    let price: Double
}

extension Stock {
    
    static func all() -> [Stock] {
        return [
            Stock(symbol: "MSFT", price: 123),
            Stock(symbol: "FB", price: 190),
            Stock(symbol: "APPLE", price: 200)
        ]
    }
    
}
