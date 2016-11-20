//
//  BrandTableCell.swift
//  AdMyCar
//
//  Created by Kelvin Lau on 2016-11-19.
//  Copyright © 2016 Kelvin Lau. All rights reserved.
//

import UIKit

final class BrandTableCell: UITableViewCell {
  static let reuseIdentifier = "\(BrandTableCell.self)"
  @IBOutlet fileprivate var brandImageView: UIImageView!
  @IBOutlet fileprivate var brandNameLabel: UILabel!
  @IBOutlet fileprivate var designCountLabel: UILabel!
  @IBOutlet fileprivate var priceRangeLabel: UILabel!
  
  var brand: Brand! {
    didSet {
      brandImageView.image = brand.image
      brandNameLabel.text = brand.name
      designCountLabel.text = "\(brand.designs.count) designs"
      priceRangeLabel.text = brand.priceRange
    }
  }
}
