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
        appearance.titleTextAttributes = [.foregroundColor : titleColor, .font: UIFont.systemFont(ofSize: 18, weight: .medium)]
        appearance.shadowColor = .clear
        self.navigationBar.standardAppearance = appearance
        self.navigationBar.scrollEdgeAppearance = appearance
        self.navigationBar.compactAppearance = appearance
        sender.navigationItem.title = title
    }
    
    func setupBarButtonItem(imageName: String, tintColor: UIColor, target: Any?, action: Selector, position: Position) {
        guard let image = UIImage(systemName: imageName) else { return }
        let button = UIBarButtonItem(image: image, style: .plain, target: target, action: action)
        switch position {
        case .left:
            self.topViewController?.navigationItem.leftBarButtonItem = button
            self.topViewController?.navigationItem.leftBarButtonItem?.tintColor = tintColor
        case .right:
            self.topViewController?.navigationItem.rightBarButtonItem = button
            self.topViewController?.navigationItem.rightBarButtonItem?.tintColor = tintColor
        }
    }
    
    func setupBackButton(title: String) {
        let backButton = UIBarButtonItem()
        backButton.title = title
        self.navigationBar.topItem?.backBarButtonItem = backButton
    }
}
