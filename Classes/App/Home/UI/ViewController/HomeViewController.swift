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

    @IBOutlet private weak var datePicker: UIDatePicker!
    @IBOutlet private weak var explanationLabel: UILabel!
    @IBOutlet private weak var validationButton: UIButton!
    
    private var birthdayDate: Date?
    private lazy var dateFormater: DateFormatter = self.createDateFormatter()
    
    var presenter: HomePresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        presenter?.start()
    }

    // MARK: - HomeViewContract
    
    func display(_ viewModel: HomeViewModel) {
        navigationItem.title = viewModel.title
    }
    
    // MARK: - Private
    
    private func setupViews() {
        datePicker.datePickerMode = .date
        explanationLabel.font = UIFont.systemFont(ofSize: 18)
        explanationLabel.textAlignment = .center
        explanationLabel.numberOfLines = 0
        explanationLabel.isHidden = true
        validationButton.setTitle("validation_button_title".localized(), for: .normal)
        validationButton.isHidden = true
    }
    
    private func createDateFormatter() -> DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        return formatter
    }

    @IBAction private func dealWithDatePickerValueChanged(_ sender: UIDatePicker) {
        birthdayDate = sender.date
        guard let birthdayDate = birthdayDate else { return }
        explanationLabel.text = String(
            format: "explanation_text_format".localized(),
            dateFormater.string(from: birthdayDate)
        )
        [explanationLabel, validationButton].forEach { $0?.isHidden = false }
    }
}
