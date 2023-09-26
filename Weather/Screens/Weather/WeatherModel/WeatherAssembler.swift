//
//  WeatherAssembler.swift
//  Weather
//
//  Created by Elizaveta Shidlovskaya on 17.09.23.
//

import UIKit

final class WeatherAssembler {
    private init() {}
    
    static func weatherVC() -> WeatherVC {
        let vm = WeatherVM(networkService: NetworkService())
        let vc = WeatherVC(viewModel: vm)
        return vc
    }
}
