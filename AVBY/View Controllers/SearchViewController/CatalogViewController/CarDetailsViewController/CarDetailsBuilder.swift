//
//  CarDetailsBuilder.swift
//  AVBY
//
//  Created by Евгений Митюля on 12/15/23.
//

import Foundation

enum CarDetailsBuilder {
    static func setupModule(car: Car) -> CarDetailsViewController {
        let viewController = CarDetailsViewController()
        viewController.output = CarDetailsPresenter(input: viewController)
        viewController.output?.setupModel(car: car)
        return viewController
    }
}
