//
//  Webservice.swift
//  WeatherAppYT
//
//  Created by Mohammad Azam on 8/14/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//

import Foundation
import Combine

class Webservice {
    
    func fetchWeather() -> AnyPublisher<Weather, Error> {
        
        let url = "http://api.openweathermap.org/data/2.5/weather?q=Houston&appid=7d2dd8c9c5578b741c7735ad3f0d39ea&units=imperial"
        
        guard let weatherURL = URL(string: url) else {
            fatalError("Invalid URL")
        }
        
        return URLSession.shared.dataTaskPublisher(for: weatherURL)
            .map { $0.data }
            .decode(type: WeatherResponse.self, decoder: JSONDecoder())
            .map { $0.main }
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
        
    }
    
}
