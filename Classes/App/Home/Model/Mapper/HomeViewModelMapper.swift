//
//  HomeViewModelMapper.swift
//  10000days
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
    
    func resultViewModel(date: Date) -> ResultViewModel {
        let currentDate = Date()
        let format = date < currentDate ? "past_result_text_format".localized() : "coming_result_text_format".localized()
        let numberOfDaysBetween = abs(Calendar.current.numberOfDaysBetween(date, and: currentDate))
        let text = String(
            format: format,
            dateFormater.string(from: date),
            "\(numberOfDaysBetween)"
        )
        return ResultViewModel(text: text)
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
        formatter.dateStyle = .short
        formatter.timeStyle = .none
        return formatter
    }
}
