//
//  UIView + Extensions.swift
//  AVBY
//
//  Created by Евгений Митюля on 12/6/23.
//

import UIKit

extension UIView {
    func addSubview(_ views: UIView...) {
        for view in views {
            self.addSubview(view)
        }
    }
}
