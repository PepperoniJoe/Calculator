//
//  CalculatorUITests.swift
//  CalculatorUITests
//
//  Created by Marcy Vernon on 9/15/19.
//  Copyright © 2019 Marcy Vernon. All rights reserved.
//

import XCTest

class CalculatorUITests: XCTestCase {
  
  var app: XCUIApplication!
  
  override func setUp() {
    super.setUp()
    continueAfterFailure = false
    app = XCUIApplication()
    app.launch()
  }
  
  override func tearDown() {
    app = nil
    super.tearDown()
  }
  
  func testButtonsLabelsExist() {
    XCTAssertTrue(app.buttons["◉"].exists)
    XCTAssertTrue(app.buttons["0"].exists)
    XCTAssertTrue(app.buttons["1"].exists)
    XCTAssertTrue(app.buttons["2"].exists)
    XCTAssertTrue(app.buttons["3"].exists)
    XCTAssertTrue(app.buttons["4"].exists)
    XCTAssertTrue(app.buttons["5"].exists)
    XCTAssertTrue(app.buttons["6"].exists)
    XCTAssertTrue(app.buttons["7"].exists)
    XCTAssertTrue(app.buttons["8"].exists)
    XCTAssertTrue(app.buttons["9"].exists)
    XCTAssertTrue(app.buttons["+"].exists)
    XCTAssertTrue(app.buttons["−"].exists)
    XCTAssertTrue(app.buttons["×"].exists)
    XCTAssertTrue(app.buttons["÷"].exists)
    XCTAssertTrue(app.buttons["π"].exists)
    XCTAssertTrue(app.buttons["√"].exists)
    XCTAssertTrue(app.buttons["±"].exists)
    XCTAssertTrue(app.buttons["AC"].exists)
    XCTAssertTrue(app.buttons["="].exists)
    XCTAssertTrue(app.staticTexts["display"].exists)
  }
  
  func testCommasDisplayed() {
    app.buttons["1"].tap()
    app.buttons["1"].tap()
    app.buttons["1"].tap()
    app.buttons["1"].tap()
    app.buttons["="].tap()
    XCTAssertEqual(app.staticTexts["display"].label, "1,111")
  }
  
  func testDecimalDisplayed() {
    app.buttons["1"].tap()
    app.buttons["2"].tap()
    app.buttons["."].tap()
    app.buttons["9"].tap()
    app.buttons["="].tap()
    XCTAssertEqual(app.staticTexts["display"].label, "12.9")
  }
  
  func test8DecimalsOnly() {
    app.buttons["5"].tap()
    app.buttons["."].tap()
    app.buttons["0"].tap()
    app.buttons["1"].tap()
    app.buttons["2"].tap()
    app.buttons["3"].tap()
    app.buttons["4"].tap()
    app.buttons["5"].tap()
    app.buttons["6"].tap()
    app.buttons["7"].tap()
    app.buttons["8"].tap()
    app.buttons["9"].tap()
    app.buttons["8"].tap()
    app.buttons["7"].tap()
    app.buttons["="].tap()
    XCTAssertEqual(app.staticTexts["display"].label, "5.01234568")
  }
  
  func testProperRounding() {
    app.buttons["2"].tap()
    app.buttons["."].tap()
    app.buttons["3"].tap()
    app.buttons["×"].tap()
    app.buttons["3"].tap()
    app.buttons["="].tap()
    XCTAssertEqual(app.staticTexts["display"].label, "6.9")
  }
  
  func testDoubleDotConvertsToZero() {
    app.buttons["4"].tap()
    app.buttons["."].tap()
    app.buttons["."].tap()
    app.buttons["5"].tap()
    app.buttons["="].tap()
    XCTAssertEqual(app.staticTexts["display"].label, "0")
  }
  
  func testMultipleDotsConvertToZero() {
    app.buttons["4"].tap()
    app.buttons["."].tap()
    app.buttons["5"].tap()
    app.buttons["."].tap()
    app.buttons["9"].tap()
    app.buttons["."].tap()
    app.buttons["."].tap()
    app.buttons["3"].tap()
    app.buttons["="].tap()
    XCTAssertEqual(app.staticTexts["display"].label, "0")
  }
  
  func testNan() {
    app.buttons["1"].tap()
    app.buttons["±"].tap()
    app.buttons["√"].tap()
    XCTAssertEqual(app.staticTexts["display"].label, "NaN")
  }
  
  func testInfinity() {
    app.buttons["9"].tap()
    app.buttons["÷"].tap()
    app.buttons["0"].tap()
    app.buttons["="].tap()
    XCTAssertEqual(app.staticTexts["display"].label, "+∞")
    app.buttons["±"].tap()
    XCTAssertEqual(app.staticTexts["display"].label, "-∞")
  }
  
  
  func testSelectionVCExists() {
    app.buttons["◉"].tap()
    XCTAssertTrue(app.otherElements["selectionVC"].exists)
    
  }

}

