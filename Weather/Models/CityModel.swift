//
//  CityModel.swift
//  Weather
//
//  Created by Elizaveta Shidlovskaya on 27.08.23.
//

import Foundation

// MARK: - City

struct CityNames: Decodable {
    let main: [Main]

    enum CodingKeys: String, CodingKey {
        case main = "0"
    }
}

// MARK: - Main
struct Main: Decodable {
    let name: String

    enum CodingKeys: CodingKey {
        case name
    }
}


