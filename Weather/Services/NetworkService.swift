//
//  WeatherService.swift
//  Weather
//
//  Created by Elizaveta Shidlovskaya on 20.08.23.
//

import Foundation

final class NetworkService {
    
    let tempId = "625144"
   
    func getWeather(completion: @escaping (MainWeather?) -> Void) {
        
       
        guard let url = URL(string:
            "https://api.openweathermap.org/data/2.5/forecast?id=625144&&appid=13c0fb416c67522ef40fa34a1e5c2526&units=metric") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
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
    
    
    func getDaylyWeather(completion: @escaping ([Daily]) -> Void) {
        guard let url = URL(string: "https://api.openweathermap.org/data/3.0/onecall?lat=53.893009&lon=27.567444&exclude=hourly,minutely,current&appid=13c0fb416c67522ef40fa34a1e5c2526&units=metric") else { return }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { responseData, response, error in
            if let error = error {
                print(error.localizedDescription)
            } else if let jsonData = responseData {
                let json = try? JSONDecoder().decode(DailyWeatherModel.self, from: jsonData)
                DispatchQueue.main.async {
                    completion(json?.daily ?? [])
                }
            }
        }.resume()
    }
}
