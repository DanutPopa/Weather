//
//  HomeVM.swift
//  Weather
//
//  Created by Danut Popa on 01.11.2025.
//

import Foundation

@Observable class HomeVM {
    var dailyForecasts: [DailyForecast] = []
    private var currentWeather: CurrentWeather?
    var weatherForecast: WeatherForecast?
    var weatherType: WeatherType?
    
    func fetchWeather() async {
        do {
            let locations = try await Api.shared.fetchLocation(for: <#T##String#>)
            guard let location = locations?.first else { return }
            let (currentWeather, weatherForecast) = try await Api.shared.fetchWeather(lat: location.lat, lon: location.lon)
            self.currentWeather = currentWeather
            self.weatherForecast = weatherForecast
        } catch {
            print(error)
        }
    }
    
    func getCurrentWeather() -> CurrentWeather? {
        guard let currentWeather else { return nil }
        return currentWeather
    }
}
