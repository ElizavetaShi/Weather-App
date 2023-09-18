//
//  WeatherModel.swift
//  Weather
//
//  Created by Elizaveta Shidlovskaya on 20.08.23.
//

import Foundation

// MARK: - MainWeather
struct MainWeather: Decodable {
    let list: [List]
    let city: City
    
    enum CodingKeys: CodingKey {
        case list
        case city
    }
}
    
    // MARK: - City
    struct City: Decodable {
        let name: String
        let sunrise: Double
        let sunset: Double
        
        enum CodingKeys: CodingKey {
            case name
            case sunrise
            case sunset
        }
    }
    
    // MARK: - List
    struct List: Decodable {
        let date: Int
        let main: Parameters
        let weather: [DescriptionWeather]
        let wind: Wind
        let visibility: Int
        let pop: Double
        let time: String
        
        enum CodingKeys: String, CodingKey {
            case date = "dt"
            case main
            case weather
            case wind
            case visibility
            case pop
            case time = "dt_txt"
        }
    }
    
    // MARK: - MainParams
    struct Parameters: Decodable {
        let temp: Double
        let feelsLike: Double
        let pressure: Int
        let humidity: Int
        
        enum CodingKeys: String, CodingKey {
            case temp
            case feelsLike = "feels_like"
            case pressure
            case humidity
        }
    }

    // MARK: - DescriptionWeather
    struct DescriptionWeather: Decodable {
        let mainDescription: String
        let description: String
        let icon: String
        
        enum CodingKeys: String, CodingKey {
            case mainDescription = "main"
            case description
            case icon
        }
    }
    
    // MARK: - Wind
    struct Wind: Decodable {
        let speed: Double
        let deg: Int
        
        enum CodingKeys: CodingKey {
            case speed
            case deg
        }
    }
