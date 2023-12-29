//
//  CarDetailsCommonTableViewCell.swift
//  AVBY
//
//  Created by Евгений Митюля on 12/23/23.
//

import UIKit

final class CarDetailsCommonTableViewCell: UITableViewCell {
    private let titleLabel = UILabel()
    private let subtittleLabel = UILabel()
    private let overlayView = UIView()
    
    // MARK: - Lifecycle Methods
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupStyles()
        configureConstraints()
    }
    
    func configure(title: String, options: [String]) {
        titleLabel.text = title
        subtittleLabel.text = options.joined(separator:"\n")
    }
    
    private func setupStyles() {
        self.backgroundColor = .clear
        self.selectionStyle = .none
        overlayView.backgroundColor = .cellColor
        titleLabel.applyTextStyle(textColor: .titleColor, fontSize: 20, weight: .bold)
        subtittleLabel.applyTextStyle(textColor: .subtitleColor, fontSize: 15, weight: .regular)
        
        titleLabel.numberOfLines = 0
        subtittleLabel.numberOfLines = 0
    }
    
    private func configureConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtittleLabel.translatesAutoresizingMaskIntoConstraints = false
        overlayView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(overlayView)
        
        overlayView.addSubview(
            titleLabel,
            subtittleLabel
        )
        
        NSLayoutConstraint.activate([
            overlayView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            overlayView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            overlayView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            overlayView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            
            titleLabel.topAnchor.constraint(equalTo: overlayView.topAnchor, constant: 15),
            titleLabel.leadingAnchor.constraint(equalTo: overlayView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: overlayView.trailingAnchor, constant: -20),
            
            subtittleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            subtittleLabel.leadingAnchor.constraint(equalTo: overlayView.leadingAnchor, constant: 20),
            subtittleLabel.trailingAnchor.constraint(equalTo: overlayView.trailingAnchor, constant: -20),
            subtittleLabel.bottomAnchor.constraint(equalTo: overlayView.bottomAnchor, constant: -15),
        ])
    }
    
    
}
