//
//  CityTextView.swift
//  Weather
//
//  Created by Danut Popa on 30.10.2025.
//

import SwiftUI

struct CityTextView: View {
    let cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.largeTitle)
            .fontWeight(.medium)
            .foregroundStyle(.white)
            .padding()
    }
}

#Preview {
    CityTextView(cityName: "Cupertino, CA")
}
