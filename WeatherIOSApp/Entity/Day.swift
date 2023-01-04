//
//  Day.swift
//
//  Created by Passant Abdelatif on 03/01/2023
//  Copyright (c) . All rights reserved.
//

import Foundation

struct Day: Codable {

  enum CodingKeys: String, CodingKey {
    case dailyWillItRain = "daily_will_it_rain"
    case avgtempF = "avgtemp_f"
    case dailyChanceOfSnow = "daily_chance_of_snow"
    case condition
    case mintempF = "mintemp_f"
    case uv
    case avgvisMiles = "avgvis_miles"
    case totalprecipIn = "totalprecip_in"
    case totalprecipMm = "totalprecip_mm"
    case maxwindKph = "maxwind_kph"
    case totalsnowCm = "totalsnow_cm"
    case maxtempC = "maxtemp_c"
    case avgvisKm = "avgvis_km"
    case mintempC = "mintemp_c"
    case dailyWillItSnow = "daily_will_it_snow"
    case avgtempC = "avgtemp_c"
    case maxwindMph = "maxwind_mph"
    case avghumidity
    case maxtempF = "maxtemp_f"
    case dailyChanceOfRain = "daily_chance_of_rain"
  }

  var dailyWillItRain: Int?
  var avgtempF: Float?
  var dailyChanceOfSnow: Int?
  var condition: Condition?
  var mintempF: Float?
  var uv: Int?
  var avgvisMiles: Int?
  var totalprecipIn: Float?
  var totalprecipMm: Float?
  var maxwindKph: Float?
  var totalsnowCm: Int?
  var maxtempC: Float?
  var avgvisKm: Int?
  var mintempC: Float?
  var dailyWillItSnow: Int?
  var avgtempC: Float?
  var maxwindMph: Float?
  var avghumidity: Int?
  var maxtempF: Float?
  var dailyChanceOfRain: Int?
}
