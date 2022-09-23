//
//  MainTabBarController.swift
//  PodcastsApp
//
//  Created by Владислав Положай on 9/23/22.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewControllers()
        UINavigationBar.appearance().prefersLargeTitles = true
    }
}

extension MainTabBarController {
    //MARK: Setup Functions
    fileprivate func configureViewControllers() {
        viewControllers = [
            createNavigationController(with: ViewController(), title: "Favorites", tabBarImage: UIImage(systemName: "star.fill")!),
            createNavigationController(with: ViewController(), title: "Search", tabBarImage: UIImage(systemName: "magnifyingglass")!),
            createNavigationController(with: ViewController(), title: "Downloads", tabBarImage: UIImage(systemName: "arrow.down")!)
        ]
    }
    //MARK: Help Functions
    fileprivate func createNavigationController(with rootViewController: UIViewController, title: String, tabBarImage: UIImage) -> UINavigationController {
        
        let navigationController = UINavigationController(rootViewController: rootViewController)
        navigationController.tabBarItem.image = tabBarImage
        navigationController.tabBarItem.title = title
        
        return navigationController
    }

}
