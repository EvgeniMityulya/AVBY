//
//  UINavigationController + Extensions.swift
//  AVBY
//
//  Created by Евгений Митюля on 12/7/23.
//

import UIKit

extension UINavigationController {
    func setupMavigationBar(backgroundColor: UIColor, titleColor: UIColor, title: String, sender: UIViewController) {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithDefaultBackground()
        appearance.backgroundColor = backgroundColor
        appearance.titleTextAttributes = [.foregroundColor : titleColor, .font: UIFont.systemFont(ofSize: 20, weight: .semibold)]
        appearance.shadowColor = .clear
        self.navigationBar.standardAppearance = appearance
        self.navigationBar.scrollEdgeAppearance = appearance
        self.navigationBar.compactAppearance = appearance
        sender.navigationItem.title = title
    }
}
