//
//  SelectionService.swift
//  Calculator
//
//  Created by Marcy Vernon on 7/5/19.
//  Copyright © 2019 Marcy Vernon. All rights reserved.
//

import UIKit

struct SelectionService {
  
  func select() -> SelectionViewController {
    let storyboard = UIStoryboard(name: "Select", bundle: nil)
    let selectVC = storyboard.instantiateViewController(withIdentifier: "SelectVC") as! SelectionViewController
    return selectVC
  }
  
  func onBoard() -> OnBoardingViewController {
    let storyboard = UIStoryboard(name: "OnBoarding", bundle: nil)
    let onBoardVC = storyboard.instantiateViewController(withIdentifier: "OnBoardVC") as! OnBoardingViewController
    return onBoardVC
  }
}

