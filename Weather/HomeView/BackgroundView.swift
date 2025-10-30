//
//  BackgroundView.swift
//  Weather
//
//  Created by Danut Popa on 30.10.2025.
//

import SwiftUI

struct BackgroundView: View {
    let topColor: Color
    let bottomColor: Color
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .ignoresSafeArea()
    }
}

#Preview {
    BackgroundView(topColor: .blue, bottomColor: Color("lightBlue"))
}
