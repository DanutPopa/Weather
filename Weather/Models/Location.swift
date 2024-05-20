//
//  Location.swift
//  Weather
//
//  Created by Danut Popa on 14.05.2024.
//

import Foundation

struct Location: Decodable {
  let name: String
  let lat: Double
  let lon: Double
}
