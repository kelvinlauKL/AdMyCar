//
//  Server+Location.swift
//  AdMyCar
//
//  Created by Kelvin Lau on 2016-11-19.
//  Copyright © 2016 Kelvin Lau. All rights reserved.
//

import Alamofire

extension Server {
  static var locationURL: URL! {
    return URL(string: "", relativeTo: Server.baseURL)
  }
  
  static func postLocation(latitude: Double, longitude: Double, timeCreated: Date) {
    let params: [String: Any] = [
      "latitude": latitude,
      "longitude": longitude,
      "timeCreated": timeCreated
    ]
    Alamofire.request(Server.locationURL, method: .post, parameters: params).responseJSON { response in
    }
  }
}
