//
//  CatalogViewController.swift
//  AVBY
//
//  Created by Евгений Митюля on 12/5/23.
//

import UIKit

protocol CatalogViewInput: AnyObject {
    func viewDidLoad()
    func configureUI()
    func configureConstraints()
}

class CatalogViewController: UIViewController {
    
    var output: CatalogViewOutput?
    
    private let cars: [Car] = Car.cars
    
    private let catalogTableView = UITableView(frame: .zero, style: .plain)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        catalogTableView.dataSource = self
        catalogTableView.delegate = self
        output?.viewDidLoad()
    }
}

extension CatalogViewController: CatalogViewInput {
    func configureUI() {
        view.backgroundColor = .backgroundViewControllerColor
        
        catalogTableView.backgroundColor = .clear
        catalogTableView.register(CarTableViewCell.self, forCellReuseIdentifier: "CarCell")
    }
    
    func configureConstraints() {
        view.addSubview(catalogTableView)
        
        catalogTableView.translatesAutoresizingMaskIntoConstraints = false
        
        catalogTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        catalogTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        catalogTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        catalogTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
    }
}

extension CatalogViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CarCell", for: indexPath) as? CarTableViewCell else { return UITableViewCell() }
        let car = cars[indexPath.row]
        cell.configure(car: car, indexPath: indexPath)
        return cell
    }
}
