import UIKit

struct Post: Decodable {
    let title: String
    let body: String
}

enum NetworkError: Error {
    case domainError
    case decodingError
}

func fetchPosts(url: URL, completion: @escaping (Result<[Post],NetworkError>) -> Void) {
    
    URLSession.shared.dataTask(with: url) { data, response, error in
        
        guard let data = data, error == nil else {
            if let error = error as NSError?, error.domain == NSURLErrorDomain {
                    completion(.failure(.domainError))
            }
            return
        }
        
        do {
            let posts = try JSONDecoder().decode([Post].self, from: data)
            completion(.success(posts))
        } catch {
            completion(.failure(.decodingError))
        }
        
    }.resume()
    
}

let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!

fetchPosts(url: url) { result in
    
    switch result {
        case .success(let posts):
            print(posts)
        case .failure:
            print("FAILED")
    }
}
