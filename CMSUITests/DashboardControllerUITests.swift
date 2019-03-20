//
//  DashboardControllerUITests.swift
//  CMSUITests
//
//  Created by Singh Arshdeep on 2/18/19.
//  Copyright © 2019 Jaspreet Singh. All rights reserved.
//

import XCTest

class DashboardControllerUITests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        
        //        let elementsQuery = app.scrollViews.otherElements
        //        elementsQuery.buttons["Log In"].tap()
        //
        //        let collectionViewsQuery = app.collectionViews
        //        let cellsQuery = collectionViewsQuery.cells
        //        cellsQuery.otherElements.containing(.image, identifier:"RFI'S").element.swipeUp()
        //        collectionViewsQuery/*@START_MENU_TOKEN@*/.staticTexts["RFI'S"]/*[[".cells.staticTexts[\"RFI'S\"]",".staticTexts[\"RFI'S\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeUp()
        //        cellsQuery.otherElements.containing(.image, identifier:"Punch List").element.swipeUp()
        //
        //        let app2 = app
        //        let app = app2
        //        app.tabBars.buttons["Dashboard"].tap()
        //        elementsQuery.tables.children(matching: .other).element(boundBy: 1).staticTexts[">next 7 days"].swipeUp()
        //
        //        let tablesQuery = app2.scrollViews.otherElements.tables
        //        let staticText = tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["+ 4"]/*[[".cells.staticTexts[\"+ 4\"]",".staticTexts[\"+ 4\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        //        staticText.swipeUp()
        //        staticText.tap()
        //        app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 2).children(matching: .other).element.children(matching: .scrollView).element(boundBy: 1).children(matching: .other).element.swipeDown()
        //        app2/*@START_MENU_TOKEN@*/.staticTexts["Info"]/*[[".scrollViews.staticTexts[\"Info\"]",".staticTexts[\"Info\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        //        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Sat"]/*[[".cells.staticTexts[\"Sat\"]",".staticTexts[\"Sat\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
}

