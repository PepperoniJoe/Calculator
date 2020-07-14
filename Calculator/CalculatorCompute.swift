//
//  CalculatorCompute.swift
//  Calculator model
//  Based in part on Stanford's and London App Brewery's calculator tutorials
//
//  Created by Marcy Vernon on 12/30/16.
//  Copyright © 2016 Marcy Vernon. All rights reserved.
//

import Foundation

/*
 Struct for the calculator's calculations.
 */

struct CalculatorCompute {
  
  private  var amass = 0.0
  var result: Double { return amass }
  
  private struct PendingBinaryOperationInfo {
    var firstOperand: Double
    var binaryFunction: (Double, Double) -> Double
  }
  
  private var pending: PendingBinaryOperationInfo?
  
  private enum Operation {
    case Constant(Double)
    case UnaryOperation((Double) -> Double)
    case BinaryOperation((Double, Double) -> Double)
    case Equals
  }
  
  private var operations: [String : Operation] = [
    "+"  : Operation.BinaryOperation(add),
    "−"  : Operation.BinaryOperation(subtract),
    "×"  : Operation.BinaryOperation(multiply),
    "÷"  : Operation.BinaryOperation(divide),
    "π"  : Operation.Constant(Double.pi),
    "√"  : Operation.UnaryOperation(sqrt),
    "±"  : Operation.UnaryOperation(plusMinus),
    "AC" : Operation.Constant(0),
    "="  : Operation.Equals
  ]
  
  // Sets amass
  mutating func setOperand(operand: Double) {
    amass = operand
  }
  
  // Create operation types
  mutating func performOperation(symbol: String) {
    if let operation = operations[symbol] {
      switch operation {
      case .Constant(let value)          : amass = value
      case .UnaryOperation(let function) : amass = function(amass)
      case .BinaryOperation(let function): pending = PendingBinaryOperationInfo(firstOperand: amass, binaryFunction: function)
      case .Equals                       : executePendingBinaryOperation()
      }
    }
  }
  
  private mutating func executePendingBinaryOperation() {
    if let pending = pending {
      amass = pending.binaryFunction(pending.firstOperand, amass)
      self.pending = nil
    }
  }
  
} // end of struct

fileprivate func add       (op1: Double, op2: Double) -> Double { return op1 + op2 }
fileprivate func subtract  (op1: Double, op2: Double) -> Double { return op1 - op2 }
fileprivate func multiply  (op1: Double, op2: Double) -> Double { return op1 * op2 }
fileprivate func divide    (op1: Double, op2: Double) -> Double { return op1 / op2 }
fileprivate func plusMinus (op1: Double)              -> Double { return op1 * -1}
