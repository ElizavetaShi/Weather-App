//
//  WeatherVM.swift
//  Weather
//
//  Created by Elizaveta Shidlovskaya on 17.09.23.
//

import UIKit
import Reachability

protocol WeatherVMProtocol {
    
    var forecast: MainWeather? { get }
    var dailyForecast: [Daily]? { get }
    var reachability: Reachability { get }
    
    func loadWeather(completion: @escaping (NetworkResult) -> Void)
}

enum NetworkResult {
    case result
    case error
}

protocol NetworkServiceWeatherUseCase {
    func getWeather(completion: @escaping (MainWeather?) -> Void)
    func getDaylyWeather(completion: @escaping ([Daily]) -> Void)
}

final class WeatherVM: WeatherVMProtocol {
    
    private(set) var forecast: MainWeather?
    private(set) var dailyForecast: [Daily]?
    
    private let networkService: NetworkServiceWeatherUseCase
    let reachability = try! Reachability()
    
    
    init(networkService: NetworkServiceWeatherUseCase) {
        self.networkService = networkService
    }
    
    
    func loadWeather(completion: @escaping (NetworkResult) -> Void) {
        reachability.whenUnreachable = { _ in
            completion(.error)
        }
        do {
            try reachability.startNotifier()
        } catch {
            print("Unable to start notifier")
        }
        
        networkService.getWeather { [weak self] forecast in
            self?.forecast = forecast
            completion(.result)
        }
        networkService.getDaylyWeather { [weak self] daily in
            self?.dailyForecast = daily
            completion(.result)
        }
    }
}
