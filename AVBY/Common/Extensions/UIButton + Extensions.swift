//
//  UIButton + Extensions.swift
//  AVBY
//
//  Created by Евгений Митюля on 12/6/23.
//

import Foundation
import UIKit

extension UIButton {
    func configure(with systemName: String, pointSize: CGFloat, weight: UIImage.SymbolWeight = .light) {
        if let symbolImage = UIImage(systemName: systemName) {
            let configuration = UIImage.SymbolConfiguration(pointSize: pointSize, weight: weight)
            let largerSymbolImage = symbolImage.withConfiguration(configuration)
            self.setImage(largerSymbolImage, for: .normal)
            self.imageView?.contentMode = .scaleAspectFit
        }
    }
}
