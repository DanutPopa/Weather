//
//  WeatherButton.swift
//  Weather
//
//  Created by Danut Popa on 04.04.2024.
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
      .foregroundColor(textColor)
      .font(.system(size: 20, weight: .bold, design: .default))
      .cornerRadius(10)
  }
}

#Preview {
  WeatherButton(title: "Button", textColor: .white, backgroundColor: .blue)
}
