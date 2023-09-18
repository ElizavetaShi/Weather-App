//
//  CitiesAssembler.swift
//  Weather
//
//  Created by Elizaveta Shidlovskaya on 17.09.23.
//

import UIKit

final class CitiesAssembler {
    private init() {}
    
    static func citiesVC() -> CitiesVC {
        let vm = CitiesVM(
            networkService: NetworkService())
        let vc = CitiesVC(viewModel: vm)
        vm.view = vc
        return vc
    }
}
