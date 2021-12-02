//
//  HomeViewController.swift
//  kdos
//
//  Created by loic.saillant on 20/10/2021.
//
//

import Foundation
import UIKit

class HomeViewController: UIViewController, HomeViewContract {

    var presenter: HomePresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.start()
    }

    // MARK: - HomeViewContract
    
    func display(_ viewModel: HomeViewModel) {
        navigationItem.title = viewModel.title
    }
}
