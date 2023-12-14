//
//  CatalogPresenter.swift
//  AVBY
//
//  Created by Евгений Митюля on 12/6/23.
//

import Foundation

protocol CatalogViewOutput {
    func viewDidLoad()
    func viewWillAppear()
    func didSelectRowAt(car: Car)
}

final class CatalogPresenter: CatalogViewOutput {
    
    private unowned var input: CatalogViewInput
    
    init(input: CatalogViewInput) {
        self.input = input
    }
    
    func viewDidLoad() {
        input.configureUI()
        input.configureConstraints()
    }
    
    func viewWillAppear() {
        input.configureNavigationBar()
    }
    
    func didSelectRowAt(car: Car) {
        input.pushViewController(with: car)
    }
}
