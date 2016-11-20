//
//  UIViewController+DisplayAlert.swift
//  AdMyCar
//
//  Created by Kelvin Lau on 2016-11-20.
//  Copyright © 2016 Kelvin Lau. All rights reserved.
//

import UIKit

extension UIViewController {
  func displayAlert(message: String) {
    let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
    let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
    alertController.addAction(okAction)
    present(alertController, animated: true, completion: nil)
  }
}
