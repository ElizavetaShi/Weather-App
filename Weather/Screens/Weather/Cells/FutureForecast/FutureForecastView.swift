//
//  FutureForecastView.swift
//  Weather
//
//  Created by Elizaveta Shidlovskaya on 14.08.23.
//

import UIKit
import SnapKit

struct FutureForecast {
    let temperature: Int
    let day: String
    let icon: UIImage?
}

final class FutureForecastView: UIView {
    private var data: FutureForecast
    
    private lazy var dayLabel: UILabel = {
       let label = UILabel()
        label.text = data.day
        label.font = .systemFont(ofSize: 22.0, weight: .medium)
        label.textColor = .white
        return label
    }()
    
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = data.icon
        imageView.tintColor = .white
        return imageView
    }()
    
    private lazy var temperatureLabel: UILabel = {
        let label = UILabel()
        label.text = "\(data.temperature)°"
        label.textColor = .white
        label.font = .systemFont(ofSize: 22.0, weight: .medium)
        return label
    }()
    
    private lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .white.withAlphaComponent(0.5)
        return view
    }()
    
    init(data: FutureForecast) {
        self.data = data
        super.init(frame: .zero)
        makeUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
