//
//  HomePresenterImplementation.swift
//  10000days
//
//  Created by loic.saillant on 20/10/2021.
//
//

import Foundation

class HomePresenterImplementation: HomePresenter {

    private weak var viewContract: HomeViewContract?
    private let mapper = HomeViewModelMapper()
    private var birthdayDate: Date?

    init(viewContract: HomeViewContract) {
        self.viewContract = viewContract
    }

    // MARK: - HomePresenter

    func start() {
        viewContract?.display(mapper.viewModel())
    }
    
    func didSelectDate(_ date: Date) {
        birthdayDate = date
        viewContract?.display(mapper.viewModel(birthdayDate: birthdayDate))
    }
    
    func didConfirmDate() {
        let calendar = Calendar.current
        guard
            let birthdayDate = birthdayDate,
            let celebrationDate = calendar.date(byAdding: .day, value: 10000, to: birthdayDate) else {
                return
        }
        viewContract?.displayResult(mapper.resultViewModel(date: celebrationDate))
    }
}
