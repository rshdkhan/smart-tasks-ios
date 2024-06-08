//
//  FetchAllTasksUseCase.swift
//  smart-tasks
//
//  Created by Rashid Khan on 08/06/2024.
//

import Foundation

protocol FetchAllTasksUseCaseType {
    func execute(completion: @escaping (Result<[TaskEntity], Error>)->Void)
}

class FetchAllTasksUseCase: FetchAllTasksUseCaseType {
    private var repository: TaskRepositoryType
    private var tasks: [TaskEntity] = []
    
    init(repository: TaskRepositoryType) {
        self.repository = repository
    }
    
    func execute(completion: @escaping (Result<[TaskEntity], Error>) -> Void) {
        repository.getAllTasks(completion: completion)
    }
}
