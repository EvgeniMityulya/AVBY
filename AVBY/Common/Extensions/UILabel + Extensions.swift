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
    
    func setLetterSpacing(spacing: CGFloat) {
        let labelText = self.text ?? ""
        
        let attributedString = NSMutableAttributedString(string: labelText)
        attributedString.addAttribute(NSAttributedString.Key.kern, value: spacing, range: NSRange(location: 0, length: attributedString.length))
        
        self.attributedText = attributedString
    }
}
