//
//  CarDetailsViewController.swift
//  AVBY
//
//  Created by Евгений Митюля on 12/13/23.
//

import UIKit

protocol CarDetailsViewInput: AnyObject {
    func configureUI()
    func configureConstraints()
    func configureNavigationBar()
    func setData(car: Car)
    func makeSections()
}

final class CarDetailsViewController: UIViewController {
    
    var output: CarDetailsViewOutput?
    
    private var car: Car?
    private var sections = [CarDetailsSection]()
    
    private let detailsTableView = UITableView(frame: .zero, style: .plain)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailsTableView.dataSource = self
        detailsTableView.delegate = self
        output?.viewDidLoad()
    }
    
    @objc private func moreButtonTapped() {
        print("First Bottom Button Tapped")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        output?.viewWillAppear()
    }
}

extension CarDetailsViewController: CarDetailsViewInput {
    func makeSections() {
        guard let car = self.car else { return }
        let tradeStatus = car.trade == true ? "" : "не "
        
        let mainInfoSection: CarDetailsSection = .mainInfo
        let detailsSection: CarDetailsSection = .description(CarOptions(title: "Описание", options: [car.about]))
        let optionsSection: CarDetailsSection = .description(CarOptions(title: "Комплектация", options: car.equipment.map { $0.rawValue  }))
        let exhangeSection: CarDetailsSection = .description(CarOptions(title: "Обмен \(tradeStatus)интересует", options: ["Продавца \(tradeStatus)интересует обмен"]))
        
        sections = [mainInfoSection, detailsSection, optionsSection, exhangeSection]
        
        DispatchQueue.main.async {
            self.detailsTableView.reloadData()
        }
    }
    
    func setData(car: Car) {
        self.car = car
    }
    
    func configureUI() {
        self.view.backgroundColor = .backgroundViewControllerColor
        detailsTableView.separatorStyle = .none
        detailsTableView.backgroundColor = .buttonColor
        detailsTableView.register(CarDetailsMainTableViewCell.self, forCellReuseIdentifier: "CarDetailsMainCell")
        detailsTableView.register(CarDetailsCommonTableViewCell.self, forCellReuseIdentifier: "CarDetailsCommonCell")
    }
    
    func configureNavigationBar() {
        self.navigationController?.setupBackButton(title: "")
        self.navigationController?.setupMavigationBar(backgroundColor: .cellColor, titleColor: .titleColor, title: "", sender: self)
        self.navigationController?.setupBarButtonItem(imageName: Icons.ellipsis, tintColor: .barIconActiveColor, target: self, action: #selector(moreButtonTapped), position: .right)
        self.tabBarController?.setupTabBar(backgroundColor: .tabBarColor, unselectedItemTintColor: .barIconUnactiveColor, selectedItemTintColor: .barIconActiveColor)
    }
    
    func configureConstraints() {
        view.addSubview(
            detailsTableView
        )
        
        detailsTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            detailsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            detailsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            detailsTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            detailsTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
        ])
    }
    
    
}

extension CarDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentSection = sections[indexPath.row]
        switch currentSection {
        case .mainInfo:
            if let car = car, let cell = tableView.dequeueReusableCell(withIdentifier: "CarDetailsMainCell", for: indexPath) as? CarDetailsMainTableViewCell {
                cell.configure(car: car)
                return cell
            }
        case .description(let carOptions):
            if let cell = tableView.dequeueReusableCell(withIdentifier: "CarDetailsCommonCell", for: indexPath) as? CarDetailsCommonTableViewCell {
                cell.configure(title: carOptions.title, options: carOptions.options)
                return cell
            }
        }
        
        return UITableViewCell()
    }
}
