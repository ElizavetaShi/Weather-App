//
//  MainVC.swift
//  Weather
//
//  Created by Elizaveta Shidlovskaya on 8.08.23.
//

import UIKit
import SnapKit

final class WeatherVC: UIViewController {
    
    var selectedCity: String?
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeUI()
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
            
    //        @objc func mapButtonTapped() {
    //
    //        }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension WeatherVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: HeaderTableViewCell.identifier) as? HeaderTableViewCell
            cell?.setupCell(cityName: "Minsk", temperature: 29, condition: "Cloudy")
            return cell ?? UITableViewCell()
        } else if indexPath.row == 1  {
            let cell = tableView.dequeueReusableCell(withIdentifier: NearestForecastTableViewCell.identifier) as? NearestForecastTableViewCell
            cell?.setupCell(forecast: "Cloudy conditions from 1AM-9AM, with showers expected at 9AM.")
            return cell ?? UITableViewCell()
        } else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: FutureForecastTableViewCell.identifier) as? FutureForecastTableViewCell
            cell?.setupCell(forecastArray: [.init(temperature: 29, day: "Today", icon: UIImage(systemName: "sun.max.fill")),
                                            .init(temperature: 30, day: "Tue", icon: UIImage(systemName: "sun.max")),
                                            .init(temperature: 26, day: "Wed", icon: UIImage(systemName: "sun.max.fill")),
                                            .init(temperature: 27, day: "Thu", icon: UIImage(systemName: "sun.min")),
                                            .init(temperature: 30, day: "Fri", icon: UIImage(systemName: "sun.min")),
                                            .init(temperature: 25, day: "Sub", icon: UIImage(systemName: "cloud.bolt")),
                                            .init(temperature: 30, day: "Sun", icon: UIImage(systemName: "sun.min.fill"))])
            return cell ?? UITableViewCell()
        } else if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: InfoTableViewCell.identifier) as? InfoTableViewCell
            cell?.setupCell()
            return cell ?? UITableViewCell()
        }
            return UITableViewCell()
        }
    }










//    private lazy var testLabel: UILabel = {
//        let label = UILabel()
//        label.text = "asdasd"
//        label.font = .systemFont(ofSize: 37, weight: .regular)
//        label.textColor = .white
//        label.textAlignment = .center
//        return label
//    }()
//
//    private lazy var testImageView: UIImageView = {
//        let view = UIImageView(image: UIImage(systemName: "cloud.bolt.rain.fill"))
//        return view
//    }()
//
//    private lazy var tableView: UITableView = {
//        let tableView = UITableView()
//        tableView.backgroundColor = .clear
//        tableView.register(HeaderTableViewCell.self, forCellReuseIdentifier: HeaderTableViewCell.identifier)
//        return tableView
//    }()
//
//    private lazy var footerView: UIView = {
//        let view = UIView()
//        view.backgroundColor = .gray
//
//        let pagingControl = UIPageControl()
//        pagingControl.numberOfPages = 5
//
//        view.addSubview(pagingControl)
//        pagingControl.snp.makeConstraints { make in
//            make.centerX.centerY.equalToSuperview()
//        }
//
//        let mapButton = UIButton()
//        mapButton.setImage(UIImage(systemName: "map"), for: .normal)
//        view.addSubview(mapButton)
//        mapButton.snp.makeConstraints { make in
//            make.leading.equalToSuperview().inset(20)
//            make.top.equalToSuperview().offset(8)
//            make.size.equalTo(60)
//        }
//        return view
//    }()
//

//
//tableView.contentInset = .init(top: 0.0, left: 0.0, bottom: 80.0, right: 0.0)
