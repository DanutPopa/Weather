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
    
    let appId = "6e4a0c1183758f9ceeef911bcdc88d31"
    
    enum Endpoint: String {
        case currentWeather = "/data/2.5/weather"
        case weatherForecast = "/data/2.5/forecast"
        case searchLocation = "/geo/1.0/direct"
    }
    
    // MARK: - Fetch sample data
    func fetchSample<T: Decodable>(_ type: T.Type, completion: @escaping (T?) -> Void) {
        let resource = getResourceName(type)
        guard let path = Bundle.main.path(forResource: resource, ofType: "json") else {
            completion(nil)
            return
        }
        let url = URL(filePath: path)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        do {
            let data = try Data(contentsOf: url)
            let decodedData = try decoder.decode(type, from: data)
            completion(decodedData)
        } catch {
            print(error)
            completion(nil)
        }
    }
    
    private func getResourceName<T>(_ type: T.Type) -> String {
        return switch type {
        case is CurrentWeather.Type:
            "CurrentWeather"
        case is WeatherForecast.Type:
            "WeatherForecast"
        case is [SearchLocation].Type:
            "SearchLocation"
        default:
            ""
        }
    }
    
    //MARK: - Fetch live data
    
    private func fetch<T: Decodable>(_ type: T.Type, request: URLRequest) async throws -> T? {
        guard request.url != nil else {
            throw URLError(.badServerResponse)
        }
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            if let httpResponse = response as? HTTPURLResponse,
               httpResponse.statusCode >= 200 && httpResponse.statusCode < 300 {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let decodedData = try decoder.decode(type, from: data)
                return decodedData
            } else {
                throw(URLError(.badServerResponse))
            }
        } catch {
            print("Error decoding weather: \(error.localizedDescription)")
        }
        return nil
    }
    
    private func constructURl(for endpoint: Endpoint, _ lat: Double?, _ lon: Double?, city: String?) -> URLRequest? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.openweathermap.org"
        components.path = endpoint.rawValue
        
        switch endpoint {
        case .currentWeather, .weatherForecast:
            guard let lat, let lon else { return nil }
            components.queryItems = [
                URLQueryItem(name: "lat", value: "\(lat)"),
                URLQueryItem(name: "lon", value: "\(lon)"),
                URLQueryItem(name: "appid", value: appId),
                URLQueryItem(name: "units", value: "metric")
            ]
        case .searchLocation:
            guard let city else { return nil }
            components.queryItems = [
                URLQueryItem(name: "q", value: city),
                URLQueryItem(name: "limit", value: "5"),
                URLQueryItem(name: "appid", value: appId)
            ]
        }
        
        guard let url = components.url else { return nil }
        var request = URLRequest(url: url,
                                 cachePolicy: .useProtocolCachePolicy,
                                 timeoutInterval: 10)
        
        request.httpMethod = "GET"
        return request
    }
    
    func fetchWeather(lat: Double, lon: Double) async throws -> (CurrentWeather?, WeatherForecast?) {
        guard let currentWeatherRequest = constructURl(for: .currentWeather, lat, lon, city: nil),
              let weatherForecastRequest = constructURl(for: .weatherForecast, lat, lon, city: nil)
        else {
            return (nil, nil)
        }
        async let currentWeatherData = fetch(CurrentWeather.self, request: currentWeatherRequest)
        async let weatherForecastData = fetch(WeatherForecast.self, request: weatherForecastRequest)
        
        return try await (currentWeatherData, weatherForecastData)
        
        return (nil, nil)
    }
    
    func fetchLocation(for city: String) async throws -> [SearchLocation]? {
        // Construct URLRequest object x1 for the fetch function for searching a location
        guard let searchLocationURL = constructURl(for: .searchLocation, nil, nil, city: city) else {
            return nil
        }
        
        let searchLocations = try await fetch([SearchLocation].self, request: searchLocationURL)
        
        return searchLocations
    }
}
