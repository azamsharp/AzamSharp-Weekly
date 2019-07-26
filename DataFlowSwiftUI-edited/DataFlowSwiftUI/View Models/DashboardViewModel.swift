//
//  DashboardViewModel.swift
//  DataFlowSwiftUI
//
//  Created by Mohammad Azam on 7/24/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class DashboardViewModel: BindableObject {
    
    let willChange = PassthroughSubject<Void, Never>()
    
    var stocks = [Stock]() {
        willSet {
            DispatchQueue.main.async {
                self.willChange.send()
            }
        }
    }
    
    var tasks = [String]() {
        willSet {
            DispatchQueue.main.async {
                self.willChange.send()
            }
        }
    }
    
}
