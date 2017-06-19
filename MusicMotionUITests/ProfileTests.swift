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
    let profileText = "This is Cliff and Allison from Austin, Tx. Currently we are outside on the deck since there is apparently a gas leak in our house."
    
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
                // wait
                self.waitForElementToAppear(element: p.profileButton, timeout: 10)
                p.chooseProfileTab()
            }
        }
    }
    
    
    func testVerifyContentOfProfile() {
        XCTAssert(p.textOfProfileText() == profileText)
    }
    
    func testLogoutWorks() {
        app.buttons["Logout"].tap()
        self.waitForElementToAppear(element: l.userNameTextField, timeout: 5)
        XCTAssert(l.userNameTextField.exists) //TODO: verify that 'exists' means what I think
        
    }
    
    func testCanChangeProfileText() {
        let newProfileText = "I've said too much; tell me more about you!"
        p.setTextOfProfile(newProfileText)
        
        //TODO: We'd want to relaunch the app and make sure the new text persisted; let's pretend for now.
        //TODO: Quit the app and relaunch (or just sniff the network for the write)
        //TODO: Verify the new text is there
        XCTAssert(p.textOfProfileText() == newProfileText)
        
        
    }
    
}
