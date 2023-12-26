//
//  ImageTextButton.swift
//  AVBY
//
//  Created by Евгений Митюля on 12/21/23.
//

import UIKit

class ImageTextButton: UIButton {
    
    // MARK: - Properties
    
    private let textLabel = UILabel()
    private let iconImageView = UIImageView()
    private let stackView = UIStackView()
    
    // MARK: - Public Methods
    
    func configure(imageName: String, text: String) {
        configureButton(imageName: imageName, text: text)
    }
    
    // MARK: - Initialization
    
    init(imageName: String, text: String) {
        super.init(frame: .zero)
        setupSubviews()
        setupUI()
        configure(imageName: imageName, text: text)
    }
    
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
        addSubview(stackView)
        
        stackView.addArrangedSubview(iconImageView)
        stackView.addArrangedSubview(textLabel)
        
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
        ])
    }
    
    private func setupUI() {
        self.backgroundColor = .clear
        self.layer.cornerRadius = 8
        
        stackView.backgroundColor = .clear
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = 5
        
        iconImageView.layer.cornerRadius = 3
        
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.layer.masksToBounds = true
    }
    
    private func configureButton(imageName: String, text: String) {
        let textAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 13, weight: .regular),
            .foregroundColor: UIColor.detailsBlueColor
        ]
        
        let textString = NSMutableAttributedString()
        
        if let iconImage = UIImage(systemName: imageName) {
            let resizedIconImage = iconImage.setImageSize(pointSize: 20, weight: .bold)
            iconImageView.image = resizedIconImage
            iconImageView.tintColor = UIColor.detailsBlueColor
        }
        
        textString.append(NSAttributedString(string: text, attributes: textAttributes))
        
        textLabel.attributedText = textString
    }
    
}
