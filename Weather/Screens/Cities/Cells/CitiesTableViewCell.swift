//
//  CitiesTableViewCell.swift
//  Weather
//
//  Created by Elizaveta Shidlovskaya on 18.08.23.
//

import UIKit

final class CitiesTableViewCell: UITableViewCell {
    
    static let identifier: String = "CitiesTableViewCell"
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.makeViewCitiesStyle()
        
        return view
    }()
    
    private lazy var locationLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 25.0, weight: .bold)
        label.textColor = .black
        
        return label
    }()
    
    private lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15.0, weight: .medium)
        label.textColor = .black
        
        return label
    }()
    
    private lazy var skyLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16.0, weight: .medium)
        label.textColor = .black
        label.numberOfLines = 0
        
        return label
    }()
    
    private lazy var temperatureLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 55.0, weight: .light)
        label.textColor = .black
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
    
    //    MARK: - Helpers
    
    private static let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        return dateFormatter
    }()
    
    private func getTime(date: String) -> String? {
        let initialTime = date
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
    
    func setupCell(model: MainWeather) {
        locationLabel.text = model.city.name
        timeLabel.text = getTime(date: model.list[0].time)
        skyLabel.text = model.list[0].weather[0].mainDescription
        temperatureLabel.text = "\(Int(model.list[0].main.temp))°"
    }
}

// MARK: - Private

extension CitiesTableViewCell {
    
    func makeUI() {
        selectionStyle = .none
        
        contentView.addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(8.0)
            make.bottom.equalToSuperview().inset(8.0)
            make.horizontalEdges.equalToSuperview().inset(20.0)
        }
        
        containerView.addSubview(locationLabel)
        locationLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(8.0)
            make.left.equalToSuperview().inset(16.0)
            make.width.equalTo(150.0)
        }
        
        containerView.addSubview(timeLabel)
        timeLabel.snp.makeConstraints { make in
            make.top.equalTo(locationLabel.snp.bottom).offset(8.0)
            make.left.equalToSuperview().inset(16.0)
            make.width.equalTo(55.0)
        }
        
        containerView.addSubview(skyLabel)
        skyLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(16.0)
            make.bottom.equalToSuperview().inset(8.0)
            make.width.equalTo(200.0)
        }
        
        containerView.addSubview(temperatureLabel)
        temperatureLabel.snp.makeConstraints { make in
            make.size.equalTo(90.0)
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().inset(20.0)
        }
    }
}
