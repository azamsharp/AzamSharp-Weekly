//
//  IntroductionToMockingUITests.swift
//  IntroductionToMockingUITests
//
//  Created by Mohammad Azam on 4/25/20.
//  Copyright © 2020 Mohammad Azam. All rights reserved.
//

import XCTest
@testable import IntroductionToMocking

class when_user_login_successfully: XCTestCase {

    private var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        self.app = XCUIApplication()
        self.continueAfterFailure = true
        self.app.launchEnvironment = ["ENV": "TEST"]
        self.app.launch()
    }
    
    func test_display_user_information_on_screen() {
        
        let usernameTextField = self.app.textFields["usernameTextField"]
        let passwordTextField = self.app.textFields["passwordTextField"]
        
        usernameTextField.tap()
        usernameTextField.typeText("JohnDoe")
        
        passwordTextField.tap()
        passwordTextField.typeText("password")
        
        self.app.buttons["loginButton"].tap()
        
        let companyLabel = self.app.staticTexts["companyLabel"]
        let nameLabel = self.app.staticTexts["nameLabel"]
        
        XCTAssertEqual("ABC Inc", companyLabel.label)
        XCTAssertEqual("John Doe", nameLabel.label)
        
    }
    
}
