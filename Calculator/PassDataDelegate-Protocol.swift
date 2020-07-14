//
//  PassDataDelegate-Protocol.swift
//  Calculator
//
//  Created by Marcy Vernon on 7/6/19.
//  Copyright © 2019 Marcy Vernon. All rights reserved.
//

import Foundation

import UIKit

/*
 Protocol to pass data from second view controller back to original view controller
*/

protocol PassDataDelegate {
  func passData(theme: Int)
}

