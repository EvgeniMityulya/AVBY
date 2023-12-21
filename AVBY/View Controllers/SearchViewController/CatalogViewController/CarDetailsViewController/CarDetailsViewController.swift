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
}

final class CarDetailsViewController: UIViewController {

    var output: CarDetailsViewOutput?
    
    private var car: Car?
    
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
    func setData(car: Car) {
        self.car = car
    }
    
    func configureUI() {
        self.view.backgroundColor = .white
        detailsTableView.separatorStyle = .none
        detailsTableView.backgroundColor = .red
        detailsTableView.register(CarDetailsTableViewCell.self, forCellReuseIdentifier: "CarDetailsCell")
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
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CarDetailsCell", for: indexPath) as? CarDetailsTableViewCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        guard let car = self.car else { return UITableViewCell() }
        cell.configure(car: car)
        return cell
    }
}
