//
//  OrderListViewModel.swift
//  HotCoffeeApp
//
//  Created by Mohammad Azam on 7/31/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class OrderListViewModel: ObservableObject {
    
    @Published
    var orders = [OrderViewModel]()
    
    init() {
        fetchAllOrders()
    }
    
    func fetchAllOrders() {
        self.orders = CoreDataManager.shared.getAllOrders().map(OrderViewModel.init)
    }
    
}

class OrderViewModel {
    var name = ""
    var type = ""
    
    init(order: Order) {
        self.name = order.name!
        self.type = order.type!
    }
}
