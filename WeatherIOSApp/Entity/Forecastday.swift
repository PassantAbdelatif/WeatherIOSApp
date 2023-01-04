//
//  Forecastday.swift
//
//  Created by Passant Abdelatif on 03/01/2023
//  Copyright (c) . All rights reserved.
//

import Foundation

struct Forecastday: Codable {

  enum CodingKeys: String, CodingKey {
    case dateEpoch = "date_epoch"
    case hour
    case astro
    case day
    case date
  }

  var dateEpoch: Int?
  var hour: [Hour]?
  var astro: Astro?
  var day: Day?
  var date: String?
}
