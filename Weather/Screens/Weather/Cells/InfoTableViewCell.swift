//
//  InfoTableViewCell.swift
//  Weather
//
//  Created by Elizaveta Shidlovskaya on 18.08.23.
//

import UIKit

let imageDict: [String: String] = ["UV-index": "sun.max",
                                   "Sunset": "sunset.fill",
                                   "Wind": "wind",
                                   "Precipitation": "drop.fill",
                                   "Feels like": "thermometer.medium",
                                   "Humidity": "humidity.fill",
                                   "Visibility": "eye.fill",
                                   "Pressure": "barometer"]

struct Info {
    let title: [String] = ["UV-index", "Sunset", "Wind", "Precipitation", "Feels like", "Humidity", "Visibility", "Pressure"]
    let imageDict: [String: String] = ["UV-index": "sun.max",
                                       "Sunset": "sunset.fill",
                                       "Wind": "wind",
                                       "Precipitation": "drop.fill",
                                       "Feels like": "thermometer.medium",
                                       "Humidity": "humidity.fill",
                                       "Visibility": "eye.fill",
                                       "Pressure": "barometer"]
    let information: [String] = []
}

final class InfoTableViewCell: UITableViewCell {
    static let identifier: String = "InfoTableViewCell"
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white.withAlphaComponent(0.03)
        view.layer.cornerRadius = 15
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.white.withAlphaComponent(0.25).cgColor
        
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
        label.font = .systemFont(ofSize: 35.0, weight: .regular)
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
                makeUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell() {
        iconImageView.image = UIImage(systemName: "drop.fill")
        titleLabel.text = "Humidity"
        infoLabel.text = "30"

        }
    }


// MARK: - Private

    private extension InfoTableViewCell {
        func makeUI() {
            
            backgroundColor = .clear
            selectionStyle = .none
            
            containerView.addSubview(containerView)
            containerView.snp.makeConstraints { make in
                make.top.equalToSuperview().inset(18.0)
                make.bottom.equalToSuperview()
                make.horizontalEdges.equalToSuperview().inset(20.0)
            }
            
            containerView.addSubview(iconImageView)
            iconImageView.snp.makeConstraints { make in
                make.top.equalToSuperview().inset(15.0)
                make.left.equalToSuperview().inset(150.0)
                make .size.equalTo(20.0)
            }
            
            containerView.addSubview(titleLabel)
            titleLabel.snp.makeConstraints { make in
                make.centerY.equalTo(iconImageView)
                make.left.equalTo(iconImageView.snp.right).offset(8.0)
                make.width.equalTo(70.0)
            }
            
            containerView.addSubview(infoLabel)
            infoLabel.snp.makeConstraints { make in
                make.centerY.centerX.equalTo(containerView)
            }
        }
        
    }


