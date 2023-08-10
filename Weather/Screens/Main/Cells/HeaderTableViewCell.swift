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
        label.textColor = .white
        label.textAlignment = .center
        
        return label
    }()
    
    private lazy var temperatureLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 100.0, weight: .thin)
        label.textColor = .white
        label.textAlignment = .center
        
        return label
    }()
    
    private lazy var skyLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24.0, weight: .regular)
        label.textColor = .white
        label.textAlignment = .center
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        makeUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(cityName: String, temperature: Int, condition: String) {
        cityLabel.text = cityName
        temperatureLabel.text = "\(temperature)°"
        skyLabel.text = condition
    }
}

// MARK: - Private

private extension HeaderTableViewCell {
    
    func makeUI() {
        backgroundColor = .clear
        selectionStyle = .none
        
        contentView.addSubview(cityLabel)
        cityLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(8.0)
            make.horizontalEdges.equalToSuperview().inset(80.0)
            make.centerX.equalToSuperview()
            make.height.equalTo(40.0)
        }
        
        contentView.addSubview(temperatureLabel)
        temperatureLabel.snp.makeConstraints { make in
            make.top.equalTo(cityLabel.snp.bottom).offset(8.0)
            make.height.equalTo(125.0)
            make.horizontalEdges.equalToSuperview().inset(80.0)
        }
        
        contentView.addSubview(skyLabel)
        skyLabel.snp.makeConstraints { make in
            make.top.equalTo(temperatureLabel.snp.bottom).offset(8.0)
            make.horizontalEdges.equalToSuperview().inset(100.0)
            make.bottom.equalToSuperview().inset(18.0)
        }
    }
}





//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
