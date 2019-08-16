//
//  ContentView.swift
//  PaginationSwiftUI
//
//  Created by Mohammad Azam on 8/15/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var userListVM = UserListViewModel()
    @State private var page = 1
    
    var body: some View {
        
        NavigationView {
        
        List {
            
            ForEach(self.userListVM.users, id: \.name) { vm in
                Text(vm.name)
            }
            
        }
        .navigationBarItems(leading:
            self.page > 1 ?
            Button("Previus"){
                
            // previous
            
            self.page -= 1
            self.userListVM.previousPage(page: self.page)
            
            } : nil , trailing: Button("Next") {
                
                // next
                self.page += 1
                self.userListVM.nextPage(page: self.page)
                
        })
            
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
