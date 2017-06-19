//
//  MusicActivityTests.swift
//  MusicMotionUITests
//
//  Created by Cliff White on 6/18/17.
//  Copyright © 2017 Apple Inc. All rights reserved.
//

import XCTest

class MusicActivityTests: BaseTestCase {
    var m = MusicActivity()
    override func setUp() {
        super.setUp()
        // Make sure I am logged in with a known good user
//        let  l = LogIn()
//        // if so session token login, if there IS a token, let's assume it's a user we want (in REAL tests we would make SURE)
//        let preferences = UserDefaults.standard
//        if preferences.object(forKey: "session") == nil{
//            l.logIn(user: TestData.GOODUSER1, password: TestData.GOODPASSWORD1)
//        }
        
        
        
        
    }
    
    
    
    func testMusicTabContent(){
        // Let's assume these are strings we KNOW must be present through either mocking, content seeding or other
        let targetString1 = ["label" : "Some 70's British rock band", "subLabel" : "That Champion Song"]
        let targetString2 = ["label" : "Haunting Irish female singer", "subLabel" : "Something by a haunting Irish female singer"]
        let targetString3 = ["label" : "An upbeat electronic artist", "subLabel" : "Another song that validates me"]
        
        var searchStrings = [[String : String]]()
        searchStrings.append(targetString1)
        searchStrings.append(targetString2)
        searchStrings.append(targetString3)
        
        
        
        
        // Make sure on music tab
        var m = MusicActivity()
        m.chooseMusicTab()
        
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
