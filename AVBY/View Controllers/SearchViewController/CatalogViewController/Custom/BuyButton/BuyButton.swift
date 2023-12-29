//
//  BuyButton.swift
//  AVBY
//
//  Created by Евгений Митюля on 12/9/23.
//

import UIKit

final class BuyButton: UIButton {
    
    // MARK: - Properties

    private let leftLabel = UILabel()
    private let rightLabel = UILabel()
    
    // MARK: - Public Methods
    
    func setText(sellStatus: SellStatus, price: Double, years: Int, currency: String) {
        configureLabels(sellStatus: sellStatus, price: price, years: years, currency: currency)
    }
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupSubviews()
    }
    
    // MARK: - Private Methods
    
    private func setupSubviews() {
        addSubview(
            leftLabel,
            rightLabel
        )
        
        leftLabel.textAlignment = .left
        rightLabel.textAlignment = .right
        
        leftLabel.translatesAutoresizingMaskIntoConstraints = false
        rightLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            leftLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            leftLabel.topAnchor.constraint(equalTo: topAnchor),
            leftLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            rightLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            rightLabel.topAnchor.constraint(equalTo: topAnchor),
            rightLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            leftLabel.trailingAnchor.constraint(equalTo: rightLabel.leadingAnchor),
        ])
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
        let rightText = "от \(monthlyPayment) \(currency)/месяц"
        
        let leftTextAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 13, weight: .regular),
            .foregroundColor: UIColor.buttonTextColor
        ]
        
        let rightTextAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 13, weight: .regular),
            .foregroundColor: UIColor.buttonTextColor
        ]
        
        let leftString = NSMutableAttributedString()
        
        leftString.append(NSAttributedString(string: leftText, attributes: leftTextAttributes))
        
        let rightString = NSMutableAttributedString(string: rightText, attributes: rightTextAttributes)
            let boldRange = (rightText as NSString).range(of: "\(monthlyPayment) \(currency)")
            rightString.addAttributes([
                .font: UIFont.systemFont(ofSize: 14, weight: .bold),
                .foregroundColor: UIColor.buttonTextColor
            ], range: boldRange)

        
        leftLabel.attributedText = leftString
        rightLabel.attributedText = rightString   
    }
}
