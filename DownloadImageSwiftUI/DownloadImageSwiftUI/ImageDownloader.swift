//
//  ImageDownloader.swift
//  DownloadImageSwiftUI
//
//  Created by Mohammad Azam on 9/26/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//

import Foundation

class ImageDownloader: ObservableObject {

    @Published var downloadedData: Data? = nil
    
    func downloadImage(url: String) {
        
        print(url)
        
        guard let imageURL = URL(string: url) else {
            fatalError("ImageURL is incorrect")
        }
        
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: imageURL)
            print(data)
            DispatchQueue.main.async {
                self.downloadedData = data
            }
        }
    }
    
}
