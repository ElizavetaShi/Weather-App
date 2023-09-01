//
//  FutureForecastView.swift
//  Weather
//
//  Created by Elizaveta Shidlovskaya on 14.08.23.
//

import UIKit
import SnapKit

//struct FutureForecast {
//    let temperature: Int
//    let day: String
//    let icon: UIImage?
//}

final class FutureForecastView: UIView {
    
    private lazy var dayLabel: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 22.0, weight: .medium)
        label.textColor = .white
        return label
    }()
    
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .white
        return imageView
    }()
    
    private lazy var temperatureLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 22.0, weight: .medium)
        return label
    }()
    
    private lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .white.withAlphaComponent(0.5)
        return view
    }()
    
    
    private var data: Daily
        
    init(data: Daily) {
        self.data = data
        super.init(frame: .zero)
        
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        makeUI()
        setupView()
    }
    
//    MARK: - Helpers
    
    func getDay(unixDate: Double) -> String {
        let day = Date(timeIntervalSince1970: unixDate)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E"
        dateFormatter.locale = Locale(identifier: "en-en")
        let dayOfTheWeekStr = dateFormatter.string(from: day)
        return dayOfTheWeekStr
    }
    
    private func setupView() {
        
        dayLabel.text = getDay(unixDate: Double(data.date))
        iconImageView.image = UIImage(named: data.weather[0].icon)
        temperatureLabel.text = "\(Int(data.temp.day))°"
//        data = model
    }
}

private extension FutureForecastView {
    func makeUI() {
        
        addSubview(iconImageView)
        iconImageView.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(87.0)
            make.verticalEdges.equalToSuperview().inset(15.0)
            make.size.equalTo(30.0)
        }
        addSubview(dayLabel)
        dayLabel.snp.makeConstraints { make in
            make.centerY.equalTo(iconImageView)
            make.left.bottom.equalToSuperview().inset(15.0)
        }
        
        addSubview(temperatureLabel)
        temperatureLabel.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(17.0)
            make.centerY.equalTo(iconImageView)
        }
        addSubview(separatorView)
        separatorView.snp.makeConstraints { make in
            make.height.equalTo(0.2)
            make.horizontalEdges.equalToSuperview().inset(15.0)
            make.bottom.equalToSuperview()
        }
    }
}
