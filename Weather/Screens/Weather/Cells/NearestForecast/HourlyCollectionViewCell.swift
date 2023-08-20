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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        makeUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(timeText: String, icon: UIImage?, temperature: Int) {
        timeLabel.text = timeText
        temperatureLabel.text = "\(temperature)°"
        iconImageView.image = icon
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
