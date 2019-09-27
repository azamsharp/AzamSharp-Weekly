//
//  URLImage.swift
//  DownloadImageSwiftUI
//
//  Created by Mohammad Azam on 9/26/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//

import SwiftUI

struct URLImage: View {
    
    let url: String
    @ObservedObject private var imageDownloader: ImageDownloader = ImageDownloader()
    
    init(url: String) {
        self.url = url
        self.imageDownloader.downloadImage(url: self.url)
    }
    
    var body: some View {
        
        if let imageData = self.imageDownloader.downloadedData {
            
            let img = UIImage(data: imageData)
            return
                VStack {
                    Image(uiImage: img!).resizable()
                    Text("Downloaded").font(.title)
            }
            
        } else {
            return VStack {
                Image("placeholder").resizable()
                Text("Downloading...").font(.title)
            }
        }
        
    }
}

struct URLImage_Previews: PreviewProvider {
    static var previews: some View {
        URLImage(url: Constants.imageURL)
    }
}



