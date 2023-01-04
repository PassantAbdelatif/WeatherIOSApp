//
//  Current.swift
//
//  Created by Passant Abdelatif on 03/01/2023
//  Copyright (c) . All rights reserved.
//

import Foundation

struct Current: Codable {

  enum CodingKeys: String, CodingKey {
    case condition
    case humidity
    case tempC = "temp_c"
    case lastUpdated = "last_updated"
    case pressureIn = "pressure_in"
    case feelslikeF = "feelslike_f"
    case uv
    case windDegree = "wind_degree"
    case isDay = "is_day"
    case windDir = "wind_dir"
    case feelslikeC = "feelslike_c"
    case precipMm = "precip_mm"
    case cloud
    case windMph = "wind_mph"
    case visMiles = "vis_miles"
    case precipIn = "precip_in"
    case lastUpdatedEpoch = "last_updated_epoch"
    case tempF = "temp_f"
    case gustKph = "gust_kph"
    case visKm = "vis_km"
    case windKph = "wind_kph"
    case pressureMb = "pressure_mb"
    case gustMph = "gust_mph"
  }

  var condition: Condition?
  var humidity: Int?
  var tempC: Int?
  var lastUpdated: String?
  var pressureIn: Float?
  var feelslikeF: Float?
  var uv: Int?
  var windDegree: Int?
  var isDay: Int?
  var windDir: String?
  var feelslikeC: Float?
  var precipMm: Int?
  var cloud: Int?
  var windMph: Float?
  var visMiles: Int?
  var precipIn: Int?
  var lastUpdatedEpoch: Int?
  var tempF: Float?
  var gustKph: Float?
  var visKm: Int?
  var windKph: Float?
  var pressureMb: Int?
  var gustMph: Float?

}
