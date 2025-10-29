//
//  ContentView.swift
//  Weather
//
//  Created by Danut Popa on 29.10.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .white]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack {
                Text("Cupertino, CA")
                    .font(.largeTitle)
                    .fontWeight(.medium)
                    .foregroundStyle(.white)
                    .padding()
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}
