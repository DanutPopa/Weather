//
//  WeatherButton.swift
//  Weather
//
//  Created by Danut Popa on 30.10.2025.
//

import SwiftUI

struct WeatherButton: View {
    let title: String
    let textColor: Color
    let backgroundColor: Color
    
    var body: some View {
        Text(title)
            .frame(width: 280, height: 50)
            .background(backgroundColor.gradient)
            .foregroundStyle(textColor)
            .font(.headline)
            .fontWeight(.bold)
            .clipShape(.rect(cornerRadius: 10))
    }
}

#Preview {
    WeatherButton(title: "Change Day Time", textColor: .blue, backgroundColor: .white)
}
