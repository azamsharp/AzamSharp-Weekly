//
//  Weather.swift
//  WeatherAppYT
//
//  Created by Mohammad Azam on 8/14/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//

import Foundation

struct WeatherResponse: Decodable {
    let main: Weather
}

struct Weather: Decodable {
    let temp: Double?
    let humidity: Double?
    
    static var placeholder: Weather {
        return Weather(temp: nil, humidity: nil)
    }
    
}
