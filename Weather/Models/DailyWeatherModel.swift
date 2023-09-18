//
//  DaylyWeatherModel.swift
//  Weather
//
//  Created by Elizaveta Shidlovskaya on 30.08.23.
//

import Foundation


// MARK: - DaylyWeatherModel
struct DailyWeatherModel: Decodable {
  
    let daily: [Daily]

    enum CodingKeys: String, CodingKey {
        case daily
    }
}

// MARK: - Daily
struct Daily: Decodable {
    let date: Int
    let temp: Temp
    let weather: [Weather]

    enum CodingKeys: String, CodingKey {
        case date = "dt"
        case temp
        case weather
    }
}

// MARK: - Temp
struct Temp: Decodable {
    let day: Double
    
    enum CodingKeys: CodingKey {
        case day
    }
}

// MARK: - Weather
struct Weather: Decodable {
    let icon: String

    enum CodingKeys: CodingKey {
        case icon
    }
}

