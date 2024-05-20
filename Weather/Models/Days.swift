//
//  WeekDay.swift
//  Weather
//
//  Created by Danut Popa on 08.04.2024.
//

import Foundation

struct WeatherDay: Identifiable {
  var id = UUID()
  var dayName: WeekDay
  var imageName: ImageName
  var temperature: Int
}

struct Days {
  static var weatherData = [
              WeatherDay(dayName: .tuesday, imageName: .cloud, temperature: 88),
              WeatherDay(dayName: .wednesday, imageName: .sun, temperature: 88),
              WeatherDay(dayName: .thursday, imageName: .wind, temperature: 55),
              WeatherDay(dayName: .friday, imageName: .sunset, temperature: 60),
              WeatherDay(dayName: .saturday, imageName: .snow, temperature: 25)
  ]
}

enum WeekDay: String {
   case monday = "Mon", tuesday = "Tue", wednesday = "Wed", thursday = "Thu",
        friday = "Fri", saturday = "Sat", sunday = "Sun"
}

enum ImageName: String {
  case cloud = "cloud.sun.fill", sun = "sun.max.fill", wind = "wind.snow",
       snow = "snowflake", sunset = "sunset.fill"
}



