//
//  MainWeatherView.swift
//  Weather
//
//  Created by Danut Popa on 30.10.2025.
//

import SwiftUI

struct MainWeatherStatusView: View {
    let imageName: String
    let temperature: Int
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundStyle(.white)
        }
    }
}

#Preview {
    MainWeatherStatusView(imageName: "cloud.sun.fill", temperature: 74)
}
