//
//  TabBarViewController.swift
//  10000days
//
//  Created by loic.saillant on 20/10/2021.
//
//

import Foundation
import UIKit

class TabBarViewController: UITabBarController {

    var presenter: TabBarPresenter?

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.tintColor = .black
        view.backgroundColor = .white
        presenter?.start()
    }
}

extension TabBarViewController: TabBarViewContract {

    // MARK: - TabBarViewContract

    func display() {
//        setViewControllers(controllers, animated: false)
    }
}
