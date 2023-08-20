//
//  Configuration.swift
//  Weather
//
//  Created by Elizaveta Shidlovskaya on 18.08.23.
//

import Foundation

struct Configuration {
    let temperature: Int
    let city: String
    let skyCondition: String
//    let hour: Date?? String
//    let skyIcon: String ?? UIImage
    let day: String
    let uvIndex: Int
//    let sunset: Date ?? String
    let windSpeed: Int
    let windDirection: String
    let precipitation: Int
    let feelsLike: String
    let humidity: Int
    let vivibility: Int
    let pressure: Int
}


struct City: Decodable {
    let coord: Coordinates
    let weather: [Weather]
    let base: String
    
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
