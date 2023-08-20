//
//  WeatherService.swift
//  Weather
//
//  Created by Elizaveta Shidlovskaya on 20.08.23.
//

import Foundation

final class WeatherService {
    private let apiKey: String = "13c0fb416c67522ef40fa34a1e5c2526"
    
    func getWeather() {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?id=2172797&appid=\(apiKey)") else { return }
                
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                let json = try? JSONDecoder().decode(City.self, from: data)
                print(json)
            }
        }.resume()
    }
}
