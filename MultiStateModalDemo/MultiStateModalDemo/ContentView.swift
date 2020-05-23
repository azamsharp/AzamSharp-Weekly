//
//  ContentView.swift
//  MultiStateModalDemo
//
//  Created by Mohammad Azam on 5/23/20.
//  Copyright © 2020 Mohammad Azam. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
     @State private var displayMode: DisplayMode = .none
    
    var body: some View {
        ZStack {
            MultiStateModal(mode: $displayMode) {
                Card()
            }
            
            Button("Show") {
                
                switch self.displayMode {
                    case .none:
                        self.displayMode = .half
                    case .half:
                        self.displayMode = .full
                    case .full:
                        self.displayMode = .none
                }
                
            }.offset(y: 100)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
