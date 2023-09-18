//
//  CitiesVM.swift
//  Weather
//
//  Created by Elizaveta Shidlovskaya on 17.09.23.
//

import UIKit

protocol CitiesVMProtocol {
    var weather: MainWeather? { get }
    func loadInfo()
}

protocol NetworkServiceCitiesUseCase {
    func getWeather(completion: @escaping (MainWeather?) -> Void)
}

protocol CitiesVCProtocol: UIViewController {
    func reloadData()
}


final class CitiesVM: CitiesVMProtocol {
    
    private(set) var weather: MainWeather?
    private let networkService: NetworkServiceCitiesUseCase
    
    weak var view: CitiesVCProtocol?
    
    init(
        networkService: NetworkServiceCitiesUseCase) {
            self.networkService = networkService
        }
    
    func loadInfo() {
        networkService.getWeather { [weak self] info in
            self?.weather = info
            self?.view?.reloadData()
        }
    }
}
