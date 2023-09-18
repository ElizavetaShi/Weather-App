//
//  MainVC.swift
//  Weather
//
//  Created by Elizaveta Shidlovskaya on 18.08.23.
//

import UIKit
import SnapKit

final class CitiesVC: UIViewController {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.makeTableViewStyle()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 150.0
        tableView.register(CitiesTableViewCell.self, forCellReuseIdentifier: CitiesTableViewCell.identifier)
        
        return tableView
    }()
    
    let viewModel: CitiesVMProtocol!
    
    init(viewModel: CitiesVMProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = "Weather"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        makeUI()
        viewModel.loadInfo()
    }
}

// MARK: - Private

private extension CitiesVC {
    func makeUI() {
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSourse

extension CitiesVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let data = viewModel.weather {
            let cell = tableView.dequeueReusableCell(withIdentifier: CitiesTableViewCell.identifier) as! CitiesTableViewCell
            cell.setupCell(model: data)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dismiss(animated: true)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
}

//MARK: - Protocol extensions

extension CitiesVC: CitiesVCProtocol {
    func reloadData() {
        tableView.reloadData()
    }
}

