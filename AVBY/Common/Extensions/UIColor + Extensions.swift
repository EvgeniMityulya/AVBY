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
    
    static var separatorColor: UIColor {
        return UIColor(named: "separate") ?? .black
    }
    
    static var topColor: UIColor {
        return UIColor(named: "top") ?? .black
    }
    
    static var vinColor: UIColor {
        return UIColor(named: "vin") ?? .black
    }
    
    static var buttonTextColor: UIColor {
        return UIColor(named: "buttonText") ?? .black
    }

    static var barIconUnactiveColor: UIColor {
        return UIColor(named: "barIconUnactive") ?? .black
    }

    static var barIconActiveColor: UIColor {
        return UIColor(named: "barIconActive") ?? .black
    }

    static var bottomButtonColor: UIColor {
        return UIColor(named: "bottomButton") ?? .black
    }
    
    static var buttonColor: UIColor {
        return UIColor(named: "button") ?? .black
    }
    
    static var buttonDownTintColor: UIColor {
        return UIColor(named: "buttonDownTint") ?? .black
    }
    
    static var detailsBlueColor: UIColor {
        return UIColor(named: "detailsBlue") ?? .black
    }
}
