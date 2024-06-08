//
//  UserContainer.swift
//  smart-tasks
//
//  Created by Rashid Khan on 08/06/2024.
//

import Foundation

struct UserContainer {
    let parent: AppMainContainer
    
    init(parent: AppMainContainer) {
        self.parent = parent
    }
    
    // Controllers & Presenters
    func makeHomeViewController() -> (HomeViewController, HomePresenter) {
        let presenter = HomePresenter(fetchAllTaskUseCase: makeFetchAllTasksUseCase())
        let controller = HomeViewController(presenter: presenter)
        return (controller, presenter)
    }
    
    /// UseCases
    func makeFetchAllTasksUseCase() -> FetchAllTasksUseCase {
        return FetchAllTasksUseCase(repository: makeTaskMockRepository())
    }
    
    /// Repository
    func makeTaskMockRepository() -> TaskRepositoryMock {
        return TaskRepositoryMock()
    }
}
