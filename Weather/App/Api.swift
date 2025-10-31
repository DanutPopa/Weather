//
//  Api.swift
//  Weather
//
//  Created by Danut Popa on 31.10.2025.
//

import Foundation

class Api {
    static let shared = Api()
    private init() {}
    
    let apiKey = "6e4a0c1183758f9ceeef911bcdc88d31"
    
    func fetchCurrentWeather(for city: String) async throws -> CurrentWeather? {
        guard let location = try await fetchLocation(for: city),
              let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(location.lat)&lon=\(location.lon)&appid=\(apiKey)")
        else {
            throw(URLError.init(.badURL))
        }
        do {
             let (data, response) = try await URLSession.shared.data(from: url)
             if let httpResponse = response as? HTTPURLResponse,
               httpResponse.statusCode >= 200 && httpResponse.statusCode < 300 {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let decodedData = try decoder.decode(CurrentWeather.self, from: data)
                return decodedData
             } else {
                 throw(URLError(.badServerResponse))
             }
        } catch {
            print("Error decoding weather: \(error.localizedDescription)")
        }
        return nil
    }
    
    func fetchLocation(for city: String) async throws -> SearchLocation? {
        guard let url = URL(string: "http://api.openweathermap.org/geo/1.0/direct?q=\(city)&limit=5&appid=\(apiKey)") else {
            throw(URLError(.badURL))
        }
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            if let httpResponse = response as? HTTPURLResponse,
               httpResponse.statusCode >= 200 && httpResponse.statusCode < 300 {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let decodedData = try decoder.decode([SearchLocation].self, from: data)
                return decodedData.first
            } else {
                throw URLError(.badServerResponse)
            }
        } catch {
            print("Error decoding location: \(error.localizedDescription)")
        }
        return nil
    }
}
