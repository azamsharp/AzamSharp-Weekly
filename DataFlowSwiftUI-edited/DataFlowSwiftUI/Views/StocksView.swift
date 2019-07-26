//
//  StocksView.swift
//  DataFlowSwiftUI
//
//  Created by Mohammad Azam on 7/24/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//

import SwiftUI

struct StocksView: View {
    
    let stocks: [Stock]
    
    init(stocks: [Stock]) {
        self.stocks = stocks
    }
    
    var body: some View {
        Text("Stocks")
    }
}

#if DEBUG
struct StocksView_Previews: PreviewProvider {
    static var previews: some View {
        StocksView(stocks: [Stock]())
    }
}
#endif
