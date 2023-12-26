//
//  RoundedButton.swift
//  AVBY
//
//  Created by Евгений Митюля on 12/26/23.
//

import UIKit

final class RoundedButton: UIButton {
    private let textLabel = UILabel()
    
    func setText(text: String) {
        textLabel.text = text
    }
    
    private func setupSubviews() {
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(textLabel)
        
        NSLayoutConstraint.activate([
            textLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            textLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    
    private func setupUI() {
        self.backgroundColor = .red
        self.layer.cornerRadius = 8
    }
    
//    private func 
}
