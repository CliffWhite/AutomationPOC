//
//  Profile.swift
//  MusicMotionUITests
//
//  Created by Cliff White on 6/19/17.
//  Copyright © 2017 Apple Inc. All rights reserved.
//

import Foundation
import XCTest

class ProfileActivity : BaseViewObject{
    let app = XCUIApplication()
    let profileButton = XCUIApplication().tabBars.buttons["About Me"]
    var profileTextView = XCUIApplication().textViews["profileText"]
    
    func chooseProfileTab() {
        profileButton.tap()
    }
    func tapLogOutButton() {
        
    }
    
    func textOfProfileText() -> String {
        
        guard let text  = profileTextView.value else {
            return ""
        }
        
        return String(describing: text)
    }
    
    func setTextOfProfile(_ newText : String) {
        // Can genericize and do a clear and type extension on UIElement like found on the internet
        // No time today, trying to hurry
        
        // Let's pretend we have a persistence layer implemented and persist this data. We'd want to check that this persists over relaunches
        
        guard let stringValue = profileTextView.value as? String else {
            if profileTextView.value == nil {
                profileTextView.typeText(newText)
            }
            return
        }
        profileTextView.tap()
        let deleteString = stringValue.characters.map { _ in XCUIKeyboardKeyDelete }.joined(separator: "")
        //FIXME: Why is this not working?
        profileTextView.typeText(deleteString)
        profileTextView.typeText(newText)
        
    }
    
}
