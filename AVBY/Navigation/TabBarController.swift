//
//  TabBarController.swift
//  AVBY
//
//  Created by Евгений Митюля on 12/4/23.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        // MARK: - View Controllers
        
        let searchViewController = SearchBuilder.setupModule()
        let favouriteViewController = FavouriteViewController()
        let announcementViewController = AnnouncementViewController()
        let dialogViewController = DialogViewController()
        let otherViewController = OtherViewController()
        
        // MARK: - Navigation
        let navSearchViewController = UINavigationController(rootViewController: searchViewController)
        let navFavouriteController = UINavigationController(rootViewController: favouriteViewController)
        let navAnnouncementViewController = UINavigationController(rootViewController: announcementViewController)
        let navDialogViewController = UINavigationController(rootViewController: dialogViewController)
        let navOtherViewController = UINavigationController(rootViewController: otherViewController)
        
        
        self.viewControllers = [
            navSearchViewController,
            navFavouriteController,
            navAnnouncementViewController,
            navDialogViewController,
            navOtherViewController
        ]
        
        
        // MARK: - Configure UI
        
        
        tabBar.items?[0].image = UIImage(systemName: Icons.magnifyingglass)
        tabBar.items?[0].title = "Поиск"
        
        tabBar.items?[1].image = UIImage(systemName: Icons.bookmarkFill)
        tabBar.items?[1].title = "Избранное"
        
        tabBar.items?[2].image = UIImage(systemName: Icons.rectangleFill)
        tabBar.items?[2].title = "Объявления"
        
        tabBar.items?[3].image = UIImage(systemName: Icons.ellipsisFill)
        tabBar.items?[3].title = "Диалоги"
        
        tabBar.items?[4].image = UIImage(systemName: Icons.lineHorizontal)
        tabBar.items?[4].title = "Прочее"
        
    }

}
