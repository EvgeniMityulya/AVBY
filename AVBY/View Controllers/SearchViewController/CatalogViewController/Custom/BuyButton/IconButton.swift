//
//  IconButton.swift
//  AVBY
//
//  Created by Евгений Митюля on 12/10/23.
//

import UIKit

final class IconButton: UIButton {
    
    var buttonTintColor: UIColor = .white {
        didSet {
            tintColor = buttonTintColor
        }
    }
    
    var buttonBackgroundColor: UIColor = .bottomButtonColor {
        didSet {
            backgroundColor = buttonBackgroundColor
        }
    }
    
    var cornerRadius: CGFloat = 10 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    
    init(iconName: String, iconSize: CGFloat, tintColor: UIColor = .white, backgroundColor: UIColor = .bottomButtonColor, cornerRadius: CGFloat = 10) {
        super.init(frame: .zero)
        self.buttonTintColor = tintColor
        self.buttonBackgroundColor = backgroundColor
        self.cornerRadius = cornerRadius
        
        setup(iconName: iconName, iconSize: iconSize)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    private func setup(iconName: String, iconSize: CGFloat) {
        let configuration = UIImage.SymbolConfiguration(pointSize: iconSize, weight: .medium)
        let image = UIImage(systemName: iconName, withConfiguration: configuration)
        
        var buttonConfig = UIButton.Configuration.plain()
        buttonConfig.image = image
        buttonConfig.baseBackgroundColor = .white
        buttonConfig.imagePadding = 10
        
        tintColor = buttonTintColor
        backgroundColor = buttonBackgroundColor
        layer.cornerRadius = cornerRadius
        
        self.configuration = buttonConfig
    }
}
