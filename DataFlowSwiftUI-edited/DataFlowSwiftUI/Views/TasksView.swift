//
//  ContentView.swift
//  DataFlowSwiftUI
//
//  Created by Mohammad Azam on 7/24/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//

import SwiftUI

struct TasksView: View {
    
    let tasks: [String]
    
    init(tasks: [String]) {
        self.tasks = tasks
    }
    
    var body: some View {
        Text("Hello World")
    }
}

#if DEBUG
struct TasksView_Previews: PreviewProvider {
    static var previews: some View {
        TasksView(tasks: [String]())
    }
}
#endif
