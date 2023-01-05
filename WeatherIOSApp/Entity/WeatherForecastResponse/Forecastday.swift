//
//  Forecastday.swift
//
//  Created by Passant Abdelatif on 03/01/2023
//  Copyright (c) . All rights reserved.
//

import Foundation

protocol checkIfDateIdFriday {
    mutating func checkIfDateIsFriday()
}

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
    var isFriday: Bool?
}

extension Forecastday: checkIfDateIdFriday {
   
    mutating func checkIfDateIsFriday() {
        if let date = self.date?.toDate() {
            if date.getWeekDay() == .friday {
                self.isFriday = true
            }
        }
    }
}
