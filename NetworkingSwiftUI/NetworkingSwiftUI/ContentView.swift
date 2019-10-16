//
//  ContentView.swift
//  NetworkingSwiftUI
//
//  Created by Mohammad Azam on 10/16/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var postListVM = PostListViewModel() 
    
    var body: some View {
        
        List(self.postListVM.posts, id: \.id) { post in
            
            VStack(alignment: .leading) {
                Text(post.title).font(.title)
                Text(post.body)
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
