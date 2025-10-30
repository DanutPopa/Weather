//
//  VStack.swift
//  Weather
//
//  Created by Danut Popa on 30.10.2025.
//

import SwiftUI

struct WeatherDayView: View {
    let dayOfWeek: String
    let imageName: String
    let temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.headline)
                .foregroundStyle(.white)
            
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
            
            Text("\(temperature)°")
                .font(.title)
                .fontWeight(.medium)
                .foregroundStyle(.white)
        }
    }
}
