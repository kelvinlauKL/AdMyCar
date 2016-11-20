//
//  Server+Earnings.swift
//  AdMyCar
//
//  Created by Kelvin Lau on 2016-11-19.
//  Copyright © 2016 Kelvin Lau. All rights reserved.
//

import Alamofire

extension Server {
  enum EarningsReport {
    case success(Double), failure(Error)
  }
  
  static var earningsURL: URL! {
    return URL(string: "", relativeTo: Server.baseURL)
  }

  static func fetchEarnings(forUserId id: String, completion: @escaping (EarningsReport) -> ()) {
    Alamofire.request(Server.earningsURL, method: .get).responseJSON { response in
      if let data = response.data {
        print(data)

      } else if let error = response.result.error {
        completion(.failure(error))
      }
    }
  }
}
