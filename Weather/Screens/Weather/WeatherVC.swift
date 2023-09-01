//
//  MainVC.swift
//  Weather
//
//  Created by Elizaveta Shidlovskaya on 8.08.23.
//

import UIKit
import SnapKit

final class WeatherVC: UIViewController {
    
    private lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "tempBg"))
        
        return imageView
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(HeaderTableViewCell.self, forCellReuseIdentifier: HeaderTableViewCell.identifier)
        tableView.register(NearestForecastTableViewCell.self, forCellReuseIdentifier: NearestForecastTableViewCell.identifier)
        tableView.register(FutureForecastTableViewCell.self, forCellReuseIdentifier: FutureForecastTableViewCell.identifier)
        tableView.register(InfoTableViewCell.self, forCellReuseIdentifier: InfoTableViewCell.identifier)
        tableView.separatorStyle = .none
        tableView.contentInset = .init(top: 0.0, left: 0.0, bottom: 16.0, right: 0.0)
        
        return tableView
    }()
    
    private lazy var footerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 42 / 255, green: 48 / 255, blue: 64 / 255, alpha: 1.0)
        
        return view
    }()
    
    private lazy var citiesButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "list.bullet"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(citiesButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var mapButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "map"), for: .normal)
        button.tintColor = .white
        
        return button
    }()
    
    
    private var networkService = NetworkService()
    private var forecast: MainWeather?
    private var dailyForecast: [Daily]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeUI()
        
        networkService.getWeather { [weak self] forecast in
            self?.forecast = forecast
            self?.tableView.reloadData()
        }
        
        networkService.getDaylyWeather { [weak self] dailyForecast in
            self?.dailyForecast = dailyForecast
            self?.tableView.reloadData()
        }
    }
}

// MARK: - Private

private extension WeatherVC {
    func makeUI() {
        view.addSubview(backgroundImageView)
        view.addSubview(tableView)
        view.addSubview(footerView)
        
        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        tableView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.bottom.equalTo(self.footerView.snp.top)
        }
        
        footerView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(70.0)
        }
        
        footerView.addSubview(citiesButton)
        citiesButton.snp.makeConstraints { make in
            make.size.equalTo(30.0)
            make.right.equalToSuperview().inset(20.0)
            make.top.equalToSuperview().inset(20.0)
            make.bottom.equalToSuperview().inset(30.0)
        }
        
        footerView.addSubview(mapButton)
        mapButton.snp.makeConstraints { make in
            make.size.equalTo(30.0)
            make.left.equalToSuperview().inset(20.0)
            make.centerY.equalTo(citiesButton)
        }
    }
    
    @objc func citiesButtonTapped() {
        let nav = UINavigationController(rootViewController: CitiesVC())
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: true)
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension WeatherVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        if indexPath.row == 0 {
            if let data = forecast {
                let cell = tableView.dequeueReusableCell(withIdentifier: HeaderTableViewCell.identifier) as? HeaderTableViewCell
                cell?.setupCell(model: data)
                return cell ?? UITableViewCell()
            }
        }
        else if indexPath.row == 1  {
            if let data = forecast {
                let cell = tableView.dequeueReusableCell(withIdentifier: NearestForecastTableViewCell.identifier) as? NearestForecastTableViewCell
                cell?.setupCell(model: data.list)
                return cell ?? UITableViewCell()
            }
        }
        else if indexPath.row == 2 {
            if let data = dailyForecast {
                let cell = tableView.dequeueReusableCell(withIdentifier: FutureForecastTableViewCell.identifier) as? FutureForecastTableViewCell
//                cell?.setupCell(forecastWeather: data.list)
                cell?.setupCell(forecastWeather: data)
                return cell ?? UITableViewCell()
            }
        }
        return UITableViewCell()
        }

    }




