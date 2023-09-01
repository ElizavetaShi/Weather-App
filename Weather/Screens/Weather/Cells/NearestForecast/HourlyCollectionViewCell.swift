//
//  HourlyCollectionViewCell.swift
//  Weather
//
//  Created by Elizaveta Shidlovskaya on 10.08.23.
//

import UIKit

final class HourlyCollectionViewCell: UICollectionViewCell {
    static let identifier = "HourlyCollectionViewCell"
    
    private lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17.0, weight: .medium)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private lazy var temperatureLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22.0, weight: .medium)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private lazy var iconImageView: UIImageView = {
        let view = UIImageView()
        view.tintColor = .yellow
        return view
    }()
    
    private var weatherList: [List] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        makeUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupCell(weather: List) {
        let initialTime = weather.time
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        if let time = dateFormatter.date(from: initialTime) {
            dateFormatter.dateFormat = "HH:mm"
            let stringTime = dateFormatter.string(from: time)
            timeLabel.text = stringTime
        }
        
        temperatureLabel.text = "\(Int(weather.main.temp))°"
        iconImageView.image = UIImage(named: weather.weather[0].icon)     
    }
}

// MARK: - Private

private extension HourlyCollectionViewCell {
    
    func makeUI() {
        
        backgroundColor = .clear
        
        contentView.addSubview(timeLabel)
        timeLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.width.equalTo(50.0)
            make.horizontalEdges.equalToSuperview()
        }
        
        contentView.addSubview(temperatureLabel)
        temperatureLabel.snp.makeConstraints { make in
            make.top.equalTo(timeLabel.snp.bottom).offset(75.0)
            make.bottom.horizontalEdges.equalToSuperview()
        }
        
        contentView.addSubview(iconImageView)
        iconImageView.snp.makeConstraints { make in
            make.size.equalTo(30.0)
            make.centerX.centerY.equalToSuperview()
        }
    }
}
