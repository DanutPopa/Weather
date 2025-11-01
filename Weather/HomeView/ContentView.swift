//
//  ContentView.swift
//  Weather
//
//  Created by Danut Popa on 29.10.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight = false
    @State private var currentWeather: CurrentWeather?
    @State private var weatherForecast: WeatherForecast?
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: isNight)
            
            if let currentWeather {
                VStack {
                    CityTextView(cityName: currentWeather.name)
                    
                    MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                                          temperature: Int(currentWeather.main.temp))
                    .padding(.bottom, 40)
                    
                    HStack(spacing: 20) {
                        ForEach(Day.weatherDays, id: \.dayOfWeek) { day in
                            WeatherDayView(day: day)
                        }
                    }
                    
                    Spacer()
                    
                    Button {
                        isNight.toggle()
                    } label: {
                        WeatherButton(title: "Change Day Time",
                                      textColor: .white,
                                      backgroundColor: .mint)
                    }
                    Spacer()
                }
            }
            
        }
        .task {
            Api.shared.fetchSample(CurrentWeather.self) { weather in
                guard let weather else { return }
                currentWeather = weather
            }
            Api.shared.fetchSample(WeatherForecast.self) { forecast in
                guard let forecast else { return }
                weatherForecast = forecast
            }
//            Api.shared.fetchSample([SearchLocation].self) { locations in
//                guard let locations else { return }
//                print(locations)
//            }
        }
    }
}

#Preview {
    ContentView()
}
