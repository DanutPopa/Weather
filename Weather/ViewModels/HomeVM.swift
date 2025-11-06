//
//  HomeVM.swift
//  Weather
//
//  Created by Danut Popa on 01.11.2025.
//

import Foundation

@Observable class HomeVM {
    var dailyForecasts: [DailyForecast] = []
    var currentWeather: CurrentWeather?
    var weatherType: WeatherType?
    
    func fetchWeather() async {
        do {
           let locations = try await Api.shared.fetchLocation(for: <#T##String#>)
           let (currentWeather, weatherForecast) = try await Api.shared.fetchWeather(lat: <#T##Double#>, lon: <#T##Double#>)
        } catch {
            print(error)
        }
    }
}
