//
//  UIColor + Extensions.swift
//  AVBY
//
//  Created by Евгений Митюля on 12/5/23.
//

import UIKit.UIColor

extension UIColor {
    static var backgroundViewColor: UIColor {
        return UIColor(named: "backgroundView") ?? .black
    }
    
    static var tabBarColor: UIColor {
        return UIColor(named: "tabBar") ?? .white
    }
    
    static var iconColor: UIColor {
        return UIColor(named: "icon") ?? .black
    }
    
    static var iconTouchedColor: UIColor {
        return UIColor(named: "iconTouched") ?? .black
    }
    
    static var cellColor: UIColor {
        return UIColor(named: "cell") ?? .black
    }
    
    static var separatorColor: UIColor {
        return UIColor(named: "separate") ?? .black
    }
}
