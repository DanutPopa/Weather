//
//  VStack.swift
//  Weather
//
//  Created by Danut Popa on 30.10.2025.
//

import SwiftUI

struct WeatherDayView: View {
    let day: Day
    
    var body: some View {
        VStack {
            Text(day.dayOfWeek)
                .font(.headline)
                .foregroundStyle(.white)
            
            Image(systemName: day.imageName)
                .symbolRenderingMode(.multicolor)
                .resizable()
                .foregroundStyle(.white)
                .scaledToFit()
                .frame(width: 40, height: 40)
            
            Text("\(day.temperature)°")
                .font(.title)
                .fontWeight(.medium)
                .foregroundStyle(.white)
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    WeatherDayView(day: Day(dayOfWeek: "TUE", imageName: "sun.cloud.fill", temperature: 10))
}
