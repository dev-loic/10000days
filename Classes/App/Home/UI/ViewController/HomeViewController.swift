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
    }
    
    // MARK: - Private
    
    private func setupViews() {
        datePicker.datePickerMode = .date
        explanationLabel.font = UIFont.systemFont(ofSize: 24)
        explanationLabel.textAlignment = .center
        explanationLabel.isHidden = true
        validationButton.isHidden = true
    }
}
