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
        label.makeLabelStyle()
        
        return label
    }()
    
    private lazy var temperatureLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22.0, weight: .medium)
        label.makeLabelStyle()
        
        return label
    }()
    
    private lazy var iconImageView: UIImageView = {
        let view = UIImageView()
        view.tintColor = .yellow
        return view
    }()
    
    //   MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        makeUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    
    static let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        
        return dateFormatter
    }()
    
    private func getTime(date: String) -> String? {
        let initialTime = date
        Self.dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        if let time = Self.dateFormatter.date(from: initialTime) {
            Self.dateFormatter.dateFormat = "HH:mm"
            let stringTime = Self.dateFormatter.string(from: time)
            return stringTime
        }
        else {
            return nil
        }
    }
    
    //    MARK: - Setting of cell
    
    func setupCell(weather: List) {
        
        timeLabel.text = getTime(date: weather.time)
        temperatureLabel.text = "\(Int(weather.main.temp))°"
        iconImageView.image = UIImage(named: weather.weather[0].icon)
    }
}

// MARK: - Private

private extension HourlyCollectionViewCell {
    
    func makeUI() {
        
        backgroundColor = .clear
        
        contentView.addSubview(timeLabel)
        contentView.addSubview(temperatureLabel)
        contentView.addSubview(iconImageView)
        
        
        timeLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.width.equalTo(50.0)
            make.horizontalEdges.equalToSuperview()
        }
        
        temperatureLabel.snp.makeConstraints { make in
            make.top.equalTo(timeLabel.snp.bottom).offset(75.0)
            make.bottom.horizontalEdges.equalToSuperview()
        }
        
        iconImageView.snp.makeConstraints { make in
            make.size.equalTo(30.0)
            make.centerX.centerY.equalToSuperview()
        }
    }
}
