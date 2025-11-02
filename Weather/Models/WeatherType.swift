//
//  WeatherType.swift
//  Weather
//
//  Created by Danut Popa on 02.11.2025.
//

import SwiftUI

enum WeatherType {
    case sunny, clear, cloudy, snowy, foggy, misty, rainy, windy, none
    
    init(_ description: String) {
        switch description.lowercased() {
        case let str where str.contains("sun"):
            self = .sunny
        case let str where str.contains( "clear"):
            self = .clear
        case let str where str.contains( "cloud"):
            self = .cloudy
        case let str where str.contains( "snow"):
            self = .snowy
        case let str where str.contains("fog"):
            self = .foggy
        case let str where str.contains("mist"):
            self = .misty
        case let str where str.contains("rain"):
            self = .rainy
        case let str where str.contains("wind"):
            self = .windy
        default:
            self = .none
        }
    }
    
    var icon: Image? {
        switch self {
        case .sunny, .clear:
            Image(systemName: "sun.max.fill")
        case .cloudy:
            Image(systemName: "cloud.fill")
        case .snowy:
            Image(systemName: "snowflake.fill")
        case .foggy, .misty:
            Image(systemName: "cloud.fog.fill")
        case .rainy:
            Image(systemName: "cloud.rain.fill")
        case .windy:
            Image(systemName: "wind.fill")
        case .none:
            nil
        }
    }
    
    var background: Color {
        switch self {
        case .sunny, .clear:
                .sunnyBackground
        case .cloudy, .foggy, .misty:
                .cloudyBackground
        case .snowy:
                .snowyBackground
        case .rainy:
                .rainyBackground
        case .windy:
                .windyBackground
        case .none:
                .white
        }
    }
}
