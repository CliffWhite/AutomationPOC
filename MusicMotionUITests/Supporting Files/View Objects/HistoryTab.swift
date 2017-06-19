//
//  HistoryTab.swift
//  MusicMotionUITests
//
//  Created by Cliff White on 6/19/17.
//  Copyright © 2017 Apple Inc. All rights reserved.
//

import Foundation
import XCTest

class HistoryTab : BaseViewObject{
    let app = XCUIApplication()
    let historyButton = XCUIApplication().tabBars.buttons["History"]
    let alert = XCUIApplication().alerts["“MusicMotion” Would Like to Access Your Motion & Fitness Activity"]
    
    
    func chooseHistoryTab() {
        historyButton.tap()
        //TODO: Verify on the tab by existence of some element
        
    }
    
    func interactWithAlert(allow: Bool) {
        if allow {
            XCUIApplication().alerts["“MusicMotion” Would Like to Access Your Motion & Fitness Activity"].buttons["OK"].tap()
        } else {
            XCUIApplication().alerts["“MusicMotion” Would Like to Access Your Motion & Fitness Activity"].buttons["Don't Allow"].tap()
        }
    }
    
    func alertExists() -> Bool {
        return XCUIApplication().alerts["“MusicMotion” Would Like to Access Your Motion & Fitness Activity"].buttons["OK"].exists
    }
    
}
