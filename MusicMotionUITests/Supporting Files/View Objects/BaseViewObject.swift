//
//  BaseViewObject.swift
//  MusicMotionUITests
//
//  Created by Cliff White on 6/18/17.
//  Copyright © 2017 Apple Inc. All rights reserved.
//

import Foundation

import XCTest

class BaseViewObject {
    
    func waitForElement(xctc: XCTestCase, element: XCUIElement, timeout: Int) {
        xctc.waitForElementToAppear(element: element, timeout: timeout)
    }
    
    // found here: https://stackoverflow.com/questions/24034544/dispatch-after-gcd-in-swift/24318861#24318861
    // If a closure is passed as an argument to a function and it is invoked after the function returns, the closure is //escaping. It is also said that the closure argument escapes the function body
    func delay(_ delay:Double, closure:@escaping ()->()) {
        let when = DispatchTime.now() + delay
        DispatchQueue.main.asyncAfter(deadline: when, execute: closure)
    }
    
}
