//
//  UIImage + Extensions.swift
//  AVBY
//
//  Created by Евгений Митюля on 12/8/23.
//

import UIKit

extension UIImage {
    func setImageSize(pointSize: CGFloat, weight: UIImage.SymbolWeight = .light) -> UIImage {
        let configuration = UIImage.SymbolConfiguration(pointSize: pointSize, weight: weight)
        return self.withConfiguration(configuration)
    }
}
