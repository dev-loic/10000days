//
//  HomePresenterImplementation.swift
//  kdos
//
//  Created by loic.saillant on 20/10/2021.
//
//

import Foundation

class HomePresenterImplementation: HomePresenter {

    private weak var viewContract: HomeViewContract?
    private let mapper = HomeViewModelMapper()

    init(viewContract: HomeViewContract) {
        self.viewContract = viewContract
    }

    // MARK: - HomePresenter

    func start() {
        viewContract?.display(mapper.viewModel())
    }
}
