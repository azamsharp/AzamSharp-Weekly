//
//  ContentView.swift
//  DataFlowSwiftUI
//
//  Created by Mohammad Azam on 7/24/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//

import SwiftUI

struct DashboardView: View {
    
    @ObjectBinding private var dashboardVM = DashboardViewModel()
    
    var body: some View {
        VStack {
            TasksView(tasks: dashboardVM.tasks)
            StocksView(stocks: dashboardVM.stocks)
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
#endif
