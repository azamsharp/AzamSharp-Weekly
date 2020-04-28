//
//  HTTPClientFactory.swift
//  IntroductionToMocking
//
//  Created by Mohammad Azam on 4/26/20.
//  Copyright © 2020 Mohammad Azam. All rights reserved.
//

import Foundation

class HTTPClientFactory {
    static func create() -> HTTPClientProtocol {
        ProcessInfo.processInfo.environment["mockingEnvironment", default: "False"] == "True" ? MockedHTTPClient() : HTTPClient()
    }
}
