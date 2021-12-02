//
//  TabBarPresenterImplementation.swift
//  kdos
//
//  Created by loic.saillant on 20/10/2021.
//
//

import Foundation

class TabBarPresenterImplementation: TabBarPresenter {

    private weak var viewContract: TabBarViewContract?

    // MARK: - Lifecycle

    init(viewContract: TabBarViewContract) {
        self.viewContract = viewContract
    }

    // MARK: - TabBarPresenter

    func start() {
        viewContract?.display()
    }
}
