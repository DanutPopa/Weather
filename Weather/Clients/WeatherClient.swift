//
//  WeatherClient.swift
//  Weather
//
//  Created by Danut Popa on 14.05.2024.
//

import Foundation

struct WeatherClient {
  
  func fetchWeather(location: Location) async throws -> (Weather, City) {

    let (data, response) = try await URLSession.shared.data(from: APIEndpoint.endpointURL(for: .weatherByLatLon(location.lat, location.lon)))
    
    guard let httpResponse = response as? HTTPURLResponse,
          httpResponse.statusCode == 200 else {
      throw NetworkError.invalidResponse
    }
     
    let weatherResponse = try JSONDecoder().decode(WeatherResponse.self, from: data)
    let cityResponse = try JSONDecoder().decode(City.self, from: data)
    return (weatherResponse.main, cityResponse)
  }

}
