//
//  UILabel + Extensions.swift
//  AVBY
//
//  Created by Евгений Митюля on 12/7/23.
//

import UIKit

extension UILabel {
    func applyTextStyle(textColor: UIColor, fontSize: CGFloat, weight: UIFont.Weight, text: String? = nil) {
        self.textColor = textColor
        self.font = UIFont.systemFont(ofSize: fontSize, weight: weight)
        if let text = text {
            self.text = text
        }
    }
}
