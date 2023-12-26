//
//  CarDetailsMainTableViewCell.swift
//  AVBY
//
//  Created by Евгений Митюля on 12/15/23.
//

import UIKit

final class CarDetailsMainTableViewCell: UITableViewCell {
    
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
    private let separatorView = UIView()
    private let carAboutLabel = UILabel()
    
    private let shareButton = ImageTextButton(imageName: Icons.squareArrowUp, text: "Поделиться")
    private let commentButton = ImageTextButton(imageName: Icons.plusSquare, text: "Комментарий")
    private let favouriteButton = ImageTextButton(imageName: Icons.bookmark, text: "В закладки")
    
    private let announcementStatusStackView = UIStackView()
    private let cityLabel = UILabel()
    private let dateLabel = UILabel()
    
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
        cityLabel.text = car.city
        dateLabel.text = "Опубликовано " + car.date
        configurePriceLabel(rubles: car.priceRubles, dollars: car.priceDollars)
        configureAboutLabel(car: car)
        configureStatusStackView(status: car.announcementStatus)
        carImagesCollectionView.setupCollectionView(car: car)
        sellStatusButton.setText(sellStatus: car.sellStatus, price: car.priceDollars, years: 5, currency: "USD")
    }
    
    private func setupStyles() {
        overlayView.backgroundColor = .cellColor
        carNameLabel.applyTextStyle(textColor: .titleColor, fontSize: 18, weight: .medium)
        carAboutLabel.applyTextStyle(textColor: .titleColor, fontSize: 16, weight: .regular)
        cityLabel.applyTextStyle(textColor: .subtitleColor, fontSize: 15, weight: .regular)
        dateLabel.applyTextStyle(textColor: .subtitleColor, fontSize: 15, weight: .regular)
        
        carNameLabel.numberOfLines = 0
        carPriceRublesLabel.numberOfLines = 0
        carAboutLabel.numberOfLines = 0
        cityLabel.numberOfLines = 0
        dateLabel.numberOfLines = 0
        
        actionsStackView.backgroundColor = .clear
        actionsStackView.axis = .horizontal
        actionsStackView.distribution = .fillEqually
        actionsStackView.alignment = .center
        actionsStackView.spacing = 25
        
        announcementStatusStackView.backgroundColor = .clear
        announcementStatusStackView.axis = .horizontal
        announcementStatusStackView.distribution = .fill
        announcementStatusStackView.alignment = .leading
        announcementStatusStackView.spacing = 5
        
        checkPriceButton.buttonBackgroundColor = .buttonColor
        checkPriceButton.buttonTintColor = .buttonDownTintColor
        checkPriceButton.cornerRadius = 8
        
        separatorView.backgroundColor = .separatorColor
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
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        carAboutLabel.translatesAutoresizingMaskIntoConstraints = false
        announcementStatusStackView.translatesAutoresizingMaskIntoConstraints = false
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(overlayView)
        
        actionsStackView.addArrangedSubview(shareButton)
        actionsStackView.addArrangedSubview(commentButton)
        actionsStackView.addArrangedSubview(favouriteButton)
        
        overlayView.addSubview(
            carNameLabel,
            carPriceRublesLabel,
            carPriceDollarsLabel,
            checkPriceButton,
            carImagesCollectionView,
            sellStatusButton,
            actionsStackView,
            separatorView,
            carAboutLabel,
            announcementStatusStackView,
            cityLabel,
            dateLabel
        )
        
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
            
            actionsStackView.topAnchor.constraint(equalTo: sellStatusButton.bottomAnchor, constant: 10),
            actionsStackView.leadingAnchor.constraint(equalTo: overlayView.leadingAnchor, constant: 15),
            actionsStackView.trailingAnchor.constraint(equalTo: overlayView.trailingAnchor, constant: -15),
            
            separatorView.topAnchor.constraint(equalTo: actionsStackView.bottomAnchor, constant: 10),
            separatorView.leadingAnchor.constraint(equalTo: overlayView.leadingAnchor),
            separatorView.trailingAnchor.constraint(equalTo: overlayView.trailingAnchor),
            separatorView.heightAnchor.constraint(equalToConstant: 1),
            
            
            carAboutLabel.topAnchor.constraint(equalTo: separatorView.bottomAnchor, constant: 20),
            carAboutLabel.leadingAnchor.constraint(equalTo: overlayView.leadingAnchor, constant: 20),
            carAboutLabel.trailingAnchor.constraint(equalTo: overlayView.trailingAnchor, constant: -20),
            
            
            announcementStatusStackView.topAnchor.constraint(equalTo: carAboutLabel.bottomAnchor, constant: 15),
            announcementStatusStackView.leadingAnchor.constraint(equalTo: overlayView.leadingAnchor, constant: 20),

            cityLabel.topAnchor.constraint(equalTo: announcementStatusStackView.bottomAnchor, constant: 15),
            cityLabel.leadingAnchor.constraint(equalTo: overlayView.leadingAnchor, constant: 20),
            cityLabel.trailingAnchor.constraint(equalTo: overlayView.trailingAnchor, constant: -20),
            
            dateLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 5),
            dateLabel.leadingAnchor.constraint(equalTo: overlayView.leadingAnchor, constant: 20),
            dateLabel.trailingAnchor.constraint(equalTo: overlayView.trailingAnchor, constant: -20),
            
            dateLabel.bottomAnchor.constraint(equalTo: overlayView.bottomAnchor, constant: -20),
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
    
    private func configureStatusStackView(status: [AnnouncementStatus]) {
        let topViewConfiguration = IconViewConfiguration(
            systemName: Icons.starFill,
            title: "ТОП",
            bgColor: .topColor,
            cornerRadius: 3,
            imageSize: 8,
            imageWeight: .regular,
            imageColor: .black,
            textColor: .black,
            textSpacing: 1,
            fontSize: 10,
            fontWeight: .semibold
        )
        
        let topView = IconViewBuilder()
            .setConfiguration(topViewConfiguration)
            .setPosition(.left)
            .setWidth(50)
            .setHeight(20)
            .build()
        
        let vinViewConfiguration = IconViewConfiguration(
            systemName: Icons.checkmark,
            title: "VIN",
            bgColor: .vinColor,
            cornerRadius: 3,
            imageSize: 10,
            imageWeight: .semibold,
            imageColor: .white,
            textColor: .white,
            textSpacing: 1,
            fontSize: 10,
            fontWeight: .semibold
        )
        
        let vinView = IconViewBuilder()
            .setConfiguration(vinViewConfiguration)
            .setPosition(.right)
            .setWidth(45)
            .setHeight(20)
            .build()
        
        announcementStatusStackView.arrangedSubviews.forEach { view in
            announcementStatusStackView.removeArrangedSubview(view)
            view.removeFromSuperview()
        }
        
        for announcementStatus in status {
            switch announcementStatus {
            case .top:
                topView.translatesAutoresizingMaskIntoConstraints = false
                announcementStatusStackView.addArrangedSubview(topView)
            case .vin:
                vinView.translatesAutoresizingMaskIntoConstraints = false
                announcementStatusStackView.addArrangedSubview(vinView)
            case .new:
                print("new")
            case .video:
                print("video")
            }
        }
    }
    
    private func configureAboutLabel(car: Car) {
        var resultStr = ""
        let engine = car.engineType.rawValue
        let type = car.bodyType.rawValue
        
        resultStr = "\(car.releaseYear) г., \(car.capacity) л, \(engine), \(type), \(car.milieage) км"
        carAboutLabel.text = resultStr
    }
}
