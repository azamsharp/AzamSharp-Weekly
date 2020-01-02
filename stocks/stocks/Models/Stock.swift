//
//  Stock.swift
//  stocks
//
//  Created by Mohammad Azam on 12/24/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//

import Foundation

struct Stock: Decodable {
    let symbol: String
    let description: String
    let price: Double
    let change: String 
}
