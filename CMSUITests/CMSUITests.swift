//
//  CMSUITests.swift
//  CMSUITests
//
//  Created by Jaspreet Singh on 1/31/19.
//  Copyright © 2019 Jaspreet Singh. All rights reserved.
//

import XCTest

class CMSUITests: XCTestCase {
    
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
    
    
    func testLoginlogoUI() {
        
        let scrollView = app1.scrollViews.otherElements.containing(.image, identifier: "logo")
        if !scrollView.element.exists {
            XCTAssertTrue(scrollView.element.exists, "logo not exist")
        }
        scrollView.element.tap()
        let logoImage = app1.images["logo"]
        if !logoImage.exists {
            XCTAssert(logoImage.exists, "logoImage not Match")
        }
        let headingLabel = app1.staticTexts["Login To Your Account"]
        if !headingLabel.exists {
            XCTAssert(headingLabel.exists, "heading spelling not correct")
        }
        headingLabel.tap()
    }
    
    func testloginTextFieldUI() {
        
        //EmailTextField
        let emailTextField = app1.textFields["Email"]
        if !emailTextField.exists {
            XCTAssertTrue(emailTextField.exists, "TextField not exist")
        }
        emailTextField.tap()
        XCTAssertEqual(emailTextField.value as! String, "Email", "Email is not correct")
        
        sleep(2)
        //PasswordTextField
        let passwordTextField = app1.textFields["Password"]
        if !passwordTextField.exists {
            XCTAssertTrue(passwordTextField.exists, "TextField not exist")
        }
        passwordTextField.tap()
        
        let passwordSecureTextField = app1.secureTextFields["Password"]
        XCTAssertTrue(passwordSecureTextField.exists, "Text field doesn't exist")
        passwordSecureTextField.typeText("CM")
        app1/*@START_MENU_TOKEN@*/.buttons["shift"]/*[[".keyboards.buttons[\"shift\"]",".buttons[\"shift\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        passwordSecureTextField.typeText("S")
        
        let moreKey = app1/*@START_MENU_TOKEN@*/.keys["more"]/*[[".keyboards",".keys[\"more, numbers\"]",".keys[\"more\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/
        moreKey.tap()
        moreKey.tap()
        
    }
    
    func testloginScreenLoginButton() {
        
        let loginButton =  app1.buttons["Log In"]
        if !loginButton.exists {
            XCTAssertTrue(loginButton.exists, "Button not exist")
        }
        loginButton.tap()
        
        // let checkAlert = app1.alerts["CMS"]
        //        _ = waitForAlertAndTapButton(text: "Please enter pass", identifier: "OK", app: app1)
        
        //        let check = waitForAlertAndTapButton(text: "Please enter pass", identifier: "OK", app: app1)
        
        //        if !checkAlert.exists {
        //             XCTAssert(checkAlert.exists, "Alert not showing")
        //        }
        //      let msg = checkAlert.staticTexts["Please enter email"]
        //
        //        checkAlert.buttons["OK"].tap()
    }
    
    func waitForAlertAndTapButton(text:String,identifier:String,app:XCUIApplication) -> XCTWaiter.Result
    {
        let alert = app.alerts[text]
        let alertw = waiterResultWithExpectation(alert, timeOutInterval: 3)
        app.buttons[identifier].tap()
        return  waiterResultWithExpectation(alert, timeOutInterval: 3)
    }
    
    //Wait for Result
    func waiterResultWithExpectation(_ element: XCUIElement, timeOutInterval: TimeInterval) -> XCTWaiter.Result {
        let myPredicate = NSPredicate(format: "exists == true")
        let myExpectation = expectation(for: myPredicate, evaluatedWith: element,
                                        handler: nil)
        let result = XCTWaiter().wait(for: [myExpectation], timeout: timeOutInterval)
        
        return result
    }
    
    func testRemeberMeUI() {
        
        let rememberme = app1.staticTexts["Remember Me"]
        let untickButton =   app1.buttons["untick icon"]
        let tickButton = app1.buttons["tick icon"]
        if !rememberme.exists {
            XCTAssert(rememberme.exists, "Text not Match")
        }
        if !tickButton.exists {
            XCTAssertTrue(tickButton.exists, "Button not exist")
        }
        //
        rememberme.tap()
        tickButton.tap()
        if !untickButton.exists {
            XCTAssertTrue(untickButton.exists, "Button not exist")
        }
        
        untickButton.tap()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        
    }
    
    func testExample() {
        
        let loginButton =  app1.buttons["Log In"]
        if loginButton.exists {
            
            loginButton.tap()
        } else {
            XCTAssertTrue(loginButton.exists, "Button not exist")
        }
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
}

