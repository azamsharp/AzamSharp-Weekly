//
//  ContentView.swift
//  stocks
//
//  Created by Mohammad Azam on 12/22/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var dragOffset = CGSize(width: 0, height: 680)
    @ObservedObject private var stockListVM = StockListViewModel()
        
    init() {
        UINavigationBar.appearance().backgroundColor = UIColor.black
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UITableView.appearance().backgroundColor = UIColor.black
                   UITableViewCell.appearance().backgroundColor = UIColor.black
        self.stockListVM.load()
    }

    var body: some View {
        
      //  let filteredStocks = self.stockListVM.searchTerm.isEmpty ? self.stockListVM.stocks : self.stockListVM.stocks.filter {
        //    $0.symbol.starts(with: self.stockListVM.searchTerm)
       // }
        
        let stocks = self.stockListVM.stocks
        
        return NavigationView {
            ZStack(alignment: .leading) {
                
                Color.black
                
                Text(Date.formatDateForTitle())
                    .font(.custom("Arial",size: 32))
                    .fontWeight(.bold)
                    .foregroundColor(Color.gray)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                    .offset(y: -400)
            
                SearchView(
                    searchTerm: self.$stockListVM.searchTerm)
                    .offset(y: -350)
                
                StockListView(stocks: stocks)
                    .offset(y: 150)
                   
                /*
                NewsArticleView(
                    newsArticles: self.stockListVM.news,
                    onDragBegin: { value in
                        print("drag begin")
                         self.stockListVM.dragOffset = value.translation
                }, onDragEnd: { value in
                    if value.translation.height < 0 {
                                               self.stockListVM.dragOffset = CGSize(width: 0, height: 100)
                                           } else {
                                               self.stockListVM.dragOffset = CGSize(width: 0, height: 680)
                                           }
                }
                    
                )
                    .animation(.spring())
                    .offset(y: self.stockListVM.dragOffset.height) */
                
                Spacer()
                
            }.background(Color.black)
            .navigationBarTitle("Stocks")
                
        }.edgesIgnoringSafeArea(Edge.Set(.bottom))
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
