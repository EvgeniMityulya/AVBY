//
//  CarDetailsCollectionViewCell.swift
//  AVBY
//
//  Created by Евгений Митюля on 12/17/23.
//

import UIKit

final class CarDetailsCollectionViewCell: UICollectionViewCell {
    
    // MARK: - UI Elements
    
    private let imageView = UIImageView()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    // MARK: - Public Methods
    
    func configure(with imageName: String) {
        if let image = UIImage(named: imageName) {
            imageView.image = image
        } else {
            imageView.image = UIImage(named: "noImage")
        }
    }
    
    // MARK: - Private Methods
    
    private func setupViews() {
        configureImageView()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    private func configureImageView() {
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
    }
}
