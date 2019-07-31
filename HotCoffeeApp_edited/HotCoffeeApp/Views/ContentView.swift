//
//  ContentView.swift
//  HotCoffeeApp
//
//  Created by Mohammad Azam on 7/31/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var orderListVM: OrderListViewModel
    
    init() {
        self.orderListVM = OrderListViewModel()
    }
    
    var body: some View {
        List {
            
            ForEach(self.orderListVM.orders, id: \.name) { order in
                 HStack {
                                       Image(order.type)
                                           .resizable()
                                           .frame(width: 100, height: 100)
                                           .cornerRadius(10)
                                       Text(order.name)
                                           .font(.largeTitle)
                                           .padding([.leading], 10)
                                   }
            }
            
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
