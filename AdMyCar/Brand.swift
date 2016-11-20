//
//  Brand.swift
//  AdMyCar
//
//  Created by Kelvin Lau on 2016-11-19.
//  Copyright © 2016 Kelvin Lau. All rights reserved.
//

import UIKit

struct Brand {
  let name: String
  let image: UIImage
  let designs: [Decal]
  
  var priceRange: String {
    let min = designs.min { $0.price < $1.price }?.price
    let max = designs.max { $0.price < $1.price }?.price
    
    if let min = min, let max = max {
      return "$\(Int(min)) - \(Int(max))"
    } else {
      return "TBA"
    }
  }
}

// MARK: - TestBrands
extension Brand {
  static var testData: [Brand] {
    return [
      Brand(name: "Apple", image: #imageLiteral(resourceName: "appleLogo"), designs: Decal.appleDecals),
      Brand(name: "Launch Academy", image: #imageLiteral(resourceName: "launchAcademyLogo"), designs: []),
      Brand(name: "Spring University", image: #imageLiteral(resourceName: "springuLogo"), designs: []),
      Brand(name: "Lighthouse Labs", image: #imageLiteral(resourceName: "lighthouseLogo"), designs: []),
      Brand(name: "Hootsuite", image: #imageLiteral(resourceName: "hootsuiteLogo"), designs: []),
      Brand(name: "SimpleReno", image: #imageLiteral(resourceName: "simplerenoLogo"), designs: [])
    ]
  }
}
