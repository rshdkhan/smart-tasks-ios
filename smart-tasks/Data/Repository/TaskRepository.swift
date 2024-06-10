//
//  TaskRepository.swift
//  smart-tasks
//
//  Created by Rashid Khan on 09/06/2024.
//

import Foundation

class TaskRepositoryMock: TaskRepositoryType {
    private var remoteDataSource: TaskDataSourceType
    
    init(remoteDataSource: TaskDataSourceType) {
        self.remoteDataSource = remoteDataSource
    }
    
    func getAllTasks(completion: @escaping (Result<[TaskEntity], Error>) -> Void) {
        self.remoteDataSource.getAllTasks { result in
            switch result {
                case .success(let models): completion(.success(models.map { $0.toEntity() }))
                case .failure(let error): completion(.failure(error))
            }
        }
    }
}
