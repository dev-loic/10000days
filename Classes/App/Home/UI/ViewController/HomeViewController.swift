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
    
    
    
    var presenter: HomePresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        presenter?.start()
    }

    // MARK: - HomeViewContract
    
    func display(_ viewModel: HomeViewModel) {
        navigationItem.title = viewModel.title
        explanationLabel.text = viewModel.explanation
        [explanationLabel, validationButton].forEach { $0?.isHidden = viewModel.explanation == nil }
    }
    
    // MARK: - Private
    
    @objc private func setupViews() {
        datePicker.datePickerMode = .date
        explanationLabel.font = UIFont.systemFont(ofSize: 18)
        explanationLabel.textAlignment = .center
        explanationLabel.numberOfLines = 0
        explanationLabel.isHidden = true
        validationButton.setTitle("validation_button_title".localized(), for: .normal)
        validationButton.isHidden = true
        validationButton.addTarget(self, action: #selector(didConfirmDate), for: .touchUpInside)
    }
    
    private func createDateFormatter() -> DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        return formatter
    }

    @IBAction private func dealWithDatePickerValueChanged(_ sender: UIDatePicker) {
        presenter?.didSelectDate(sender.date)
    }
    
    @objc private func didConfirmDate() {
        presenter?.didConfirmDate()
    }
}
