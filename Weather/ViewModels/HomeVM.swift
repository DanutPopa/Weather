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
    
    func fetchCurrentWeather() {
        Api.shared.fetchSample(CurrentWeather.self) { [ weak self] weather in
            guard let self, let weather else { return }
            currentWeather = weather
        }
    }
    
    func fetchWeatherForecast() {
        Api.shared.fetchSample(WeatherForecast.self) { [weak self] forecast in
            guard let self, let list = forecast?.list else { return }
            dailyForecasts = list.getDailyForecasts()
        }
    }
}
