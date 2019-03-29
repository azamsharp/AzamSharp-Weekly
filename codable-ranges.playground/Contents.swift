import UIKit


struct Toy: Codable {
    let name: String
    let ageRange: Range<Int>
}

let car = Toy(name: "Racing Car", ageRange: Range(40...65))

let data = try! JSONEncoder().encode(car)

var request = URLRequest(url: URL(string: "http://localhost:3000/toys")!)
request.httpMethod = "POST"
request.addValue("application/json", forHTTPHeaderField: "Content-Type")
request.httpBody = data

URLSession.shared.dataTask(with: request) { data, response, error in
    
}.resume()
