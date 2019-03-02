import UIKit

struct Geo: Codable {
    let latitude: String
    let longitude: String
    
    private enum CodingKeys: String, CodingKey {
        case latitude = "lat"
        case longitude = "lng"
    }
}

struct Address: Codable {
    let street: String
    let city: String
    let geoLocation: Geo
    
    private enum CodingKeys: String, CodingKey {
        case street
        case city 
        case geoLocation = "geo"
    }
}

struct User: Codable {
    let name: String
    let email: String
    let address: Address
}


let url = URL(string: "https://jsonplaceholder.typicode.com/users")!


URLSession.shared.dataTask(with: url) { data, _, _ in
    
    if let data = data {
        
        let users = try? JSONDecoder().decode([User].self, from: data)
        print(users)
        
        print(users![0].address.street)
    }
    
}.resume()


