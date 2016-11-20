//
//  ImageCollectionCell.swift
//  AdMyCar
//
//  Created by Kelvin Lau on 2016-11-19.
//  Copyright © 2016 Kelvin Lau. All rights reserved.
//

import UIKit

final class ImageCollectionCell: UICollectionViewCell {
  static let reuseIdentifier = "\(ImageCollectionCell.self)"
  @IBOutlet fileprivate var imageView: UIImageView!
  @IBOutlet fileprivate var priceLabel: UILabel!
  
  var decal: Decal! {
    didSet {
      imageView.image = decal.image
      
      priceLabel?.text = "$\(Int(decal.price))"
    }
  }
  
  override func draw(_ rect: CGRect) {
    super.draw(rect)
    imageView.layer.cornerRadius = imageView.frame.height / 2
  }
}
