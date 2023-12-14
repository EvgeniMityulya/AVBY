//
//  AnnouncementViewController.swift
//  AVBY
//
//  Created by Евгений Митюля on 12/13/23.
//

import UIKit

protocol AnnouncementCarViewInput: AnyObject {
    func configureUI()
}

final class AnnouncementCarViewController: UIViewController {

    var output: AnnouncementCarViewOutput?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewDidLoad()
    }
}

extension AnnouncementCarViewController: AnnouncementCarViewInput {
    func configureUI() {
        self.view.backgroundColor = .red
    }
}
