//
//  HomePresenter.swift
//  kdos
//
//  Created by loic.saillant on 20/10/2021.
//
//

import Foundation

protocol HomePresenter {
    func start()
    func didSelectDate(_ date: Date)
    func didConfirmDate()
}
