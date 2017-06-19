//
//  ProfileTests.swift
//  MusicMotionUITests
//
//  Created by Cliff White on 6/19/17.
//  Copyright © 2017 Apple Inc. All rights reserved.
//

import XCTest

class ProfileTests: BaseTestCase {
      let p = ProfileActivity()
    let  l = LogIn()
    
    override func setUp() {
        super.setUp()
        // if login screen, login (since we don't know the state of login - if we care we'll test at the test function level
        if p.profileButton.exists {
            p.chooseProfileTab()
        }
        else {
            // login
            if l.loginButton.exists {
                l.logIn(user: TestData.GOODUSER1, password: TestData.GOODPASSWORD1)
            }
        }
    }
    
    
    func testVerifyContent() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        
        print()
    }
    
    func testLogoutWorks() {
        let app = XCUIApplication()
        app.tabBars.buttons["About Me"].tap()
        app.buttons["Logout"].tap()
        XCTAssert(app.textFields["user name"].exists) //TODO: verify that 'exists' means what I think
        
    }
    
    func testCanChangeProfileText() {
        
    }
    
}
