//
//  MainVC.swift
//  Weather
//
//  Created by Elizaveta Shidlovskaya on 8.08.23.
//

import UIKit
import SnapKit
import Reachability

final class WeatherVC: UIViewController {
    
    var backgroundImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "tempBg"))
        
        return imageView
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.makeTableViewStyle()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(HeaderTableViewCell.self, forCellReuseIdentifier: HeaderTableViewCell.identifier)
        tableView.register(NearestForecastTableViewCell.self, forCellReuseIdentifier: NearestForecastTableViewCell.identifier)
        tableView.register(FutureForecastTableViewCell.self, forCellReuseIdentifier: FutureForecastTableViewCell.identifier)
        tableView.register(CurrentInfoTableViewCell.self, forCellReuseIdentifier: CurrentInfoTableViewCell.identifier)
        tableView.contentInset = .init(top: 0.0, left: 0.0, bottom: 20.0, right: 0.0)
        
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
    
    var offlineView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.isHidden = true
        
        return view
    }()
    
    private lazy var offlineHeaderLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 25.0, weight: .bold)
        label.text = "Information about the weather is not available"
        
        return label
    }()
    
    private lazy var offlineInfoLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.textAlignment = .justified
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 20.0, weight: .bold)
        label.text = "App Weather is not connected to Internet. Please check your connection, then try again"
        
        return label
    }()
    
    let viewModel: WeatherVMProtocol
    
    init(viewModel: WeatherVMProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder _: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeUI()
        
        viewModel.loadWeather { [weak self] result in
            guard let self else { return }
            switch result {
            case .result:
                self.tableView.reloadData()
            case .error:
                self.tableView.isHidden = true
                self.backgroundImageView.isHidden = true
                self.offlineView.isHidden = false
            }
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        viewModel.reachability.stopNotifier()
    }
}

// MARK: - Private

private extension WeatherVC {
    func makeUI() {
        view.addSubview(backgroundImageView)
        view.addSubview(tableView)
        view.addSubview(footerView)
        view.addSubview(offlineView)
        offlineView.addSubview(offlineHeaderLabel)
        offlineView.addSubview(offlineInfoLabel)
        
        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        offlineView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        offlineHeaderLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(150.0)
            make.left.equalToSuperview().inset(50.0)
            make.width.equalTo(300.0)
        }
        
        offlineInfoLabel.snp.makeConstraints { make in
            make.top.equalTo(offlineHeaderLabel.snp.bottom).offset(10.0)
            make.left.equalToSuperview().inset(30.0)
            make.height.equalTo(100.0)
            make.width.equalTo(320.0)
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
    }
    
    //    MARK: - Actions
    
    @objc func citiesButtonTapped() {
        let nextVC = UINavigationController(rootViewController: CitiesAssembler.citiesVC())
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC, animated: true)
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension WeatherVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 { return 3 }
        else
        if section == 1 { return WeatherInfo.allCases.count }
        return .zero
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                if let data = viewModel.forecast {
                    let cell = tableView.dequeueReusableCell(withIdentifier: HeaderTableViewCell.identifier) as! HeaderTableViewCell
                    cell.setupCell(model: data)
                    return cell
                }
            }
            else if indexPath.row == 1  {
                if let data = viewModel.forecast {
                    let cell = tableView.dequeueReusableCell(withIdentifier: NearestForecastTableViewCell.identifier) as! NearestForecastTableViewCell
                    cell.setupCell(model: data.list)
                    return cell
                }
            }
            else if indexPath.row == 2 {
                if let data = viewModel.dailyForecast {
                    let cell = tableView.dequeueReusableCell(withIdentifier: FutureForecastTableViewCell.identifier) as! FutureForecastTableViewCell
                    cell.setupCell(forecastWeather: data)
                    return cell
                }
            }
        }
        
        else if indexPath.section == 1 {
            if let data = viewModel.forecast {
                let cell = tableView.dequeueReusableCell(withIdentifier: CurrentInfoTableViewCell.identifier) as! CurrentInfoTableViewCell
                cell.setupCell(parameters: WeatherInfo.allCases[indexPath.row], dataInfo: data)
                return cell
            }
        }
        return UITableViewCell()
    }
}
