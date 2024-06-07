//
//  StorePresenter.swift
//  smart-tasks
//
//  Created by Rashid Khan on 07/06/2024.
//

import Foundation

class HomePresenter: HomePresenterType, HomePresenterInput, HomePresenterOutput {
    weak var inputs: HomePresenterInput? { self }
    weak var outputs: HomePresenterOutput? { self }
    
    // MARK: Outputs
    var title: ((String) -> Void)?
    
    
    init() { }
    
    // MARK: Inputs
    func viewLoaded() {
        self.title?("Home")
    }
}
