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
    
    func chooseProfileTab() {
        profileButton.tap()
    }
    func tapLogOutButton() {
        
    }
    
}
