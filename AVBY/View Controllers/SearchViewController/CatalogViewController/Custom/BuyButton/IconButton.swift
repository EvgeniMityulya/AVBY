//
//  IconButton.swift
//  AVBY
//
//  Created by Евгений Митюля on 12/10/23.
//

import UIKit

final class IconButton: UIButton {
    
    init(iconName: String) {
        super.init(frame: .zero)
        setup(iconName: iconName)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setup(iconName: String) {
        let configuration = UIImage.SymbolConfiguration(pointSize: 16, weight: .medium)
        let image = UIImage(systemName: iconName, withConfiguration: configuration)
        
        var buttonConfig = UIButton.Configuration.plain()
        buttonConfig.image = image
        buttonConfig.baseBackgroundColor = .white
        buttonConfig.imagePadding = 10
        tintColor = .white
        backgroundColor = .bottomButtonColor
        layer.cornerRadius = 10
        
        self.configuration = buttonConfig
        
        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc private func buttonTapped() {
        print("Search button tapped")
    }
}
