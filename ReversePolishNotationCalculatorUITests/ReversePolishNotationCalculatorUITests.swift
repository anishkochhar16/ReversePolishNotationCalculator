//
//  ReversePolishNotationCalculatorUITests.swift
//  ReversePolishNotationCalculatorUITests
//
//  Created by Anish Kochhar on 09/06/2020.
//  Copyright © 2020 Anish Kochhar. All rights reserved.
//

import XCTest

class ReversePolishNotationCalculatorUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testThatCalculatorDisplaysExpressionInTextField() {
        
        let app = XCUIApplication()
        app.launch()
        
        app.buttons["8"].tap()
        app.buttons["0"].tap()
        app/*@START_MENU_TOKEN@*/.buttons["Enter"].staticTexts["Enter"]/*[[".buttons[\"Enter\"].staticTexts[\"Enter\"]",".staticTexts[\"Enter\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/.tap()
        app.buttons["6"].tap()
        app.buttons["*"].tap()
        
        let textViewText = app.textViews.element.value as! String
        XCTAssertEqual(textViewText, "80 6 * ")
    }
    
    func testThatCalcultorGivesAnswerInTextField() {
        let app = XCUIApplication()
        app.launch()
        
        app.buttons["6"].tap()
        app.buttons["0"].tap()
        app/*@START_MENU_TOKEN@*/.buttons["Enter"].staticTexts["Enter"]/*[[".buttons[\"Enter\"].staticTexts[\"Enter\"]",".staticTexts[\"Enter\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/.tap()
        app.buttons["7"].tap()
        app.buttons["1"].tap()
        app.buttons["-"].tap()
        app.buttons["EVAL"].tap()
        
        let textViewText = app.textViews.element.value as! String
        XCTAssertEqual(textViewText, "-11")
        
    }
    
    func testTextViewIsNotSelectableAndButtonsAre() {
        let app = XCUIApplication()
        app.launch()
        
        XCTAssertEqual(app.textViews.element.isSelected, false)
        XCTAssertEqual(app.buttons["5"].isEnabled, true)
        XCTAssertEqual(app.buttons["5"].isSelected, false)
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
