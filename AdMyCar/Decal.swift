//
//  Decal.swift
//  AdMyCar
//
//  Created by Kelvin Lau on 2016-11-19.
//  Copyright © 2016 Kelvin Lau. All rights reserved.
//

import UIKit

struct Decal {
  let name: String
  let price: Double
  let image: UIImage
}

extension Decal {
  static var appleDecals: [Decal] {
    return [
      Decal(name: "Jony Ive", price: 500, image: #imageLiteral(resourceName: "jonyIve")),
      Decal(name: "Apple", price: 200, image: #imageLiteral(resourceName: "blackwhiteapple")),
      Decal(name: "Rainbow Apple", price: 250, image: #imageLiteral(resourceName: "colorfulApple"))
    ]
  }
}
