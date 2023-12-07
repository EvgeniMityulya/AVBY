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
    
//    private let carImageCollectionView = UICollectionView()
    
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
        
        carNameLabel.applyTextStyle(textColor: .titleColor, fontSize: 18, weight: .medium)
        configurePriceLabel(rubles: car.priceRubles, dollars: car.priceDollars)
        
        carNameLabel.numberOfLines = 0
        carPriceLabel.numberOfLines = 0
        
        hideButton.configure(with: Icons.eyeSlash, pointSize: 20, weight: .semibold)
        favouriteButton.configure(with: Icons.bookmark, pointSize: 20, weight: .semibold)

        favouriteButton.tintColor = .iconColor
        hideButton.tintColor = .iconColor
        
        overlayView.backgroundColor = .cellColor
        overlayView.layer.cornerRadius = 10
    }
    
    //    func configureUI() {
    //        configureConstraints()
    //    }
    
    func configureConstraints() {
        overlayView.translatesAutoresizingMaskIntoConstraints = false
        carNameLabel.translatesAutoresizingMaskIntoConstraints = false
        favouriteButton.translatesAutoresizingMaskIntoConstraints = false
        hideButton.translatesAutoresizingMaskIntoConstraints = false
        carPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        contentView.addSubview(overlayView)
        
        overlayView.addSubview(
            carNameLabel,
            hideButton,
            favouriteButton,
            carPriceLabel
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
            carPriceLabel.bottomAnchor.constraint(equalTo: overlayView.bottomAnchor, constant: -10),
        ])
    }
    
    func configurePriceLabel(rubles: Double, dollars: Double) {
        let rubles = String(Int(rubles))
        let separator = " р."
        let dollars = " ≈ " + String(Int(dollars)) + " $"
        
        let rublesPartAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 24, weight: .heavy),
            .foregroundColor: UIColor.titleColor
        ]

        let separatorPartAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 18, weight: .bold),
            .foregroundColor: UIColor.titleColor
        ]

        let dollarsPartAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 13, weight: .medium),
            .foregroundColor: UIColor.subtitleColor
        ]

        let attributedString = NSMutableAttributedString()

        attributedString.append(NSAttributedString(string: rubles, attributes: rublesPartAttributes))
        attributedString.append(NSAttributedString(string: separator, attributes: separatorPartAttributes))
        attributedString.append(NSAttributedString(string: dollars, attributes: dollarsPartAttributes))

        carPriceLabel.attributedText = attributedString
    }
    
    func configureButtons() {
        
    }
}


