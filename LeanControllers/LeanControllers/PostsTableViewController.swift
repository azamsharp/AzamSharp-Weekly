//
//  PostsTableViewController.swift
//  LeanControllers
//
//  Created by Mohammad Azam on 4/6/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//

import Foundation
import UIKit

class PostsTableViewController: UITableViewController, PostsDataSourceDelegate {
    
    var datasource: PostsDatasource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.datasource = PostsDatasource()
        self.datasource.delegate = self
        self.tableView.dataSource = self.datasource
    }
    
    func postsDataSourceDidFetchPosts() {
        self.tableView.reloadData()
    }
   
    
}
