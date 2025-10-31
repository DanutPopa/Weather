//
//  SearchLocation.swift
//  Weather
//
//  Created by Danut Popa on 30.10.2025.
//

import Foundation

struct SearchLocation: Codable {
    let name: String
    let lat: Double
    let lon: Double
    let country: String
    let state: String?
}
