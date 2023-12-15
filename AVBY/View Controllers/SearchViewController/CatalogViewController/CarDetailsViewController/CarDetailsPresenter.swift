//
//  CarDetailsPresenter.swift
//  AVBY
//
//  Created by Евгений Митюля on 12/15/23.
//

import Foundation

protocol CarDetailsViewOutput {
    func viewDidLoad()
    func viewWillAppear()
    func setupModel(car: Car)
}

final class CarDetailsPresenter: CarDetailsViewOutput {
    
    private unowned var input: CarDetailsViewInput
    
    init(input: CarDetailsViewInput) {
        self.input = input
    }
    
    func viewDidLoad() {
        input.configureUI()
        input.configureConstraints()
    }
    
    func setupModel(car: Car) {
        input.setData(car: car)
    }
    
    func viewWillAppear() {
        input.configureNavigationBar()
    }
}
