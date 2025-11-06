//
//  WeatherForecast.swift
//  Weather
//
//  Created by Danut Popa on 31.10.2025.
//

import Foundation

struct WeatherForecast: nonisolated Decodable {
    let cod: String
    let message: Int
    let cnt: Int
    let list: [WeatherForecastList]
    let city: WeatherForecastCity
}

struct WeatherForecastList: Decodable {
    let dt: Int
    let main: WeatherForecastListMain
    let weather: [WeatherForecastWeather]
    let clouds : WeatherForecastClouds
    let wind: WeatherForecastWind
    let visibility: Int
    let pop: Int
    let sys: WeatherForecastSys
    let dtTxt: String
}

struct WeatherForecastListMain: Decodable {
    let temp: Double
    let feelsLike: Double
    let tempMin: Double
    let tempMax: Double
    let pressure: Int
    let seaLevel: Int
    let grndLevel: Int
    let humidity: Int
    let tempKf: Double
}

struct WeatherForecastWeather: Decodable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

struct WeatherForecastClouds: Decodable {
    let all: Int
}

struct WeatherForecastWind: Decodable {
    let speed: Double
    let deg: Int
    let gust: Double
}

struct WeatherForecastSys: Decodable {
    let pod: String
}

struct WeatherForecastCity: Decodable {
    let id: Int
    let name: String
    let coord: WeatherForecastCoord
    let country: String
    let population: Int
    let timezone: Int
    let sunrise: Int
    let sunset: Int
}

struct WeatherForecastCoord: Decodable {
    let lat: Double
    let lon: Double
}
