//
//  CarDetailsTableViewCell.swift
//  AVBY
//
//  Created by Евгений Митюля on 12/15/23.
//

import UIKit

final class CarDetailsTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    private var car: Car?
    
    
    // MARK: - UI Elements
    
    private let overlayView = UIView()
    private let carNameLabel = UILabel()
    private let carPriceRublesLabel = UILabel()
    private let carPriceDollarsLabel = UILabel()
    private let checkPriceButton = IconButton(iconName: Icons.chevronDown, iconSize: 11)
    private let carImagesCollectionView = CarDetailsCollectionView()
    private let sellStatusButton = BuyImageButton()
    private let actionsStackView = UIStackView()
    
    
    // MARK: - Lifecycle Methods
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupStyles()
        configureConstraints()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupStyles()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupStyles()
        configureConstraints()
    }
    
    func configure(car: Car) {
        self.car = car
        carNameLabel.text = car.name
        configurePriceLabel(rubles: car.priceRubles, dollars: car.priceDollars)
        carImagesCollectionView.setupCollectionView(car: car)
        sellStatusButton.setText(sellStatus: car.sellStatus, price: car.priceDollars, years: 5, currency: "USD")
    }
    
    private func setupStyles() {
        overlayView.backgroundColor = .cellColor
        carNameLabel.applyTextStyle(textColor: .titleColor, fontSize: 18, weight: .medium)
        
        carNameLabel.numberOfLines = 0
        carPriceRublesLabel.numberOfLines = 0
        
        checkPriceButton.buttonBackgroundColor = .buttonColor
        checkPriceButton.buttonTintColor = .buttonDownTintColor
        checkPriceButton.cornerRadius = 8
    }
    
    private func configureConstraints() {
        overlayView.translatesAutoresizingMaskIntoConstraints = false
        carNameLabel.translatesAutoresizingMaskIntoConstraints = false
        carPriceRublesLabel.translatesAutoresizingMaskIntoConstraints = false
        carPriceDollarsLabel.translatesAutoresizingMaskIntoConstraints = false
        checkPriceButton.translatesAutoresizingMaskIntoConstraints = false
        carImagesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        sellStatusButton.translatesAutoresizingMaskIntoConstraints = false
        actionsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(overlayView)
        
        overlayView.addSubview(
            carNameLabel,
            carPriceRublesLabel,
            carPriceDollarsLabel,
            checkPriceButton,
            carImagesCollectionView,
            sellStatusButton,
            actionsStackView
        )
        
//        actionsStackView.
        
        NSLayoutConstraint.activate([
            overlayView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            overlayView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            overlayView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            overlayView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            
            carNameLabel.topAnchor.constraint(equalTo: overlayView.topAnchor, constant: 5),
            carNameLabel.leadingAnchor.constraint(equalTo: overlayView.leadingAnchor, constant: 15),
            carNameLabel.trailingAnchor.constraint(equalTo: overlayView.trailingAnchor, constant: -5),
            
            carPriceRublesLabel.topAnchor.constraint(equalTo: carNameLabel.bottomAnchor, constant: 10),
            carPriceRublesLabel.leadingAnchor.constraint(equalTo: overlayView.leadingAnchor, constant: 15),
            
            carPriceDollarsLabel.centerYAnchor.constraint(equalTo: carPriceRublesLabel.centerYAnchor, constant: 0),
            carPriceDollarsLabel.leadingAnchor.constraint(equalTo: carPriceRublesLabel.trailingAnchor, constant: 5),
            
            checkPriceButton.centerYAnchor.constraint(equalTo: carPriceDollarsLabel.centerYAnchor, constant: 0),
            checkPriceButton.leadingAnchor.constraint(equalTo: carPriceDollarsLabel.trailingAnchor, constant: 10),
            checkPriceButton.widthAnchor.constraint(equalToConstant: 25),
            checkPriceButton.heightAnchor.constraint(equalToConstant: 20),
            
            carImagesCollectionView.topAnchor.constraint(equalTo: carPriceRublesLabel.bottomAnchor, constant: 10),
            carImagesCollectionView.leadingAnchor.constraint(equalTo: overlayView.leadingAnchor, constant: 0),
            carImagesCollectionView.trailingAnchor.constraint(equalTo: overlayView.trailingAnchor, constant: 0),
            carImagesCollectionView.heightAnchor.constraint(equalToConstant: 240),
            
            sellStatusButton.topAnchor.constraint(equalTo: carImagesCollectionView.bottomAnchor, constant: 20),
            sellStatusButton.leadingAnchor.constraint(equalTo: overlayView.leadingAnchor, constant: 15),
            sellStatusButton.trailingAnchor.constraint(equalTo: overlayView.trailingAnchor, constant: -15),
            sellStatusButton.heightAnchor.constraint(equalToConstant: 70),
            
            actionsStackView.topAnchor.constraint(equalTo: sellStatusButton.topAnchor, constant: 10),
            actionsStackView.leadingAnchor.constraint(equalTo: overlayView.leadingAnchor, constant: 15),
            actionsStackView.trailingAnchor.constraint(equalTo: overlayView.trailingAnchor, constant: -15),
            
            sellStatusButton.bottomAnchor.constraint(equalTo: overlayView.bottomAnchor, constant: -10),
        ])
    }
    
    private func configurePriceLabel(rubles: Double, dollars: Double) {
        let rubles = String(Int(rubles))
        let separator = " р."
        let dollars = " ≈ " + String(Int(dollars)) + " $"
        
        let rublesPartAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 26, weight: .black),
            .foregroundColor: UIColor.titleColor
        ]
        
        let separatorPartAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 16, weight: .semibold),
            .foregroundColor: UIColor.titleColor
        ]
        
        let dollarsPartAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 15, weight: .regular),
            .foregroundColor: UIColor.subtitleColor
        ]
        
        let attributedString = NSMutableAttributedString()
        
        let attributedStringDollars = NSMutableAttributedString()
        
        attributedString.append(NSAttributedString(string: rubles, attributes: rublesPartAttributes))
        attributedString.append(NSAttributedString(string: separator, attributes: separatorPartAttributes))
        attributedStringDollars.append(NSAttributedString(string: dollars, attributes: dollarsPartAttributes))
        
        carPriceRublesLabel.attributedText = attributedString
        carPriceDollarsLabel.attributedText = attributedStringDollars
    }
}
