//
//  OnBoardingViewController.swift
//  Calculator
//
//  Created by Marcy Vernon on 7/7/19.
//  Copyright © 2019 Marcy Vernon. All rights reserved.
//

import UIKit

/*
 This class is used to create the onboarding popover that occurs the
 first time the user uses the calculator. After the first showing, the
 onboarding popover is not shown again unless reinstalled.
 */

class OnBoardingViewController: UIViewController {
  
  @IBOutlet weak var viewOnBoard: UIView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.accessibilityIdentifier = "onboardingView"  // for UI testing
  }
  
  override func viewDidAppear(_ animated: Bool) {
    animateOnBoard()
  }
  
  // Animate the onboarding sign into visible view
  private func animateOnBoard() {
    UIView.animate(withDuration: 2.0,
                   delay       : 1.0,
                   animations  : { self.viewOnBoard.alpha = CGFloat(1.0) },
                   completion  : nil)
  }
  
  // Dismiss the onboarding sign and arrow
  @IBAction private func gotIt(_ sender: Any) {
    dismiss(animated: true)
  }
}

