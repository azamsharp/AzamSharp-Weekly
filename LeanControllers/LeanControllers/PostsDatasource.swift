//
//  PostsDatasource.swift
//  LeanControllers
//
//  Created by Mohammad Azam on 4/6/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//

import Foundation
import UIKit

protocol PostsDataSourceDelegate {
    func postsDataSourceDidFetchPosts()
}

class PostsDatasource: NSObject, UITableViewDataSource {
    
    private var posts = [Post]()
    var delegate: PostsDataSourceDelegate?
    
    override init() {
        super.init()
        fetchPosts()
    }
    
    private func fetchPosts() {
        
        Webservice().loadPosts { [weak self] posts in
            if let posts = posts {
                self?.posts = posts
                self?.delegate?.postsDataSourceDidFetchPosts()
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let post = self.posts[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath)
        cell.textLabel?.text = post.title
        cell.detailTextLabel?.text = post.body
        return cell
        
    }
    
    
}
