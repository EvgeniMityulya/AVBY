//
//  SearchBuilder.swift
//  AVBY
//
//  Created by Евгений Митюля on 12/4/23.
//

import Foundation

enum SearchBuilder {
    static func setupModule() -> SearchViewController {
        let viewController = SearchViewController()
        viewController.output = SearchPresenter(input: viewController)
        return viewController
    }
}
