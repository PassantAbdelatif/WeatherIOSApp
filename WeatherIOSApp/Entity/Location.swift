//
//  Location.swift
//
//  Created by Passant Abdelatif on 03/01/2023
//  Copyright (c) . All rights reserved.
//

import Foundation

struct Location: Codable {

  enum CodingKeys: String, CodingKey {
    case localtimeEpoch = "localtime_epoch"
    case region
    case name
    case localtime
    case country
    case lon
    case tzId = "tz_id"
    case lat
  }

  var localtimeEpoch: Int?
  var region: String?
  var name: String?
  var localtime: String?
  var country: String?
  var lon: Float?
  var tzId: String?
  var lat: Float?
}
