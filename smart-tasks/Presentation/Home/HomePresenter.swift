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
    var title: String? = "Home"
    
    private var fetchAllTaskUseCase: FetchAllTasksUseCaseType
    
    init(fetchAllTaskUseCase: FetchAllTasksUseCaseType) {
        self.fetchAllTaskUseCase = fetchAllTaskUseCase
    }
    
    // MARK: Inputs
    func viewLoaded() {
        fetchAllTaskUseCase.execute { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let tasksArray):
                print("Tasks: >> \(tasksArray.count)")
                
            case .failure(let error):
                print("Error: >> \(error)")
            }
        }
    }
}
