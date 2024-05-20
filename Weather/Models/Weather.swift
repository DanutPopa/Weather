//
//  Weather.swift
//  Weather
//
//  Created by Danut Popa on 14.05.2024.
//

import Foundation

struct WeatherResponse: Decodable {
  let main: Weather
  let weather: [WeatherDescription]
}

struct Weather: Decodable {
  let temp: Double
}

struct City: Decodable {
  let name: String
}

struct WeatherDescription: Decodable {
  let icon: String
}

