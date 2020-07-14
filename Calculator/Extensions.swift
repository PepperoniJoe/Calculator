//
//  Extensions.swift
//  Calculator
//
//  Created by Marcy Vernon on 4/20/19.
//  Copyright © 2019 Marcy Vernon. All rights reserved.
//

import UIKit

//MARK: Add commas to displayed value, extend decimals and avoid precision rounding errors.
extension Double {
  private static var numberFormatter: NumberFormatter = {
    let formatter                   = NumberFormatter()
    formatter.numberStyle           = .decimal
    formatter.maximumFractionDigits = 8
    return formatter
  }()
  
  var withCommas: String {
    return Double.numberFormatter.string(from: NSNumber(value: self)) ?? ""
  }
}


//MARK: Round labels and buttons
extension UIView {
  func round(radius: CGFloat? = nil) {
    self.layer.cornerRadius  = radius ?? self.frame.width / 2
    self.clipsToBounds       = true
    self.layer.masksToBounds = true
  }
}

//MARK: Adjust button font size
extension UIButton {
  @IBInspectable var adjustFontSizeToWidth: Bool {
    get {
      return self.titleLabel?.adjustsFontSizeToFitWidth ?? false
    }
    set {
      self.titleLabel?.numberOfLines                     = 1
      self.titleLabel?.adjustsFontSizeToFitWidth         = newValue
      self.titleLabel?.lineBreakMode                     = .byClipping
      self.titleLabel?.baselineAdjustment                = .alignCenters
      self.titleLabel?.adjustsFontForContentSizeCategory = true
    }
  }
}
