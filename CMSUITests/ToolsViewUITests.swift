//
//  ToolsViewUITests.swift
//  CMSUITests
//
//  Created by Jaspreet Singh on 2/27/19.
//  Copyright © 2019 Jaspreet Singh. All rights reserved.
//

import XCTest

class ToolsViewUITests: XCTestCase {
    
    var app: XCUIApplication!
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app = XCUIApplication()
        app.launchArguments.append("ToolListTable")
        app.launch()
        print(app.debugDescription)
//        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    func testAAloginScreenLoginButton() {
        
        let loginButton =  app.buttons["Log In"]
        if !loginButton.exists {
            XCTAssertTrue(loginButton.exists, "Button not exist")
        }
        loginButton.tap()
    }
    
    
    func testCollectionView() {
        testAAloginScreenLoginButton()
        sleep(2)
        
    }
    
    func testAselectprojectButtonUI() {
        testAAloginScreenLoginButton()
        sleep(2)
        let selectProjectButton = app.buttons["Select Project"]
        if !selectProjectButton.exists {
            
            XCTAssert(selectProjectButton.exists, "Button not exists")
        }
        selectProjectButton.tap()
    }
    
    func testABTableView() {
        
        testAselectprojectButtonUI()
        sleep(2)
        let listtable = app.tables["table--allTableView"]
//        let mytable = app.tables.matching(identifier: "table--allTableView")
        let mycell = listtable.cells.matching(.cell, identifier: "myCell_3")
        if !listtable.exists {
            XCTAssert(listtable.exists, "TableView not Exists")
        }
        if !mycell.element.exists {
            XCTAssert(mycell.element.exists, "cell not create")
        }

        XCTAssertTrue(listtable.exists, "TableView Exists")
        mycell.element.tap()

    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        
    }
    
}
