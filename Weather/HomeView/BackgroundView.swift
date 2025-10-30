//
//  BackgroundView.swift
//  Weather
//
//  Created by Danut Popa on 30.10.2025.
//

import SwiftUI

struct BackgroundView: View {
    let isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .ignoresSafeArea()
    }
}

#Preview {
    BackgroundView(isNight: false)
}
