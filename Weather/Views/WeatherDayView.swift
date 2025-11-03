//
//  VStack.swift
//  Weather
//
//  Created by Danut Popa on 30.10.2025.
//

import SwiftUI

struct WeatherDayView: View {
    let dailyForecast: DailyForecast
    let weatherType: WeatherType
    
    init(dailyForecast: DailyForecast, weatherType: WeatherType) {
        self.dailyForecast = dailyForecast
        self.weatherType = WeatherType(dailyForecast.description)
    }
    
    var body: some View {
        VStack {
            Text(dailyForecast.day)
                .font(.headline)
                .foregroundStyle(.white)
            
            if let image = weatherType.icon {
                image
                    .symbolRenderingMode(.multicolor)
                    .resizable()
                    .foregroundStyle(.white)
                    .scaledToFit()
                    .frame(width: 40, height: 40)
            }
            
            Text("\(Int(dailyForecast.averageTemperature))°")
                .font(.title)
                .fontWeight(.medium)
                .foregroundStyle(.white)
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    WeatherDayView(dailyForecast: DailyForecast(day: "MON", description: "Clouds"), weatherType: .cloudy)
}
