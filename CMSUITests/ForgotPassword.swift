//
//  ForgotPassword.swift
//  CMSUITests
//
//  Created by Jaspreet Singh on 2/27/19.
//  Copyright © 2019 Jaspreet Singh. All rights reserved.
//

import XCTest

class ForgotPassword: XCTestCase {
    
    var app1: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app1 = XCUIApplication()
        
        app1.launchArguments.append("uitesting")
        XCUIApplication().launch()
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    //    let app = XCUIApplication()
    //    let scrollViewsQuery = app.scrollViews
    //    let elementsQuery = scrollViewsQuery.otherElements
    //    elementsQuery.buttons["Forgot your password?"].tap()
    //    scrollViewsQuery.otherElements.containing(.image, identifier:"logo").element.tap()
    //    elementsQuery.staticTexts["Enter your account's email address and we'll send you instructions on how to proceed."].tap()
    //    elementsQuery.buttons["Send Reset Link"].tap()
    //    app.alerts["CMS"].buttons["OK"].tap()
    //    elementsQuery.buttons["back"].tap()
    
    func testlogoUI(){
        
        let logoImage = app1.images["logo"]
        if !logoImage.exists {
            XCTFail("logo image not match")
        }
        logoImage.tap()
    }
    
    func testForgotButtonUI() {
        
        let forgotButton =   app1.buttons["Forgot your password?"]
        if !forgotButton.exists {
            XCTAssertTrue(forgotButton.exists, "Button not exist")
        }
        forgotButton.tap()
    }
    
    func testToolbarUI() {
        let toolButton = app1.buttons["Toolbar Done Button"]
        if !toolButton.exists {
            XCTAssertTrue(toolButton.exists, "Done not exist")
        }
        toolButton.tap()
    }
    
    func testForgotTextFieldUI() {
        let emailTextfield = app1.textFields["Email"]
        if !emailTextfield.exists {
            XCTAssert(emailTextfield.exists, "emailTextField not exist")
        }
        emailTextfield.tap()
    }
    
    func testbackButtonUI() {
        let backButton =   app1.buttons["back"]
        if !backButton.exists {
            XCTAssertTrue(backButton.exists, "Button not exist")
        }
        backButton.tap()
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
}

