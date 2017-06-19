//
//  MusicActivityTests.swift
//  MusicMotionUITests
//
//  Created by Cliff White on 6/18/17.
//  Copyright © 2017 Apple Inc. All rights reserved.
//

import XCTest

class MusicActivityTests: BaseTestCase {
    let  l = LogIn()
    var m = MusicActivity()
    // Let's assume these are strings we KNOW must be present through either mocking, content seeding or other
    let targetString1 = ["label" : "Some 70's British rock band", "subLabel" : "That Champion Song"]
    let targetString2 = ["label" : "Haunting Irish female singer", "subLabel" : "Something by a haunting Irish female singer"]
    let targetString3 = ["label" : "An upbeat electronic artist", "subLabel" : "Another song that validates me"]
    
    override func setUp() {
        super.setUp()
        // if login screen, login (since we don't know the state of login - if we care we'll test at the test function level
        if m.musicButton.exists {
            m.chooseMusicTab()
        }
        else {
            // login
            if l.loginButton.exists {
                l.logIn(user: TestData.GOODUSER1, password: TestData.GOODPASSWORD1)
                // wait
                self.waitForElementToAppear(element: m.musicButton, timeout: 10)
                m.chooseMusicTab()
            }
        }
    }
    
    
    
    func testMusicTabContent(){
        
        var searchStrings = [[String : String]]()
        searchStrings.append(targetString1)
        searchStrings.append(targetString2)
        searchStrings.append(targetString3)
        
        
        for target in searchStrings {
            // Assert each exists
            XCTAssertNotNil(self.findStaticTextByString(target["label"]!))
            XCTAssertNotNil(self.findStaticTextByString(target["subLabel"]!))
            self.findStaticTextByString(target["label"]!).tap()
            //TODO: Figure out how to find which image is displayed and assert on it
            //
        }
        
        
        print(app.debugDescription)
        print()
        
        
    }
    
}
