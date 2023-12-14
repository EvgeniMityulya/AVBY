//
//  IconTextButton.swift
//  AVBY
//
//  Created by Евгений Митюля on 12/10/23.
//

import UIKit

final class IconTextButton: UIButton {
    
    init(iconName: String, title: String) {
        super.init(frame: .zero)
        setup(iconName: iconName, title: title)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setup(iconName: String, title: String) {
        let configuration = UIImage.SymbolConfiguration(pointSize: 16, weight: .medium)
        let image = UIImage(systemName: iconName, withConfiguration: configuration)
        
        
        var buttonConfig = UIButton.Configuration.plain()
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 18, weight: .medium),
            .foregroundColor: UIColor.white
        ]
        let attributedTitle = NSAttributedString(string: title, attributes: attributes)
        
        buttonConfig.attributedTitle = AttributedString(attributedTitle)
        
        buttonConfig.image = image
        buttonConfig.baseBackgroundColor = .white
        buttonConfig.imagePadding = 10
        buttonConfig.titlePadding = 10
        tintColor = .white
        backgroundColor = .bottomButtonColor
        layer.cornerRadius = 10
        
        self.configuration = buttonConfig
        
        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc private func buttonTapped() {
        print("Settings button tapped")
    }
}
