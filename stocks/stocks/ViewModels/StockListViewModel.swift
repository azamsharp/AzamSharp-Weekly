//
//  StockListViewModel.swift
//  stocks
//
//  Created by Mohammad Azam on 12/24/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//

import Foundation
import SwiftUI

class StockListViewModel: ObservableObject {
    
    @Published var dragOffset: CGSize = CGSize(width: 0, height: 680)
    @Published var searchTerm: String = ""
    @Published var stocks: [StockViewModel] = [StockViewModel]()
    @Published var news :[NewsArticleViewModel] = [NewsArticleViewModel]()
    
    func load() {
        fetchopNews()
        fetchStocks()
    }
    
    private func fetchopNews() {
        
        Webservice().getTopNews { news in
                   if let news = news {
                       DispatchQueue.main.async {
                            self.news = news.map(NewsArticleViewModel.init)
                       }
                      
                   }
               }
    }
    
    private func fetchStocks() {
        
        Webservice().getStocks { stocks in
            if let stocks = stocks {
                DispatchQueue.main.async {
                     self.stocks = stocks.map(StockViewModel.init)
                }
               
            }
        }
    }
    
}


struct NewsArticleViewModel {
    
    let article: Article
    
    var imageURL: String {
        return self.article.imageURL
    }
    
    var title: String {
        return self.article.title
    }
    
    var publication: String {
        return self.article.publication.uppercased()
    }
    
}

struct StockViewModel {
    
    let stock: Stock
    
    var symbol: String {
        return self.stock.symbol.uppercased()
    }
    
    var description: String {
        return self.stock.description
    }
    
    var price: String {
        return String(format: "%.2f",self.stock.price)
    }
    
    var change: String {
        return self.stock.change
    }
    
}
