//
//  LogIn.swift
//  MusicMotionUITests
//
//  Created by Cliff White on 6/18/17.
//  Copyright © 2017 Apple Inc. All rights reserved.
//

import Foundation
import XCTest


class LogIn : BaseViewObject{
    let app = XCUIApplication()
    let loginButton = XCUIApplication().buttons["Login"]
    let userNameTextField = XCUIApplication().textFields["user name"]
    let passwordSecureTextField = XCUIApplication().secureTextFields["password"]
    
    
    func logIn(user: String, password: String) {
        userNameTextField.tap()
        userNameTextField.typeText(user)
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText(password)
        loginButton.tap()
    }
    
    func clearCredentials() {
        //FIXME: why is this not removing UserDefaults key?!!!!!!!!!!
        let preferences = UserDefaults.standard
        preferences.removeObject(forKey: "session")
        print(UserDefaults.standard.synchronize())
        print("\n--------> \(#function), session exists after synchronize?: \(String(describing: preferences.object(forKey: "session"))) ")
        UserDefaults.resetStandardUserDefaults()
        print("\n--------> \(#function), session exists after resetStandardUserDefaults?: \(String(describing: preferences.object(forKey: "session"))) ")
        print(UserDefaults.standard.synchronize())
        

        
      //  self.delay(2)
//        app.terminate()
//        app.launch()
    }
    
//    func delay(_ delay:Int64) {
//        sleep(delay)
//    }
    
    
    
}
