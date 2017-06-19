//
//  BaseTestCase.swift
//  MusicMotionUITests
//
//  Created by Cliff White on 6/18/17.
//  Copyright © 2017 Apple Inc. All rights reserved.
//

import UIKit
import XCTest

class BaseTestCase: XCTestCase {
    
    let app = XCUIApplication()
    
    /**
     Run once before any tests in this suite
 */
    override class func setUp() {
        super.setUp()
        print("\n ---> once before")
    }
    
    /**
     Run once after all tests in this suite
     */
    override class func tearDown() {
        super.tearDown()
        print("\n ---> once after")
    }
    
    
    override func setUp() {
        
        super.setUp()
        self.continueAfterFailure = true
        app.launch() // Might not want to launch the app at the end of each test but let's be good test citizens for now
    }
    
    override func tearDown() {
        super.tearDown()
        //TODO: Report to the test case managing system here if needed.
        //TODO: Report to bug mgmt system (hopefully Jira since I already know how) here
        
    }
    
   
    
    
}
