//
//  MainVC.swift
//  Weather
//
//  Created by Elizaveta Shidlovskaya on 8.08.23.
//

import UIKit
import SnapKit

final class MainVC: UIViewController {
    
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
        tableView.separatorStyle = .none
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeUI()
    }
}

// MARK: - Private

private extension MainVC {
    func makeUI() {
        
        view.addSubview(backgroundImageView)
        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension MainVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: HeaderTableViewCell.identifier) as? HeaderTableViewCell
            cell?.setupCell(cityName: "Minsk", temperature: 30, condition: "Cloudy")
            return cell ?? UITableViewCell()
        } else if indexPath.row == 1  {
            let cell = tableView.dequeueReusableCell(withIdentifier: NearestForecastTableViewCell.identifier) as? NearestForecastTableViewCell
            cell?.setupCell(forecast: "Cloudy conditions from 1AM-9AM, with showers expected at 9AM.")
            return cell ?? UITableViewCell()
        } else {
            return UITableViewCell()
        }
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







//        view.addSubview(footerView)
//        footerView.snp.makeConstraints { make in
//            make.horizontalEdges.bottom.equalToSuperview()
//            make.height.equalTo(100)
//        }
//
//        view.addSubview(testLabel)
//        testLabel.snp.makeConstraints { make in
//            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
//            make.horizontalEdges.equalToSuperview().inset(20)
//        }
//
//        view.addSubview(testImageView)
//        testImageView.snp.makeConstraints { make in
//            make.size.equalTo(100)
//            make.centerX.equalToSuperview()
//            make.top.equalTo(testLabel.snp.bottom).offset(20)
//        }
//
//        view.addSubview(mapView)
//        mapView.snp.makeConstraints { make in
//            make.horizontalEdges.equalToSuperview()
//            make.bottom.equalToSuperview()
//            make.top.equalTo(testImageView.snp.bottom).offset(20)
//        }
//
