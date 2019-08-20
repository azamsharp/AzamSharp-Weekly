//
//  ContentView.swift
//  PullToRefresh
//
//  Created by Mohammad Azam on 8/19/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var postListVM = PostListViewModel()
    
    var body: some View {
        NavigationView {
            
            List {
                
                GeometryReader { g -> Text in
                    
                    let frame = g.frame(in: CoordinateSpace.global)
                    
                    if frame.origin.y > 250 {
                        self.postListVM.fetchPosts()
                        return Text("Loading....")
                    } else {
                        return Text("")
                    }
                    
                }
                
                
                ForEach(self.postListVM.posts, id:\.title) { post in
                    Text(post.title)
                }
                
            }
            
        .navigationBarTitle("Posts")
            .navigationBarItems(trailing: Button("Clear") {
                self.postListVM.clear()
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

