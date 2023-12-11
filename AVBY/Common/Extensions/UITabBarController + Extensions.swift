//
//  UITabBarController + Extensions.swift
//  AVBY
//
//  Created by Евгений Митюля on 12/9/23.
//

import UIKit

extension UITabBarController {
    func setupTabBar(backgroundColor: UIColor, unselectedItemTintColor: UIColor, selectedItemTintColor: UIColor) {
        let appearance = UITabBarAppearance()
        appearance.configureWithDefaultBackground()
        appearance.backgroundColor = backgroundColor
        appearance.shadowColor = .clear
        appearance.selectionIndicatorTintColor = selectedItemTintColor
        
        appearance.stackedLayoutAppearance.normal.iconColor = unselectedItemTintColor
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: unselectedItemTintColor]
        appearance.stackedLayoutAppearance.selected.iconColor = selectedItemTintColor
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: selectedItemTintColor]
        
        self.tabBar.standardAppearance = appearance
        self.tabBar.scrollEdgeAppearance = appearance
    }
}
