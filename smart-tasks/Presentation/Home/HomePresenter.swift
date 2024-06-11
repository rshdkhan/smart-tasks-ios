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
    var title: String? = "Today"
    var tasksCellPresenters: (([ReusableViewPresenterType]) -> Void)?
    var error: ((String) -> Void)?
    
    private var fetchAllTaskUseCase: FetchAllTasksUseCaseType
    
    init(fetchAllTaskUseCase: FetchAllTasksUseCaseType) {
        self.fetchAllTaskUseCase = fetchAllTaskUseCase
    }
    
    // MARK: Inputs
    func viewLoaded() {
        fetchAllTaskUseCase.execute(filterBy: nil) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let tasks):
                var presenters: [ReusableViewPresenterType] = []
                
                for task in tasks {
                    presenters.append(TaskTableCellPresenter(task: task))
                    presenters.append(SpaceCellPresenter(height: 10))
                }
                
                self.tasksCellPresenters?(presenters)
                
            case .failure(let error):
                self.error?(error.localizedDescription)
            }
        }
    }
}
