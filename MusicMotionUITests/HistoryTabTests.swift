//
//  HistoryTabTests.swift
//  MusicMotionUITests
//
//  Created by Cliff White on 6/19/17.
//  Copyright © 2017 Apple Inc. All rights reserved.
//

import XCTest

class HistoryTabTests: BaseTestCase {
        let h = HistoryTab()
    let  l = LogIn()
    
    override func setUp() {
        super.setUp()
        // if login screen, login (since we don't know the state of login - if we care we'll test at the test function level
        if h.historyButton.exists {
            h.chooseHistoryTab()
        }
        else {
            // login
            if l.loginButton.exists {
                l.logIn(user: TestData.GOODUSER1, password: TestData.GOODPASSWORD1)
            }
        }
    }
    
    func testVerifySomeStuff() {
       
        // Make sure we're on the tab
        h.chooseHistoryTab()
        sleep(1)
        if h.alertExists() {
            h.interactWithAlert(allow: true)
        }
        // Do some stuff; I suspect it works on the real phone but simulator can't access motion kit
        XCTAssertNotNil(nil) //FIXME: since no tests let's assume this is TDD and we don't have code yet
        
        
        
    }
    
    
}
