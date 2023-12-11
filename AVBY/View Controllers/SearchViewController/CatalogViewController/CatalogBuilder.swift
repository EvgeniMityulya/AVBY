//
//  CatalogBuilder.swift
//  AVBY
//
//  Created by Евгений Митюля on 12/6/23.
//

import Foundation

enum CatalogBuilder {
    static func setupModule() -> CatalogViewController {
        let viewController = CatalogViewController()
        viewController.output = CatalogPresenter(input: viewController)
        return viewController
    }
}
