//
//  AnnouncementCarPresenter.swift
//  AVBY
//
//  Created by Евгений Митюля on 12/15/23.
//

import Foundation

protocol AnnouncementCarViewOutput {
    func viewDidLoad()
}

final class AnnouncementCarPresenter: AnnouncementCarViewOutput {
    
    private unowned var input: AnnouncementCarViewInput
    
    init(input: AnnouncementCarViewInput) {
        self.input = input
    }
    
    func viewDidLoad() {
        input.configureUI()
    }
}
