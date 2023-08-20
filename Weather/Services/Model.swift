//
//  Model.swift
//  Weather
//
//  Created by Elizaveta Shidlovskaya on 20.08.23.
//

struct City: Decodable {
    let coord: Coordinates
    let weather: [Weather]
    let name: String
    let date: Int
    
    enum CodingKeys: String, CodingKey {
        case coord
        case weather
        case name
        case date = "dt"
    }
}

struct Weather: Decodable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

struct Coordinates: Decodable {
    let lon: Double
    let lat: Double
}
