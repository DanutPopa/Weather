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
            vm.fetchCurrentWeather()
            vm.fetchWeatherForecast()

//            Api.shared.fetchSample([SearchLocation].self) { locations in
//                guard let locations else { return }
//                print(locations)
//            }
        }
    }
}

#Preview {
    HomeView()
}
