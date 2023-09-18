//
//  UIView+Style.swift
//  Weather
//
//  Created by Elizaveta Shidlovskaya on 18.09.23.
//

import UIKit

extension UIView {
    
    func makeViewCitiesStyle() {
        
        backgroundColor = .black.withAlphaComponent(0.1)
        layer.cornerRadius = 15
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.white.withAlphaComponent(0.25).cgColor
    }
    
    func makeViewWeatherStyle() {
        
        backgroundColor = .white.withAlphaComponent(0.03)
        layer.cornerRadius = 15
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.white.withAlphaComponent(0.25).cgColor
    }
}
