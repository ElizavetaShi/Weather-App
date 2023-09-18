//
//  InfoTableViewCell.swift
//  Weather
//
//  Created by Elizaveta Shidlovskaya on 18.08.23.
//

import UIKit

enum WeatherInfo: CaseIterable {
    
    case sunrise
    case sunset
    case wind
    case visibility
    case pop
    case feelsLike
    case pressure
    case humidity
    
    var title: String {
        switch self {
        case .sunrise : return "Sunrise"
        case .sunset: return "Sunset"
        case .wind: return "Wind"
        case .visibility: return "Visibility"
        case .pop: return "Precipitation"
        case .feelsLike: return "Feels like"
        case .pressure: return "Pressure"
        case .humidity: return "Humidity"
        }
    }
    
    var image: UIImage? {
        switch self {
        case .sunrise: return UIImage(systemName: "sunrise.fill")
        case .sunset: return UIImage(systemName: "sunset.fill")
        case .wind: return UIImage(systemName: "wind")
        case .visibility: return UIImage(systemName: "eye.fill")
        case .pop: return UIImage(systemName: "drop.fill")
        case .feelsLike: return UIImage(systemName: "thermometer.medium")
        case .pressure: return UIImage(systemName: "gauge.medium")
        case .humidity: return UIImage(systemName: "humidity")
        }
    }
    
    func convertDirectionToString(deg: Int) -> String {
        if deg >= 0 && deg <= 11 || deg > 348 && deg <= 360 {
            return "северный"
        } else if deg > 11 && deg <= 78 {
            return "северо-восточный"
        } else if deg > 78 && deg <= 123 {
            return "восточный"
        } else if deg > 123 && deg <= 168 {
            return "юго-восточный"
        } else if deg > 168 && deg <= 213 {
            return "южный"
        } else if deg > 213 && deg <= 258 {
            return "юго-западный"
        } else if deg > 258 && deg <= 303 {
            return "западный"
        } else if deg > 303 && deg <= 348 {
            return "северо-западный"
        } else {
            return "Неизвестное направление"
        }
    }
    
    func getInfoData(_ data: MainWeather) -> String {
        switch self {
        case .sunrise:
            return getHour(unixDate: data.city.sunrise)
        case .sunset:
            return getHour(unixDate: data.city.sunset)
        case .wind: return "\(data.list[0].wind.speed)km/h," + " " +    convertDirectionToString(deg: data.list[0].wind.deg)
        case .visibility: return "\((data.list[0].visibility) / 1000) km"
        case .pop: return "\((data.list[0].pop) * 100) %"
        case .feelsLike: return "\(data.list[0].main.feelsLike)°"
        case .pressure: return "\(data.list[0].main.pressure) hPa"
        case .humidity: return "\(data.list[0].main.humidity) %"
        }
    }
    
    //  MARK: - Helpers
    
    private static let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:hh"
        
        return dateFormatter
    }()
    
    func getHour(unixDate: Double) -> String {
        let day = Date(timeIntervalSince1970: unixDate)
        Self.dateFormatter.locale = Locale(identifier: "en-en")
        let dayOfTheWeekStr = Self.dateFormatter.string(from: day)
        return dayOfTheWeekStr
    }
}


final class CurrentInfoTableViewCell: UITableViewCell {
    
    static let identifier: String = "CurrentInfoTableViewCell"
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.makeViewWeatherStyle()
        
        return view
    }()
    
    private lazy var iconImageView: UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage()
        icon.tintColor = .white.withAlphaComponent(0.3)
        
        return icon
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white.withAlphaComponent(0.3)
        label.font = .systemFont(ofSize: 15.0, weight: .medium)
        
        return label
    }()
    
    private lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.makeLabelStyle()
        label.font = .systemFont(ofSize: 35.0, weight: .regular)
        label.numberOfLines = 0
        
        return label
    }()
    
    //    MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        makeUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //    MARK: - Setting of cell
    
    func setupCell(parameters: WeatherInfo, dataInfo: MainWeather) {
        iconImageView.image = parameters.image
        titleLabel.text = parameters.title
        infoLabel.text = parameters.getInfoData(dataInfo)
    }
}

private extension CurrentInfoTableViewCell {
    
    func makeUI() {
        
        selectionStyle = .none
        backgroundColor = .clear
        
        contentView.addSubview(containerView)
        containerView.addSubview(iconImageView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(infoLabel)
        
        
        containerView.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview().inset(5.0)
            make.horizontalEdges.equalToSuperview().inset(20.0)
        }
        
        iconImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(8.0)
            make.left.equalToSuperview().inset(20.0)
            make.size.equalTo(20.0)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(iconImageView)
            make.left.equalTo(iconImageView.snp.right).offset(8.0)
            make.width.equalTo(100.0)
        }
        
        infoLabel.snp.makeConstraints { make in
            make.top.equalTo(iconImageView.snp.bottom).inset(-20.0)
            make.left.equalToSuperview().inset(20.0)
            make.bottom.equalToSuperview().inset(20.0)
        }
    }
}
