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
    

    
    func testGoodLogin() {
//        clearCredentials()
       let  l = LogIn()
        l.clearCredentials()
        l.logIn(user: TestData.GOODUSER1, password: TestData.GOODPASSWORD1)
        print()
        
    }
}
