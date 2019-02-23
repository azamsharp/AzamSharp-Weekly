import UIKit
import PlaygroundSupport

struct Post: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!


URLSession.shared.dataTask(with: url) { data, response, error in
    
    if let data = data {
    
        let posts = try? JSONDecoder().decode([Post].self, from: data)
        print(posts)

    }
    
}.resume()



PlaygroundPage.current.needsIndefiniteExecution = true


