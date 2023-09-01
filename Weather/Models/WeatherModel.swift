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
        let coord: Coord
        let sunrise: Int
        let sunset: Int
        
        enum CodingKeys: CodingKey {
            case name
            case coord
            case sunrise
            case sunset
        }
    }
    
    // MARK: - Coord
    struct Coord: Decodable {
        let lat: Double
        let lon: Double
    }
    
    // MARK: - List
    struct List: Decodable {
        let date: Int
        let main: Parameters
        let weather: [DescriptionWeather]
        let clouds: Clouds
        let wind: Wind
        let visibility: Int
        let pop: Double
        let rain: Rain?
        let time: String
        
        enum CodingKeys: String, CodingKey {
            case date = "dt"
            case main
            case weather
            case clouds
            case wind
            case visibility
            case pop
            case rain
            case time = "dt_txt"
        }
    }
    
    // MARK: - Clouds
    struct Clouds: Decodable {
        let all: Int
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

    // MARK: - Rain
    struct Rain: Decodable {
        let the3H: Double
        
        enum CodingKeys: String, CodingKey {
            case the3H = "3h"
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


