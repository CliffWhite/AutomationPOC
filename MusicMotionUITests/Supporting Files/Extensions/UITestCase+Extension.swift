//
//  UITestCase+Extension.swift
//  MusicMotionUITests
//
//  Created by Cliff White on 6/18/17.
//  Copyright © 2017 Apple Inc. All rights reserved.
//

import Foundation
import XCTest

extension XCTestCase {
    
    func waitForElementToAppear(element: XCUIElement, timeout: Int, file: String = #file, line: UInt = #line) {
        let existsPredicate = NSPredicate(format: "exists == true")
        expectation(for: existsPredicate, evaluatedWith: element, handler: nil)
        
        waitForExpectations(timeout: TimeInterval(timeout)) { (error) -> Void in
            if (error != nil) {
                let message = "Failed to find \(element) after \(TimeInterval(timeout)) seconds."
                self.recordFailure(withDescription: message, inFile: file, atLine: line, expected: true)
            }
        }
    }
    
    func findStaticTextByString(_ staticText: String) -> XCUIElement {
        let foundElement = XCUIApplication().staticTexts[staticText]
        return foundElement
    }
    
    func resetAllSimulators() {
        //TODO: Figure out how to do this; or be better about cleaning the 
        // from: https://stackoverflow.com/questions/5125243/how-can-i-reset-the-ios-simulator-from-the-command-line
        //killall "Simulator" 2> /dev/null; xcrun simctl erase all
        //https://stackoverflow.com/questions/43014600/how-to-execute-terminal-command-in-swift
        
    }
    
}
