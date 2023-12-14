//
//  AnnouncementCarBuilder.swift
//  AVBY
//
//  Created by Евгений Митюля on 12/15/23.
//

import Foundation

enum AnnouncementCarBuilder {
    static func setupModule() -> AnnouncementCarViewController {
        let viewController = AnnouncementCarViewController()
        viewController.output = AnnouncementCarPresenter(input: viewController)
        return viewController
    }
}
