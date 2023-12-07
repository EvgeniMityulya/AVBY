//
//  CarImagesCollectionView.swift
//  AVBY
//
//  Created by Евгений Митюля on 12/7/23.
//

import UIKit

final class CarImagesCollectionView: UICollectionView {
    // MARK: - Initialization
    
    init(width: Int, height: Int) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.itemSize = CGSize(width: width, height: height)
        super.init(frame: .zero, collectionViewLayout: layout)
        configureCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    // MARK: - Private Methods
    
    private func configureCollectionView() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.showsHorizontalScrollIndicator = false
        self.backgroundColor = .clear
    }
}
