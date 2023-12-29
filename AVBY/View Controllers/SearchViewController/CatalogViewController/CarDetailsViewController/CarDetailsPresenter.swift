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
    func viewWillDisappear()
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
        input.makeSections()
    }
    
    func viewWillAppear() {
        input.configureNavigationBar()
        input.hideBottomTabBar()
    }
    
    func viewWillDisappear() {
        input.showBottomTabBar()
    }
    
    func setupModel(car: Car) {
        input.setData(car: car)
    }
    
    
}
