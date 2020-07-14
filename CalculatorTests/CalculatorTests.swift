//
//  CalculatorTests.swift
//
//  Created by Marcy Vernon on 9/15/19.
//  Copyright © 2019 Marcy Vernon. All rights reserved.
//

import XCTest
@testable import Calculator

class CalculatorTests: XCTestCase {
  
  var compute: CalculatorCompute?
  
  override func setUp() {
    super.setUp()
    compute = CalculatorCompute()
  }
  
  override func tearDown() {
    compute = nil
    super.tearDown()
  }
  
  func testSetOperand() {
    compute?.setOperand(operand: 5.0)
    XCTAssertEqual(compute?.result, 5.0)
  }
  
  func testSetOperandBigger() {
    compute?.setOperand(operand: 67895.123)
    XCTAssertEqual(compute?.result, 67895.123)
  }
  
  func testSetOperandManyDecimals() {
    compute?.setOperand(operand: 6.12345678934567)
    XCTAssertEqual(compute?.result, 6.12345678934567)
  }
  
  func testSetOperandZero() {
    compute?.setOperand(operand: 0)
    XCTAssertEqual(compute?.result, 0.0)
  }
  
  func testSetOperandNegative() {
    compute?.setOperand(operand: -6546.3948)
    XCTAssertEqual(compute?.result, -6546.3948)
  }
  
  func testPlusMinus() {
    compute?.setOperand(operand: -123.48)
    compute?.performOperation(symbol: "±")
    XCTAssertEqual(compute?.result, 123.48)
  }
  
  func testAddition() {
    compute?.setOperand(operand: 8)
    compute?.performOperation(symbol: "+")
    compute?.setOperand(operand: 3)
    compute?.performOperation(symbol: "=")
    XCTAssertEqual(compute?.result, 11)
  }
  
  func testSubtraction() {
    compute?.setOperand(operand: 99.99)
    compute?.performOperation(symbol: "−")
    compute?.setOperand(operand: 9.9)
    compute?.performOperation(symbol: "=")
    XCTAssertEqual(compute?.result, 90.08999999999999)
  }
  
  func testMultiplication() {
    compute?.setOperand(operand: 16)
    compute?.performOperation(symbol: "×")
    compute?.setOperand(operand: 3)
    compute?.performOperation(symbol: "=")
    XCTAssertEqual(compute?.result, 48)
  }
  
  func testDivision() {
    compute?.setOperand(operand: 110)
    compute?.performOperation(symbol: "÷")
    compute?.setOperand(operand: 11)
    compute?.performOperation(symbol: "=")
    XCTAssertEqual(compute?.result, 10.0)
  }
  
  func testDivisionByZero() {
    compute?.setOperand(operand: 110)
    compute?.performOperation(symbol: "÷")
    compute?.setOperand(operand: 0)
    compute?.performOperation(symbol: "=")
    XCTAssert(compute?.result.isInfinite ?? false, "Expected isInfinite is true, got \(String(describing: compute?.result))")
  }
  
  func testAllClear() {
    compute?.setOperand(operand: 1675.98)
    compute?.performOperation(symbol: "AC")
    XCTAssertEqual(compute?.result, 0)
  }
  
  func testPi() {
    compute?.performOperation(symbol: "π")
    XCTAssertEqual(compute?.result, 3.141592653589793)
  }
  
  func testSquareRoot() {
    compute?.setOperand(operand: 25)
    compute?.performOperation(symbol: "√")
    XCTAssertEqual(compute?.result, 5)
  }
  
  func testNaN() {
    compute?.setOperand(operand: 1)
    compute?.performOperation(symbol: "±")
    compute?.performOperation(symbol: "√")
    XCTAssert(compute?.result.isNaN ?? false, "Expected isNan is true, got \(String(describing: compute?.result))")
  }
}
