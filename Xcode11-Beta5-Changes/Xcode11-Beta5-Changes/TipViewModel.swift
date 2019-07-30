//
//  TipViewModel.swift
//  Xcode11-Beta5-Changes
//
//  Created by Mohammad Azam on 7/29/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class TipViewModel: ObservableObject {
   
    var total: String = ""
    
    @Published
    var tip: Double = 0.0
    
    func calculateTip() {
        self.tip = (Double(self.total))! * 0.20
    }
    
}
