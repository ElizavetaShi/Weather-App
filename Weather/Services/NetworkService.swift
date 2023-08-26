//
//  WeatherService.swift
//  Weather
//
//  Created by Elizaveta Shidlovskaya on 20.08.23.
//

import Foundation

final class NetworkService {
    private let apiKey: String = "13c0fb416c67522ef40fa34a1e5c2526"
    
    let tempId = "625144"
    let tempLang = "ru"
    
//    func getWeather(completion: @escaping (City?) -> Void) {
//        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?id=\(tempId)&lang=\(tempLang)&appid=\(apiKey)&units=metric") else { return }
//
//        let request = URLRequest(url: url)
//        URLSession.shared.dataTask(with: request) { responseData, response, error in
//            if let error = error {
//                print(error.localizedDescription)
//            } else if let jsonData = responseData {
//                let json = try? JSONDecoder().decode(City.self, from: jsonData)
//                DispatchQueue.main.async {
//                    completion(json)
//                }
//            }
//        }.resume()
//    }
    
    func getWeather(completion: @escaping (MainWeather?) -> Void) {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/forecast?id=625144&lang=ru&appid=13c0fb416c67522ef40fa34a1e5c2526&units=metric") else { return }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { responseData, response, error in
            if let error = error {
                print(error.localizedDescription)
            } else if let jsonData = responseData {
                let json = try? JSONDecoder().decode(MainWeather.self, from: jsonData)
                DispatchQueue.main.async {
                    completion(json)
                }
            }
        }.resume()
    }
}
