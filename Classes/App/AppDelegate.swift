//
//  AppDelegate.swift
//  10000days
//
//  Created by Loïc Saillant on 02/12/2021.
//

import UIKit
import ADUtils

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    lazy var controllers: [UINavigationController] = createControllers()

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        
        let viewController = TabBarViewController()
        viewController.setViewControllers(controllers, animated: false)

        window.rootViewController = viewController
        
        window.makeKeyAndVisible()
        
        return true
    }

    // MARK: - Private
    
    private func createControllers() -> [UINavigationController] {
        var controllers: [UINavigationController] = []
        
        // MARK: Home
        
        let homeNavigationController = createHomeNavigationController()
        homeNavigationController.tabBarItem = UITabBarItem(
            title: "tab_home_title".localized(),
            image: UIImage(systemName: "house.fill"),
            tag: 1
        )
        controllers.append(homeNavigationController)

        return controllers
    }
    
    private func createHomeNavigationController() -> UINavigationController {
        let navigationController = UINavigationController()
        let viewController = HomeViewController()
        let presenter = HomePresenterImplementation(viewContract: viewController)
        viewController.presenter = presenter
        navigationController.pushViewController(viewController, animated: false)
        return navigationController
    }
}
