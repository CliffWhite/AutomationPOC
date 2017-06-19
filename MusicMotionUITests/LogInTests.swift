//
//  LogInTests.swift
//  MusicMotionUITests
//
//  Created by Cliff White on 6/18/17.
//  Copyright © 2017 Apple Inc. All rights reserved.
//

import UIKit
import XCTest

class LogInTests : BaseTestCase {
    
    let  l = LogIn()
    
    
    
    func testGoodLogin() {
        l.clearCredentials()
        l.logIn(user: TestData.GOODUSER1, password: TestData.GOODPASSWORD1)
        print()
    }
    
//    func testBadUserLogin() {
//        l.clearCredentials()
//        l.logIn(user: TestData.BADUSER1, password: TestData.GOODPASSWORD1)
//        // assert that we didn't land on another page
//    }
//    
//    func testBadPasswordLogin() {
//        l.clearCredentials()
//        l.logIn(user: TestData.GOODUSER1, password: TestData.BADPASSWORD1)
//        // assert that we didn't land on another page
//    }
}
