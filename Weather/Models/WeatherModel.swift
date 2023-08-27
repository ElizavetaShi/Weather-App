//
//  WeatherModel.swift
//  Weather
//
//  Created by Elizaveta Shidlovskaya on 20.08.23.
//

import Foundation

//struct City: Decodable {
//    let coord: Coordinates
//    let weather: [Weather]
//    let name: String
//    let date: Int
//    let mainWeather: MainWeather
//    let visibility: Int
//    let wind: Wind
//    //    let rain: Rain
//    let clouds: Clouds
//    let sun: Sun
//    
//    enum CodingKeys: String, CodingKey {
//        case coord
//        case weather
//        case name
//        case date = "dt"
//        case mainWeather = "main"
//        case visibility
//        case wind
//        //        case rain
//        case clouds
//        case sun = "sys"
//    }
//    
//    
//    struct Weather: Decodable {
//        let id: Int
//        let main: String
//        let description: String
//        let icon: String
//    }

//    struct Coordinates: Decodable {
//        let lon: Double
//        let lat: Double
//    }
//
//    struct MainWeather: Decodable {
//        let temperature: Double
//        let feelsLike: Double
//        let pressure: Int
//        let humidity: Int
//
//        enum CodingKeys: String, CodingKey {
//            case feelsLike = "feels_like"
//            case temperature = "temp"
//            case pressure
//            case humidity
//        }
//    }
//
//    struct Wind: Decodable {
//        let speed: Double
//        let direction: Double
//
//        enum CodingKeys: String, CodingKey {
//            case speed
//            case direction = "deg"
//        }
//    }
//
//    //    struct Rain: Decodable {
//    //        let rainInMm: Double
//    //
//    //        enum CodingKeys: String, CodingKey {
//    //            case rainInMm = "1h"
//    //        }
//    //    }
//
//    struct Clouds: Decodable {
//        let clouds: Int
//
//        enum CodingKeys: String, CodingKey {
//            case clouds = "all"
//        }
//    }
//
//    struct Sun: Decodable {
//        let sunset: Int
//        let sunrise: Int
//    }
//}




// MARK: - Structure
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
        let description: String
        let icon: String
        
        enum CodingKeys: CodingKey {
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


