//
//  ContentView.swift
//  Weather
//
//  Created by Danut Popa on 29.10.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight = false
    
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: isNight)
            VStack {
                CityTextView(cityName: "Cupertino, CA")
                
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                                      temperature: 76)
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
}

#Preview {
    ContentView()
}
