//
//  IconViewBuilder.swift
//  AVBY
//
//  Created by Евгений Митюля on 12/8/23.
//

import UIKit

protocol IconViewBuildable {
    func setConfiguration(_ configuration: IconViewConfiguration) -> Self
    func setPosition(_ position: Position) -> Self
    func setWidth(_ width: CGFloat) -> Self
    func setHeight(_ height: CGFloat) -> Self
    func build() -> IconView
}

final class IconViewBuilder: IconViewBuildable {
    private var configuration: IconViewConfiguration = IconViewConfiguration()
    private var position: Position = .left
    private var width: CGFloat = 1
    private var height: CGFloat = 1

    func setConfiguration(_ configuration: IconViewConfiguration) -> Self {
        self.configuration = configuration
        return self
    }

    func setPosition(_ position: Position) -> Self {
        self.position = position
        return self
    }

    func setWidth(_ width: CGFloat) -> Self {
        self.width = width
        return self
    }

    func setHeight(_ height: CGFloat) -> Self {
        self.height = height
        return self
    }

    func build() -> IconView {
        return IconView(
            with: configuration,
            position: position,
            width: width,
            height: height
        )
    }
}
