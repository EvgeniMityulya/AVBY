//
//  CatalogViewController.swift
//  AVBY
//
//  Created by Евгений Митюля on 12/5/23.
//

import UIKit

protocol CatalogViewInput: AnyObject {
    func configureUI()
    func configureConstraints()
    func configureNavigationBar()
    func pushViewController(with: Car)
}

final class CatalogViewController: UIViewController {
    
    var output: CatalogViewOutput?
    var previousContentOffsetY: CGFloat = 0
    
    private let cars: [Car] = Car.cars
    
    private let catalogTableView = UITableView(frame: .zero, style: .plain)
    
    private let bottomStackView = UIStackView()
    private let firstBottomButton = IconButton(iconName: Icons.sparkleMagnifyingglass, iconSize: 16)
    private let secondBottomButton = IconTextButton(iconName: Icons.gearshape, title: "Параметры")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        catalogTableView.dataSource = self
        catalogTableView.delegate = self
        output?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        output?.viewWillAppear()
    }
    
    @objc private func sortButtonTapped() {
        print("Sort Button Tapped")
    }
    
    @objc private func settingsButtonTapped() {
        print("Settings Button Tapped")
    }
    
    @objc private func searchButtonTapped() {
        print("Search Button Tapped")
    }
}

extension CatalogViewController: CatalogViewInput {
    func pushViewController(with car: Car) {
        let viewController = CarDetailsBuilder.setupModule(car: car)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func configureNavigationBar() {
        self.navigationController?.setupBackButton(title: "")
        self.navigationController?.setupMavigationBar(backgroundColor: .tabBarColor, titleColor: .titleColor, title: "\(cars.count) объявлений", sender: self)
        self.navigationController?.setupBarButtonItem(imageName: Icons.arrowUpDown, tintColor: .barIconActiveColor, target: self, action: #selector(sortButtonTapped), position: .right)
        self.tabBarController?.setupTabBar(backgroundColor: .tabBarColor, unselectedItemTintColor: .barIconUnactiveColor, selectedItemTintColor: .barIconActiveColor)
    }
    
    func configureUI() {
        view.backgroundColor = .backgroundViewControllerColor
        
        catalogTableView.showsVerticalScrollIndicator = false
        catalogTableView.backgroundColor = .clear
        catalogTableView.separatorStyle = .none
        catalogTableView.contentInset =  UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        catalogTableView.register(CarTableViewCell.self, forCellReuseIdentifier: "CarCell")
        
        bottomStackView.backgroundColor = .clear
        bottomStackView.axis = .horizontal
        bottomStackView.distribution = .equalCentering
        bottomStackView.alignment = .center
        bottomStackView.spacing = 3
        
        firstBottomButton.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
        secondBottomButton.addTarget(self, action: #selector(settingsButtonTapped), for: .touchUpInside)
    }
    
    func configureConstraints() {
        view.addSubview(
            catalogTableView,
            bottomStackView
        )
        
        firstBottomButton.translatesAutoresizingMaskIntoConstraints = false
        secondBottomButton.translatesAutoresizingMaskIntoConstraints = false
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        catalogTableView.translatesAutoresizingMaskIntoConstraints = false
        
        bottomStackView.addArrangedSubview(firstBottomButton)
        bottomStackView.addArrangedSubview(secondBottomButton)
        
        
        NSLayoutConstraint.activate([
            catalogTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            catalogTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            catalogTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            catalogTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            
            bottomStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bottomStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            
            firstBottomButton.widthAnchor.constraint(equalToConstant: 60),
            firstBottomButton.heightAnchor.constraint(equalToConstant: 45),
            
            secondBottomButton.widthAnchor.constraint(equalToConstant: 170),
            secondBottomButton.heightAnchor.constraint(equalToConstant: 45),
        ])
    }
}

extension CatalogViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentOffsetY = scrollView.contentOffset.y
        let hideThreshold: CGFloat = 20
        
        let deltaY = contentOffsetY - previousContentOffsetY
        
        if abs(deltaY) > hideThreshold {
            if deltaY > 0 {
                hideBottomButtons()
            } else if deltaY < 0 {
                showBottomButtons()
            }
            
            previousContentOffsetY = contentOffsetY
        }
    }
    
    private func showBottomButtons() {
        if bottomStackView.isHidden {
            bottomStackView.isHidden = false
            UIView.animate(withDuration: 0.3) {
                self.bottomStackView.alpha = 1.0
            }
        }
    }
    
    private func hideBottomButtons() {
        if !bottomStackView.isHidden {
            UIView.animate(withDuration: 0.3) {
                self.bottomStackView.alpha = 0.0
            } completion: { _ in
                self.bottomStackView.isHidden = true
            }
        }
    }
}

extension CatalogViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CarCell", for: indexPath) as? CarTableViewCell else { return UITableViewCell() }
        let car = cars[indexPath.row]
        cell.selectionStyle = .none
        cell.configure(car: car, indexPath: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        output?.didSelectRowAt(car: cars[indexPath.row])
    }
}
