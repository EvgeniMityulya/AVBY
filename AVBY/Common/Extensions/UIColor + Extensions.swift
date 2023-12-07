//
//  UIColor + Extensions.swift
//  AVBY
//
//  Created by Евгений Митюля on 12/5/23.
//

import UIKit.UIColor

extension UIColor {
    static var backgroundViewControllerColor: UIColor {
        return UIColor(named: "backgroundVC") ?? .black
    }
    
    static var tabBarColor: UIColor {
        return UIColor(named: "tabBar") ?? .white
    }
    
    static var titleColor: UIColor {
        return UIColor(named: "title") ?? .black
    }
    
    static var subtitleColor: UIColor {
        return UIColor(named: "subtitle") ?? .black
    }
    
    static var cellColor: UIColor {
        return UIColor(named: "backgroundCell") ?? .black
    }
    
    static var iconColor: UIColor {
        return UIColor(named: "icon") ?? .black
    }
}
