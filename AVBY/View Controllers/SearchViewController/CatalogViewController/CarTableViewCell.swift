//
//  CarTableViewCell.swift
//  AVBY
//
//  Created by Евгений Митюля on 12/6/23.
//

import UIKit

final class CarTableViewCell: UITableViewCell {
    
    private var indexPath: IndexPath?
    private var car: Car?
    
    private let overlayView = UIView()
    
    private let carNameLabel = UILabel()
    private let carPriceRublesLabel = UILabel()
    private let separatorLabel = UILabel()
    private let carPriceDollarsLabel = UILabel()
    private let hideButton = UIButton()
    private let favouriteButton = UIButton()
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configureConstraints()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureConstraints()
    }
    
    
    func configure(car: Car, indexPath: IndexPath) {
        self.car = car
        self.indexPath = indexPath
        self.backgroundColor = .clear
        carNameLabel.text = car.name
        carPriceRublesLabel.text = String(car.priceRubles)
        carPriceDollarsLabel.text = String(car.priceDollars)
        
        hideButton.configure(with: Icons.eyeSlash, pointSize: 19, weight: .medium)
        favouriteButton.configure(with: Icons.bookmark, pointSize: 19, weight: .medium)
        overlayView.backgroundColor = .red
    }
    
//    func configureUI() {
//        configureConstraints()
//    }
    
    func configureConstraints() {
        overlayView.translatesAutoresizingMaskIntoConstraints = false
        carNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(overlayView)
        
        contentView.addSubview(
//            favouriteButton,
//            hideButton,
            carNameLabel
//            carPriceRublesLabel,
//            carPriceDollarsLabel,
//            separatorLabel
        )
        
        
        
        // MARK: - Views
        
        overlayView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        overlayView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        overlayView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        overlayView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        
        carNameLabel.topAnchor.constraint(equalTo: overlayView.topAnchor, constant: 10).isActive = true
        carNameLabel.leadingAnchor.constraint(equalTo: overlayView.leadingAnchor, constant: 16).isActive = true
        carNameLabel.bottomAnchor.constraint(equalTo: overlayView.bottomAnchor, constant: 0).isActive = true
        
    }
    
    func configureButtons() {
        
    }
}


