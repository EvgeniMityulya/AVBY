//
//  BuyImageButton.swift
//  AVBY
//
//  Created by Евгений Митюля on 12/18/23.
//

import UIKit

final class BuyImageButton: UIButton {
    
    // MARK: - Properties
    
    private let sellStatusLabel = UILabel()
    private let priceLabel = UILabel()
    private let companyImageView = UIImageView()
    private let labelsStackView = UIStackView()
    
    // MARK: - Public Methods
    
    func setText(sellStatus: SellStatus, price: Double, years: Int, currency: String) {
        configureLabels(sellStatus: sellStatus, price: price, years: years, currency: currency)
    }
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupSubviews()
        setupUI()
    }
    
    // MARK: - Private Methods
    
    private func setupSubviews() {
        addSubview(labelsStackView)
        addSubview(companyImageView)
        
        labelsStackView.addArrangedSubview(sellStatusLabel)
        labelsStackView.addArrangedSubview(priceLabel)
        
        labelsStackView.translatesAutoresizingMaskIntoConstraints = false
        sellStatusLabel.translatesAutoresizingMaskIntoConstraints = false
        companyImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            labelsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            labelsStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            labelsStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            companyImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            companyImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            companyImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            companyImageView.widthAnchor.constraint(equalToConstant: 100),
        ])
    }
    
    private func setupUI() {
        self.backgroundColor = .buttonColor
        self.layer.cornerRadius = 8
        
        labelsStackView.isUserInteractionEnabled = false
        companyImageView.isUserInteractionEnabled = false
        
        labelsStackView.backgroundColor = .clear
        labelsStackView.axis = .vertical
        labelsStackView.distribution = .fillProportionally
        labelsStackView.alignment = .leading
        labelsStackView.spacing = 3
        
        companyImageView.layer.cornerRadius = 3
        companyImageView.image = UIImage(named: "rezerv_logo")
        companyImageView.contentMode = .scaleToFill
        companyImageView.layer.masksToBounds = true
    }
    
    func configureLabels(sellStatus: SellStatus, price: Double, years: Int, currency: String) {
        var leftText = ""
        
        switch sellStatus {
        case .credit:
            leftText = "Кредит"
        case .leasing:
            leftText = "Лизинг"
        }
        
        let monthlyPayment = Int(price) / (years * 12)
        let rightText = "\(monthlyPayment) \(currency) в месяц"
        
        let leftTextAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 13, weight: .semibold),
            .foregroundColor: UIColor.detailsBlueColor
        ]
        
        let rightTextAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 13, weight: .semibold),
            .foregroundColor: UIColor.detailsBlueColor
        ]
        
        let leftString = NSMutableAttributedString()
        
        leftString.append(NSAttributedString(string: leftText, attributes: leftTextAttributes))
        
        let rightString = NSMutableAttributedString(string: rightText, attributes: rightTextAttributes)
        let boldRange = (rightText as NSString).range(of: "\(monthlyPayment) \(currency)")
        rightString.addAttributes([
            .font: UIFont.systemFont(ofSize: 14, weight: .semibold),
            .foregroundColor: UIColor.detailsBlueColor
        ], range: boldRange)
        
        
        sellStatusLabel.attributedText = leftString
        priceLabel.attributedText = rightString
    }
    
}
