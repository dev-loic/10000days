//
//  HomeViewModelMapper.swift
//  kdos
//
//  Created by Loïc Saillant on 20/10/2021.
//

import Foundation

class HomeViewModelMapper {
    
    private lazy var dateFormater: DateFormatter = self.createDateFormatter()
    
    func viewModel(birthdayDate date: Date? = nil) -> HomeViewModel {
        return HomeViewModel(
            title: "home_title".localized(),
            explanation: mapExplanation(date)
        )
    }
    
    // MARK: - Private
    
    private func mapExplanation(_ date: Date?) -> String? {
        guard let date = date else { return nil }
        return String(
            format: "explanation_text_format".localized(),
            dateFormater.string(from: date)
        )
    }
    
    private func createDateFormatter() -> DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        return formatter
    }
}
