//
//  CarDetailsCollectionView.swift
//  AVBY
//
//  Created by Евгений Митюля on 12/17/23.
//

import UIKit

final class CarDetailsCollectionView: UICollectionView {
    
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
        layout.minimumLineSpacing = 3
        layout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        
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
        self.register(CarDetailsCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        self.delegate = self
        self.dataSource = self
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource

extension CarDetailsCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return car?.imageName.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CarDetailsCollectionViewCell
        
        guard let car = car else {
            return cell
        }
        
        let carImageName = car.imageName[indexPath.item]
        cell.configure(with: carImageName)
        
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension CarDetailsCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let carImageName = car?.imageName[indexPath.item],
              let _ = UIImage(named: carImageName),
              let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout else {
            return CGSize(width: max(collectionView.frame.width - 10, 0), height: 240)
        }
        let height: CGFloat = collectionView.frame.height - flowLayout.sectionInset.top - flowLayout.sectionInset.bottom
        let width = collectionView.frame.width - flowLayout.sectionInset.left - flowLayout.sectionInset.right
        return CGSize(width: width, height: height)
    }
}
