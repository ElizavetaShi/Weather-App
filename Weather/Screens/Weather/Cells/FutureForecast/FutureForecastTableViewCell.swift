//
//  FutureForecastTableViewCell.swift
//  Weather
//
//  Created by Elizaveta Shidlovskaya on 14.08.23.
//

import UIKit

final class FutureForecastTableViewCell: UITableViewCell {
    
    static let identifier: String = "FutureForecastTableViewCell"
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.makeViewWeatherStyle()
        
        return view
    }()
    
    private lazy var iconImageView: UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(systemName: "calendar")
        icon.tintColor = .white.withAlphaComponent(0.3)
        
        return icon
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white.withAlphaComponent(0.3)
        label.font = .systemFont(ofSize: 15.0, weight: .medium)
        
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .fillEqually
        
        return view
    }()
    
    //    MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        makeUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
    }
    
    //    MARK: - Setting of cell
    
    func setupCell(forecastWeather: [Daily]) {
        titleLabel.text = "7-DAYS FORECAST"
        
        for forecast in forecastWeather {
            let view = FutureForecastView(data: forecast)
            stackView.addArrangedSubview(view)
        }
    }
}

// MARK: - Private

private extension FutureForecastTableViewCell  {
    
    func makeUI() {
        backgroundColor = .clear
        selectionStyle = .none
        
        contentView.addSubview(containerView)
        containerView.addSubview(iconImageView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(stackView)
        
        
        containerView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(18.0)
            make.bottom.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(20.0)
        }
        
        iconImageView.snp.makeConstraints { make in
            make.left.top.equalToSuperview().inset(15.0)
            make.size.equalTo(19.0)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(iconImageView)
            make.left.equalTo(iconImageView.snp.right).offset(5.0)
            make.right.equalToSuperview().inset(15.0)
        }
        
        stackView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.top.equalTo(iconImageView.snp.bottom).inset(6.0)
            make.bottom.equalToSuperview().inset(14.0)
        }
    }
}
