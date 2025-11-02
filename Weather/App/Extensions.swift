//
//  Extensions.swift
//  Weather
//
//  Created by Danut Popa on 01.11.2025.
//

import Foundation

extension [Double] {
    func average() -> Double {
        guard isEmpty == false else { return 0 }
        let sum = reduce(0, +)
        return sum / Double(self.count)
    }
}

extension Int {
    func toDay() -> String {
        let date = Date(timeIntervalSince1970: Double(self))
        return date.formatted(Date.FormatStyle().weekday(.abbreviated))
    }
}

extension [WeatherForecastList] {
    func getDailyForecasts() -> [DailyForecast] {
        var dailyForecasts: [DailyForecast] = []
        
        for item in self {
            let dt = item.dt.toDay()
            let temp = item.main.temp
            
            guard dailyForecasts.count > 0 else {
                let newDay = parse(using: item)
                dailyForecasts.append(newDay)
                continue
            }
            
            if dailyForecasts.last?.day == dt {
                let j = dailyForecasts.count - 1
                dailyForecasts[j].temperatures.append(temp)
            } else {
                let newDay = parse(using: item)
                dailyForecasts.append(newDay)
            }
        }
        
        return dailyForecasts
    }
    
    private func parse(using item: WeatherForecastList) -> DailyForecast {
        var dailyForecast = DailyForecast(day: item.dt.toDay(), description: item.weather.first?.main ?? "")
        dailyForecast.temperatures.append(item.main.temp)
        return dailyForecast
    }
}
