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
    private let carPriceLabel = UILabel()
    private let separatorLabel = UILabel()
    private let carPriceDollarsLabel = UILabel()
    private let hideButton = UIButton()
    private let favouriteButton = UIButton()
    
    private let carImagesCollectionView = CarImagesCollectionView()
    
    private let carAboutLabel = UILabel()
    
    private let announcementStatusStackView = UIStackView()
    private let announcementDetailsLabel = UILabel()
    private let separatorView = UIView()
    private let buyButton = BuyButton()
    
    
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
        configureStatusViews(status: car.announcementStatus)
        announcementStatusStackView.backgroundColor = .clear
        
        carNameLabel.applyTextStyle(textColor: .titleColor, fontSize: 18, weight: .medium)
        carAboutLabel.applyTextStyle(textColor: .titleColor, fontSize: 16, weight: .regular)
        announcementDetailsLabel.applyTextStyle(textColor: .subtitle, fontSize: 14, weight: .regular)
        
        configurePriceLabel(rubles: car.priceRubles, dollars: car.priceDollars)
        configureAnnouncementDetailsLabel(city: car.city, date: car.date)
        carAboutLabel.text = configureAboutLabel(car: car)
        buyButton.setText(sellStatus: car.sellStatus, price: car.priceDollars, years: 5)
        carImagesCollectionView.setupCollectionView(car: car)
        
        announcementStatusStackView.axis = .horizontal
        announcementStatusStackView.distribution = .fill
        announcementStatusStackView.alignment = .leading
        announcementStatusStackView.spacing = 5
        
        carNameLabel.numberOfLines = 0
        carPriceLabel.numberOfLines = 0
        carAboutLabel.numberOfLines = 0
        
        hideButton.configure(with: Icons.eyeSlash, pointSize: 20, weight: .semibold)
        favouriteButton.configure(with: Icons.bookmark, pointSize: 20, weight: .semibold)
        
        favouriteButton.tintColor = .iconColor
        hideButton.tintColor = .iconColor
        separatorView.backgroundColor = .separatorColor
        
        overlayView.backgroundColor = .cellColor
        overlayView.layer.cornerRadius = 10
    }
    
    func configureConstraints() {
        overlayView.translatesAutoresizingMaskIntoConstraints = false
        carNameLabel.translatesAutoresizingMaskIntoConstraints = false
        favouriteButton.translatesAutoresizingMaskIntoConstraints = false
        hideButton.translatesAutoresizingMaskIntoConstraints = false
        carPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        carImagesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        carAboutLabel.translatesAutoresizingMaskIntoConstraints = false
        announcementDetailsLabel.translatesAutoresizingMaskIntoConstraints = false
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        announcementStatusStackView.translatesAutoresizingMaskIntoConstraints = false
        buyButton.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(overlayView)
        
        overlayView.addSubview(
            carNameLabel,
            hideButton,
            favouriteButton,
            carPriceLabel,
            carImagesCollectionView,
            carAboutLabel,
            announcementStatusStackView,
            announcementDetailsLabel,
            separatorView,
            buyButton
        )
        
        // MARK: - Views
        
        NSLayoutConstraint.activate([
            overlayView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            overlayView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            overlayView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            overlayView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            
            carNameLabel.topAnchor.constraint(equalTo: overlayView.topAnchor, constant: 12),
            carNameLabel.leadingAnchor.constraint(equalTo: overlayView.leadingAnchor, constant: 10),
            carNameLabel.trailingAnchor.constraint(equalTo: hideButton.leadingAnchor, constant: -16),
            
            hideButton.topAnchor.constraint(equalTo: carNameLabel.topAnchor),
            hideButton.trailingAnchor.constraint(equalTo: favouriteButton.leadingAnchor, constant: -15),
            
            favouriteButton.topAnchor.constraint(equalTo: carNameLabel.topAnchor),
            favouriteButton.trailingAnchor.constraint(equalTo: overlayView.trailingAnchor, constant: -5),
            favouriteButton.widthAnchor.constraint(equalTo: hideButton.widthAnchor, multiplier: 1),
            
            carPriceLabel.topAnchor.constraint(equalTo: carNameLabel.bottomAnchor, constant: 5),
            carPriceLabel.leadingAnchor.constraint(equalTo: overlayView.leadingAnchor, constant: 10),
            carPriceLabel.trailingAnchor.constraint(equalTo: overlayView.trailingAnchor, constant: -16),
            
            carImagesCollectionView.topAnchor.constraint(equalTo: carPriceLabel.bottomAnchor, constant: 10),
            carImagesCollectionView.leadingAnchor.constraint(equalTo: overlayView.leadingAnchor),
            carImagesCollectionView.trailingAnchor.constraint(equalTo: overlayView.trailingAnchor),
            carImagesCollectionView.heightAnchor.constraint(equalToConstant: 115),
            
            carAboutLabel.topAnchor.constraint(equalTo: carImagesCollectionView.bottomAnchor, constant: 10),
            carAboutLabel.leadingAnchor.constraint(equalTo: overlayView.leadingAnchor, constant: 10),
            carAboutLabel.trailingAnchor.constraint(equalTo: overlayView.trailingAnchor, constant: -16),
            
            announcementStatusStackView.topAnchor.constraint(equalTo: carAboutLabel.bottomAnchor, constant: 10),
            announcementStatusStackView.leadingAnchor.constraint(equalTo: overlayView.leadingAnchor, constant: 10),
//            announcementStatusStackView.bottomAnchor.constraint(equalTo: overlayView.bottomAnchor, constant: -10),

            announcementDetailsLabel.topAnchor.constraint(equalTo: announcementStatusStackView.bottomAnchor, constant: 10),
            announcementDetailsLabel.leadingAnchor.constraint(equalTo: overlayView.leadingAnchor, constant: 10),
            announcementDetailsLabel.trailingAnchor.constraint(equalTo: overlayView.trailingAnchor, constant: -16),
            
            separatorView.topAnchor.constraint(equalTo: announcementDetailsLabel.bottomAnchor, constant: 15),
            separatorView.leadingAnchor.constraint(equalTo: overlayView.leadingAnchor, constant: 10),
            separatorView.trailingAnchor.constraint(equalTo: overlayView.trailingAnchor),
            separatorView.heightAnchor.constraint(equalToConstant: 1),
            
            
            buyButton.topAnchor.constraint(equalTo: separatorView.bottomAnchor, constant: 5),
            buyButton.leadingAnchor.constraint(equalTo: overlayView.leadingAnchor, constant: 10),
            buyButton.trailingAnchor.constraint(equalTo: overlayView.trailingAnchor, constant: -16),
            buyButton.bottomAnchor.constraint(equalTo: overlayView.bottomAnchor, constant: -5),

            
        ])
    }
    
    func configureStatusViews(status: [AnnouncementStatus]) {
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
        
//        let topView1 = IconViewBuilder()
//            .setConfiguration(topViewConfiguration)
//            .setPosition(.left)
//            .setWidth(50)
//            .setHeight(20)
//            .build()
        
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
    
    func configurePriceLabel(rubles: Double, dollars: Double) {
        let rubles = String(Int(rubles))
        let separator = " р."
        let dollars = " ≈ " + String(Int(dollars)) + " $"
        
        let rublesPartAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 24, weight: .black),
            .foregroundColor: UIColor.titleColor
        ]
        
        let separatorPartAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 18, weight: .bold),
            .foregroundColor: UIColor.titleColor
        ]
        
        let dollarsPartAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 13, weight: .regular),
            .foregroundColor: UIColor.subtitleColor
        ]
        
        let attributedString = NSMutableAttributedString()
        
        attributedString.append(NSAttributedString(string: rubles, attributes: rublesPartAttributes))
        attributedString.append(NSAttributedString(string: separator, attributes: separatorPartAttributes))
        attributedString.append(NSAttributedString(string: dollars, attributes: dollarsPartAttributes))
        
        carPriceLabel.attributedText = attributedString
    }
    
    func configureAboutLabel(car: Car) -> String {
        var resultStr = ""
        var engine = ""
        var type = ""
        
        switch car.engineType {
        case .gasoline:
            engine = "бензин"
        case .diesel:
            engine = "дизель"
        case .electric:
            engine = "электромобиль"
        case .hybrid:
            engine = "гибрид"
        }
        
        switch car.bodyType {
        case .sedan:
            type = "седан"
        case .suv:
            type = "SUV"
        case .coupe:
            type = "купе"
        case .universal:
            type = "универсал"
        }
        
        resultStr = "\(car.releaseYear) г., \(car.capacity) л, \(engine), \(type), \(car.milieage) км"
        return resultStr
    }
    
    func configureAnnouncementDetailsLabel(city: String, date: String) {
        let city = city
        let separator = "·"
        let date = date
        
        announcementDetailsLabel.text = "\(city) \(separator) \(date)"
    }
}


