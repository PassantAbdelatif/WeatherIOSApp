//
//  Condition.swift
//
//  Created by Passant Abdelatif on 03/01/2023
//  Copyright (c) . All rights reserved.
//

import Foundation

struct Condition: Codable {

  enum CodingKeys: String, CodingKey {
    case icon
    case text
    case code
  }

  var icon: String?
  var text: String?
  var code: Int?


}
