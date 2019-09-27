//
//  ContentView.swift
//  DownloadImageSwiftUI
//
//  Created by Mohammad Azam on 9/26/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack {
        
        URLImage(url: Constants.imageURL)
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/2)
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

