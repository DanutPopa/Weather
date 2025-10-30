//
//  Day.swift
//  Weather
//
//  Created by Danut Popa on 30.10.2025.
//

import Foundation

struct Day {
    let dayOfWeek: String
    let imageName: String
    let temperature: Int
    
    static let weatherDays: [Day] = [
        Day(dayOfWeek: "SUN", imageName: "sun.max.fill", temperature: 20),
        Day(dayOfWeek: "MON", imageName: "cloud.sun.fill", temperature: 10),
        Day(dayOfWeek: "TUE", imageName: "cloud.rain", temperature: 4),
        Day(dayOfWeek: "WED", imageName: "wind.snow", temperature: 0),
        Day(dayOfWeek: "THU", imageName: "sunset.fill", temperature: 11)
    ]
}
