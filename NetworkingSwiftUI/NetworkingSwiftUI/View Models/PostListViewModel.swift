//
//  PostListViewModel.swift
//  NetworkingSwiftUI
//
//  Created by Mohammad Azam on 10/16/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//

import Foundation

class PostListViewModel: ObservableObject {
    @Published var posts = [PostViewModel]()
    
    init() {
        
        Webservice().getPosts { posts in
            
            if let posts = posts {
                self.posts = posts.map(PostViewModel.init)
            }
        }
        
    }
    
}

struct PostViewModel {
    
    var post: Post
    
    init(post: Post) {
        self.post = post
    }
    
    var id: Int {
        return self.post.id 
    }
    
    var title: String {
        return self.post.title
    }
    
    var body: String {
        return self.post.body
    }
    
}
