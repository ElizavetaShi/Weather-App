//
//  HeaderTableViewCell.swift
//  Weather
//
//  Created by Elizaveta Shidlovskaya on 8.08.23.
//

import UIKit

final class HeaderTableViewCell: UITableViewCell {
    
    static let identifier: String = "HeaderTableViewCell"
    
    private lazy var cityLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 37.0, weight: .regular)
        label.makeLabelStyle()
        
        return label
    }()
    
    private lazy var temperatureLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 100.0, weight: .thin)
        label.makeLabelStyle()
        
        return label
    }()
    
    private lazy var skyLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24.0, weight: .regular)
        label.makeLabelStyle()
        
        return label
    }()
    
    private lazy var temperatureSymbol: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 100.0, weight: .thin)
        label.text = "°"
        label.makeLabelStyle()

        
        return label
    }()
    
//  MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        makeUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    MARK: - Setting of cell
    
    func setupCell(model: MainWeather) {
        cityLabel.text = model.city.name
        temperatureLabel.text = "\(Int(model.list[0].main.temp))"
        skyLabel.text = model.list[0].weather[0].mainDescription.prefix(1).capitalized + model.list[0].weather[0].mainDescription.dropFirst()
    }
}

// MARK: - Private

private extension HeaderTableViewCell {
    
    func makeUI() {
        backgroundColor = .clear
        selectionStyle = .none
        
        contentView.addSubview(cityLabel)
        contentView.addSubview(temperatureLabel)
        contentView.addSubview(temperatureSymbol)
        contentView.addSubview(skyLabel)
        
        cityLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(8.0)
            make.horizontalEdges.equalToSuperview().inset(80.0)
            make.centerX.equalToSuperview()
            make.height.equalTo(40.0)
        }
        
        temperatureLabel.snp.makeConstraints { make in
            make.top.equalTo(cityLabel.snp.bottom).offset(8.0)
            make.height.equalTo(125.0)
            make.centerX.equalToSuperview()
        }
        
        temperatureSymbol.snp.makeConstraints { make in
            make.height.equalTo(temperatureLabel)
            make.verticalEdges.equalTo(temperatureLabel)
            make.left.equalTo(temperatureLabel.snp.right)
        }
       
        skyLabel.snp.makeConstraints { make in
            make.top.equalTo(temperatureLabel.snp.bottom).offset(8.0)
            make.horizontalEdges.equalToSuperview().inset(20.0)
            make.bottom.equalToSuperview().inset(18.0)
        }
    }
}
