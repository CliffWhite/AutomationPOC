//
//  MusicActivity.swift
//  MusicMotionUITests
//
//  Created by Cliff White on 6/18/17.
//  Copyright © 2017 Apple Inc. All rights reserved.
//

import Foundation
import XCTest


class MusicActivity : BaseViewObject{
    let app = XCUIApplication()
    let tablesQuery = XCUIApplication().tables
    let musicButton = XCUIApplication().tables.buttons["Music"]
    
    
    func chooseMusicTab() {
        let tabBarsQuery = app.tabBars
//        let musicButton = tabBarsQuery.buttons["Music"]
        musicButton.tap()
    }
    
    
    func chooseCellWithText(text: String) {
        
    }
    

}
