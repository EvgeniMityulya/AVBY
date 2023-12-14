//
//  CarImagesCollectionView.swift
//  AVBY
//
//  Created by Евгений Митюля on 12/7/23.
//

import UIKit

final class CarImagesCollectionView: UICollectionView {
    
    // MARK: - Properties
    
    private var car: Car? {
        didSet {
            reloadData()
        }
    }
    
    // MARK: - Initialization
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 3
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        
        super.init(frame: .zero, collectionViewLayout: layout)
        configureCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    
    func setupCollectionView(car: Car) {
        self.car = car
        reloadData()
    }
    
    // MARK: - Private Methods
    
    private func configureCollectionView() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.showsHorizontalScrollIndicator = false
        self.backgroundColor = .clear
        self.register(CarImagesCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        self.delegate = self
        self.dataSource = self
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource

extension CarImagesCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return car?.imageName.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CarImagesCollectionViewCell
        
        guard let car = car else {
            return cell
        }
        cell.isFirstCell = false
        cell.isLastCell = false
        if indexPath.item == 0 {
            cell.isFirstCell = true
        } else if indexPath.item == collectionView.numberOfItems(inSection: 0) - 1 {
            cell.isLastCell = true
        }
        
        let carImageName = car.imageName[indexPath.item]
        cell.configure(with: carImageName)
        
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension CarImagesCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let carImageName = car?.imageName[indexPath.item],
              let image = UIImage(named: carImageName),
              let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout else {
            if let placeholderImage = UIImage(named: "noImage") {
                let aspectRatio = placeholderImage.size.width / placeholderImage.size.height
                let height: CGFloat = collectionView.frame.height - collectionView.contentInset.top - collectionView.contentInset.bottom
                let width = height * aspectRatio
                return CGSize(width: width, height: height)
            } else {
                return CGSize(width: 100, height: 100)
            }
        }
        
        let aspectRatio = image.size.width / image.size.height
        let height: CGFloat = collectionView.frame.height - flowLayout.sectionInset.top - flowLayout.sectionInset.bottom
        let width = height * aspectRatio
        return CGSize(width: width, height: height)
    }
}
