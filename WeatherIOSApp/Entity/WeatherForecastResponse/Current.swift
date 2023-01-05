//
//  Current.swift
//
//  Created by Passant Abdelatif on 03/01/2023
//  Copyright (c) . All rights reserved.
//

import Foundation

class Current: Codable {

  enum CodingKeys: String, CodingKey {
    case condition
    case humidity
    case windMph = "wind_mph"
    case tempF = "temp_f"

  }

  var condition: Condition?
  var humidity: Int?
  var windMph: Float?
  var tempF: Float?


    //Info: each tempF should have "°F" at the end
    
    private var _weatherTempF: String?
    var weatherTempF: String? {
        
        if self._weatherTempF != nil {
            return _weatherTempF
        }
        if let tempF  = tempF {
            self._weatherTempF = "\(tempF)°F"
        }
        return _weatherTempF
    }
    
}
