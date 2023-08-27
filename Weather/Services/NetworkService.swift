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
    
    func getWeather(completion: @escaping (MainWeather) -> Void) {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/forecast?id=625144&lang=ru&appid=13c0fb416c67522ef40fa34a1e5c2526&units=metric") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request) { responseData, response, error in
            if let error = error {
                print(error.localizedDescription)
            } else if let jsonData = responseData {
                let json = try? JSONDecoder().decode(MainWeather.self, from: jsonData)
                DispatchQueue.main.async {
                    completion(json.)
                }
            }
        }.resume()
    }
    
    
   
    
    private let requiredHeaders: [String: String] = [
        "X-RapidAPI-Key": "2f2610d3b1mshfb494c5847b8bdfp1db3c6jsn3045bd3c22f7",
        "X-RapidAPI-Host": "biggest-cities3.p.rapidapi.com"
    ]
    
    func getCities(completion: @escaping () -> Void) {
        
        guard let url = URL(string: "https://biggest-cities3.p.rapidapi.com/bigcityes/1") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = requiredHeaders
        
        let params = [
                    "id": 1
    
                ]
                request.httpBody = params
                    .map { "\($0)=\($1)" }
                    .joined()
                    .data(using: .utf8)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let jsonData = data else { return }
            print(String(data: jsonData, encoding: .utf8))
            let responseModel = try? JSONDecoder().decode(.self, from: jsonData)
            DispatchQueue.main.async {
                completion( ?? [])
            }
        }.resume()
    }
   
}
