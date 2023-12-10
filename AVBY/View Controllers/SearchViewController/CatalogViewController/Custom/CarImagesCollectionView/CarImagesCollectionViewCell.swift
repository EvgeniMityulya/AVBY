//
//  CarImagesCollectionViewCell.swift
//  AVBY
//
//  Created by Евгений Митюля on 12/9/23.
//

import UIKit

class CarImagesCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    var isFirstCell: Bool = false {
        didSet {
            updateCornerRadius()
        }
    }
    
    var isLastCell: Bool = false {
        didSet {
            updateCornerRadius()
        }
    }
    
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
    
    // MARK: - Lifecycle
    
    override func prepareForReuse() {
        super.prepareForReuse()
        resetCornerRadius()
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
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
    }
    
    private func resetCornerRadius() {
        imageView.layer.cornerRadius = 0
        imageView.layer.maskedCorners = []
    }
    
    private func updateCornerRadius() {
        if self.isFirstCell {
            imageView.layer.cornerRadius = 10
            imageView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        } else if self.isLastCell {
            imageView.layer.cornerRadius = 10
            imageView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        } else {
            resetCornerRadius()
        }
    }
}
