//
//  DailyForecast.swift
//  Weather
//
//  Created by Danut Popa on 01.11.2025.
//

import SwiftUI

struct DailyForecast {
    let day: String
    let description: String
    var temperatures: [Double] = []
    
    var averageTemperature: Double {
        return temperatures.average()
    }
}
