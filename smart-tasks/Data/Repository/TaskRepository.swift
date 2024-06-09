//
//  TaskRepository.swift
//  smart-tasks
//
//  Created by Rashid Khan on 09/06/2024.
//

import Foundation

class TaskRepositoryMock: TaskRepositoryType {
    func getAllTasks(completion: @escaping (Result<[TaskEntity], Error>) -> Void) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let models = [TaskEntity(), TaskEntity(), TaskEntity(), TaskEntity(), TaskEntity(), TaskEntity(), TaskEntity(), TaskEntity(), TaskEntity(), TaskEntity(), TaskEntity(), TaskEntity(), TaskEntity(), TaskEntity(), TaskEntity()]
            completion(.success(models))
        }
    }
}
