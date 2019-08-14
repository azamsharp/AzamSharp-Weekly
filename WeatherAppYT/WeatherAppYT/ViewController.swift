//
//  ViewController.swift
//  WeatherAppYT
//
//  Created by Mohammad Azam on 8/14/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//

import UIKit
import Combine

class ViewController: UIViewController {

    @IBOutlet weak var temperatureLabel: UILabel!
    
    private var webservice = Webservice()
    private var cancellable: AnyCancellable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.cancellable = self.webservice.fetchWeather()
            .catch { _ in Just(Weather.placeholder) }
            .map {
                if let temp = $0.temp {
                    return "\(temp) ℉"
                } else {
                    return "Error"
                }
        }
            .assign(to: \.text, on: self.temperatureLabel)
        
    }


}

