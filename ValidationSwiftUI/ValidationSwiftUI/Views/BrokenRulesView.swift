//
//  ValidationSummaryView.swift
//  ValidationInSwiftUI
//
//  Created by Mohammad Azam on 3/15/20.
//  Copyright © 2020 Mohammad Azam. All rights reserved.
//

import SwiftUI

struct BrokenRulesView: View {
    
    let brokenRules: [BrokenRule]
    
    var body: some View {
        List(self.brokenRules, id: \.id) { brokenRule in
            Text(brokenRule.message)
        }
    }
}

struct ValidationSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        BrokenRulesView(brokenRules: [])
    }
}
