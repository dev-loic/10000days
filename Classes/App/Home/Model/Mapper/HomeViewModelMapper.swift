//
//  HomeViewModelMapper.swift
//  kdos
//
//  Created by Loïc Saillant on 20/10/2021.
//

import Foundation

class HomeViewModelMapper {
    
    func viewModel() -> HomeViewModel {
        return HomeViewModel(title: "home_title".localized())
    }
}
