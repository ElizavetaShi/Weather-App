//
//  NearestForecastTableViewCell.swift
//  Weather
//
//  Created by Elizaveta Shidlovskaya on 9.08.23.
//

import UIKit

final class NearestForecastTableViewCell: UITableViewCell {
    static let identifier: String = "NearestForecasttableViewCell"
    
    private lazy var nearestForecastLabel: UILabel = {
        let label = UILabel()
        label.makeLabelStyle()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 18.0, weight: .regular)
        
        return label
    }()
    
    private lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        
        return view
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionLayout)
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(HourlyCollectionViewCell.self, forCellWithReuseIdentifier: HourlyCollectionViewCell.identifier)
        collectionView.alwaysBounceHorizontal = true
        collectionView.showsHorizontalScrollIndicator = false
        
        return collectionView
    }()
    
    private lazy var collectionLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.minimumLineSpacing = 10.0
        layout.sectionInset = .init(top: 0.0, left: 10.0, bottom: 0.0, right: 10.0)
        
        return layout
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.makeViewWeatherStyle()
        
        return view
    }()
    
    private var listWeather: [List] = []
    
//    MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        makeUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    MARK: - Setting of cell
   
    func setupCell(model: [List]) {
        nearestForecastLabel.text = model[0].weather[0].description.prefix(1).capitalized + model[0].weather[0].description.dropFirst()
        listWeather = model
        collectionView.reloadData()
    }
}

// MARK: - Private

private extension NearestForecastTableViewCell {
    
    func makeUI() {
        selectionStyle = .none
        backgroundColor = .clear
        
        contentView.addSubview(containerView)
        containerView.addSubview(nearestForecastLabel)
        containerView.addSubview(separatorView)
        containerView.addSubview(collectionView)
        
        containerView.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(20.0)
        }
        
        nearestForecastLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(15.0)
            make.top.equalToSuperview().inset(10.0)
        }
        
        separatorView.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(14.0)
            make.top.equalTo(nearestForecastLabel.snp.bottom).offset(14.0)
            make.height.equalTo(1.0)
            make.right.equalToSuperview()
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(separatorView.snp.bottom).offset(14.0)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(120.0)
            make.bottom.equalToSuperview().inset(14.0)
        }
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource

extension NearestForecastTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listWeather.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HourlyCollectionViewCell.identifier, for: indexPath) as? HourlyCollectionViewCell
        cell?.setupCell(weather: listWeather[indexPath.item])
        return cell ?? UICollectionViewCell()
    }
}
