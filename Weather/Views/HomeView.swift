//
//  ContentView.swift
//  Weather
//
//  Created by Danut Popa on 29.10.2025.
//

import SwiftUI

struct HomeView: View {
    @State private var isNight = false
    @State private var vm = HomeVM()
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: isNight)
            
            if let currentWeather = vm.currentWeather {
                VStack {
                    CityTextView(cityName: currentWeather.name)
                    
                    MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                                          temperature: currentWeather.main.temp)
                    .padding(.bottom, 40)
                    
                    
                    if let weatherType = vm.weatherType {
                        HStack(spacing: 20) {
                            ForEach(vm.dailyForecasts, id: \.day) { dailyForecast in
                                WeatherDayView(dailyForecast: dailyForecast, weatherType: weatherType)
                            }
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
        .onAppear {
            vm.fetchWeather()
        }
    }
}

#Preview {
    HomeView()
}
