//
//  HTTPClientProtocol.swift
//  IntroductionToMocking
//
//  Created by Mohammad Azam on 4/26/20.
//  Copyright © 2020 Mohammad Azam. All rights reserved.
//

import Foundation

protocol HTTPClientProtocol {
    func authenticate(username: String, password: String, completion: @escaping (User?) -> Void )
}
