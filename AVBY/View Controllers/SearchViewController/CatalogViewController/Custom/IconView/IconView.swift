//
//  LeftIconViewBuilder.swift
//  AVBY
//
//  Created by Евгений Митюля on 12/8/23.
//

import UIKit

protocol IconViewConfigurable: AnyObject {
    func configure(with configuration: IconViewConfiguration)
    func configureConstraints(position: Position, width: CGFloat, height: CGFloat)
}

class IconView: UIView, IconViewConfigurable {
    
    // MARK: - UI Elements
    
    private let iconImageView = UIImageView()
    private let titleLabel = UILabel()
    
    // MARK: - Initialization
    
    init(with configuration: IconViewConfiguration, position: Position, width: CGFloat, height: CGFloat) {
        super.init(frame: .zero)
        configure(with: configuration)
        configureConstraints(position: position, width: width, height: height)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure(with: IconViewConfiguration())
        configureConstraints(position: .left, width: 1, height: 1)
    }
    
    func configure(with configuration: IconViewConfiguration) {
        setView(
            bgColor: configuration.bgColor,
            cornerRadius: configuration.cornerRadius
        )
        setImage(
            systemName: configuration.systemName,
            imageSize: configuration.imageSize,
            imageWeight: configuration.imageWeight,
            imageColor: configuration.imageColor
        )
        setText(
            title: configuration.title,
            textColor: configuration.textColor,
            textSpacing: configuration.textSpacing,
            fontSize: configuration.fontSize,
            fontWeight: configuration.fontWeight
        )
    }
    
    // MARK: - Public Methods
    
    func configureConstraints(position: Position, width: CGFloat, height: CGFloat) {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(titleLabel)
        addSubview(iconImageView)
        
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: width),
            heightAnchor.constraint(equalToConstant: height),
            
            iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
        
        switch position {
        case .left:
            iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 3).isActive = true
            iconImageView.trailingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: -3).isActive = true
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -3).isActive = true
        case .right:
            
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 3).isActive = true
            titleLabel.trailingAnchor.constraint(equalTo: iconImageView.leadingAnchor, constant: 0).isActive = true
            titleLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.6).isActive = true
            iconImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -3).isActive = true
        }
    }
    
    // MARK: - Private Methods
    
    private func setImage(
        systemName: String,
        imageSize: CGFloat,
        imageWeight: UIImage.SymbolWeight,
        imageColor: UIColor
    ) {
        if let iconImage = UIImage(systemName: systemName) {
            let resizedIconImage = iconImage.setImageSize(pointSize: imageSize, weight: imageWeight)
            iconImageView.image = resizedIconImage
            iconImageView.tintColor = imageColor
        }
        iconImageView.contentMode = .scaleAspectFit
    }
    
    private func setText(
        title: String,
        textColor: UIColor,
        textSpacing: CGFloat,
        fontSize: CGFloat,
        fontWeight:UIFont.Weight
    ) {
        titleLabel.text = title
        titleLabel.textAlignment = .center
        
        titleLabel.setLetterSpacing(spacing: textSpacing)
        titleLabel.applyTextStyle(textColor: textColor, fontSize: fontSize, weight: fontWeight)
    }
    
    private func setView(
        bgColor: UIColor,
        cornerRadius: CGFloat
    ) {
        backgroundColor = bgColor
        layer.cornerRadius = cornerRadius
    }
}
