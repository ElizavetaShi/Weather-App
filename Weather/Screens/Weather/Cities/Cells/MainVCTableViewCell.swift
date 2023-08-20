//
//  MainVCTableViewCell.swift
//  Weather
//
//  Created by Elizaveta Shidlovskaya on 18.08.23.
//

import UIKit



final class MainVCTableViewCell: UITableViewCell {
    
     static let identifier: String = "MainVCTableViewCell"
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .black.withAlphaComponent(0.1)
        view.layer.cornerRadius = 15
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.white.withAlphaComponent(0.25).cgColor
        
        return view
    }()
    
    private lazy var locationLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 25.0, weight: .bold)
        label.textColor = .white
        
        return label
    }()
    
    private lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15.0, weight: .medium)
        label.textColor = .white
        
        return label
    }()
    
    private lazy var skyLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16.0, weight: .medium)
        label.textColor = .white
        label.numberOfLines = 0
        
        return label
    }()
    
    private lazy var temeperatureLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 55.0, weight: .light)
        label.textColor = .white
        
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
        locationLabel.text = "Minsk"
        timeLabel.text = "13:55"
        skyLabel.text = "Cloudy"
        temeperatureLabel.text = "30°"
    }
}
    
extension MainVCTableViewCell {
    
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
        
        containerView.addSubview(temeperatureLabel)
        temeperatureLabel.snp.makeConstraints { make in
            make.size.equalTo(90.0)
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().inset(20.0)
        }
    }
}
