//
//  SearchViewController.swift
//  AVBY
//
//  Created by Евгений Митюля on 12/4/23.
//

import UIKit

protocol SearchViewInput: AnyObject {
    func configureUI()
    func pushViewController(withViewController viewController: UIViewController)
}

class SearchViewController: UIViewController {
    
    var output: SearchViewOutput?
    
    private let openCatalogButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewDidLoad()
    }
    
    @objc private func openCatalogButtonTouchUpInside() {
        output?.openCatalogButtonTouchUpInside()
    }
}

extension SearchViewController: SearchViewInput {
    func pushViewController(withViewController viewController: UIViewController) {
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func configureUI() {
//        title = ""
        configureConstraints()
        configureButtons()
    }
    
    func configureConstraints() {
        view.backgroundColor = .backgroundViewControllerColor
        
        view.addSubview(openCatalogButton)
        
        openCatalogButton.translatesAutoresizingMaskIntoConstraints = false
        
        openCatalogButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        openCatalogButton.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
        openCatalogButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    
    func configureButtons() {
        openCatalogButton.setTitle("Open catalog", for: .normal)
        openCatalogButton.addTarget(self, action: #selector(openCatalogButtonTouchUpInside), for: .touchUpInside)
        openCatalogButton.backgroundColor = .blue
    }
}

