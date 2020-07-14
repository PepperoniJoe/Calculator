//
//  SelectionViewController.swift
//  Calculator
//
//  Created by Marcy Vernon on 7/5/19.
//  Copyright © 2019 Marcy Vernon. All rights reserved.
//

import UIKit

/*
 This class is used on the selection popover and allows the user
 to select the scheme desired.
*/

class SelectionViewController: UIViewController {
  
  var delegate: PassDataDelegate?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.accessibilityIdentifier = "selectionVC"  // for UI testing
  }
  
  @IBAction private func cancelSelection(_ sender: Any) {
     dismiss(animated: true)
  }
  
  // Save selection, pass data back to calculator and dismiss the Selection view controller
  @IBAction private func makeSelection(_ sender: UIButton) {
    UserDefaults.standard.set(sender.tag, forKey: Save.theme.rawValue)
    delegate?.passData(theme: sender.tag)
    dismiss(animated: true)
  }
}
