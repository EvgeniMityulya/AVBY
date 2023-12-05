//
//  SearchPresenter.swift
//  AVBY
//
//  Created by Евгений Митюля on 12/4/23.
//

import Foundation

protocol SearchViewOutput {
    func viewDidLoad()
    func openCatalogButtonTouchUpInside()
}

final class SearchPresenter: SearchViewOutput {
    
    private unowned var input: SearchViewInput
    
    init(input: SearchViewInput) {
        self.input = input
    }
    
    func viewDidLoad() {
        input.configureUI()
    }
    
    func openCatalogButtonTouchUpInside() {
        input.pushViewController(withViewController: CatalogViewController())
    }
    
}
