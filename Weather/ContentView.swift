//
//  ContentView.swift
//  Weather
//
//  Created by Danut Popa on 03.04.2024.
//

import SwiftUI

struct ContentView: View {

  @State private var isNight = false
  @State private var city = ""
  @State private var weatherDays = Days.weatherData
  @State private var weatherResponse: (Weather, City)?
  @State private var isFetchingWeather = false

  let geocodingClient = GeocodingClient()
  let weatherClient = WeatherClient()

  private func fetchWeather() async {
    do {
      guard let location = try await geocodingClient.coordinateByCity(city) else { return }
      weatherResponse = try await weatherClient.fetchWeather(location: location)
    } catch {
      print(error)
    }
  }

  var body: some View {
    ZStack {
      BackgroundView(isNight: isNight)

      VStack {

        TextField("City", text: $city)
          .textFieldStyle(.roundedBorder)
          .onSubmit {
            isFetchingWeather = true
          }.task(id: isFetchingWeather) {
            if isFetchingWeather {
              await fetchWeather()
              isFetchingWeather = false
              city = ""
            }
          }


        if let weatherResponse {
          CityTextView(cityName: weatherResponse.1.name)

          MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: MeasurementFormatter.temperature(value: weatherResponse.0.temp))
        }


        HStack(spacing: 20) {
          ForEach(weatherDays) { day in
            WeatherDayView(dayOfWeek: day.dayName.rawValue, imageName: day.imageName.rawValue, temperature: day.temperature)
          }
        }

        Spacer()

        Button {
          isNight.toggle()
        } label: {
          WeatherButton(title: "Change Day Time",
                        textColor: .white,
                        backgroundColor: .mint)
        }
      }
      .padding()
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

struct WeatherDayView: View {
  let dayOfWeek: String
  let imageName: String
  let temperature: Int

  var body: some View {
    VStack {
      Text(dayOfWeek.uppercased())
        .font(.system(size: 16, weight: .medium))
        .foregroundColor(.white)

      Image(systemName: imageName)
        .symbolRenderingMode(.multicolor)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 40, height: 40)

      Text("\(temperature)°")
        .font(.system(size: 28, weight: .medium))
        .foregroundColor(.white)
    }
  }
}

struct BackgroundView: View {
  let isNight: Bool

  var body: some View {
    LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue,
                                               isNight ? .gray : Color("lightBlue")]),
                   startPoint: .topLeading,
                   endPoint: .bottomTrailing)
    .ignoresSafeArea()
  }
}

struct CityTextView: View {
  let cityName: String

  var body: some View {
    Text(cityName)
      .font(.system(size: 32, weight: .medium, design: .default))
      .foregroundColor(.white)
      .padding()
  }
}

struct MainWeatherStatusView: View {
  let imageName: String
  let temperature: String

  var body: some View {
    VStack(spacing: 10) {
      Image(systemName: imageName)
        .renderingMode(.original)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 180, height: 180)

      Text("\(temperature)°")
        .font(.system(size: 70, weight: .medium))
        .foregroundColor(.white)
    }
    .padding(.bottom, 40)
  }
}


