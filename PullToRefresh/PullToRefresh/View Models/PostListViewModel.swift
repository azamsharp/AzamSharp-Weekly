//
//  PostListViewModel.swift
//  PullToRefresh
//
//  Created by Mohammad Azam on 8/19/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//

import Foundation

class PostListViewModel: ObservableObject {
    
    @Published var posts = [PostViewModel]()
    
    init() {
        fetchPosts()
    }
    
    func clear() {
        self.posts = [] 
    }
    
    func fetchPosts() {
        
        if posts.count == 0 {
            
            Webservice().fetchPosts { posts in
                    self.posts = posts.map(PostViewModel.init)
            }
        }
        
       
    }
    
}

class PostViewModel {
    
    var post: Post
    
    init(post: Post) {
        self.post = post
    }
    
    var title: String {
        return self.post.title
    }
    
    var body: String {
        return self.post.body
    }
}
