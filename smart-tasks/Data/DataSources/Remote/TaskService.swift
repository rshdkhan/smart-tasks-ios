//
//  TaskService.swift
//  smart-tasks
//
//  Created by Rashid Khan on 10/06/2024.
//

import Foundation

protocol TaskDataSourceType {
    func getAllTasks(completion: @escaping ((Result<[TaskModel], Error>) -> Void))
}

class RemoteTaskDataSource: TaskDataSourceType {
    var apiClient: APIClientType
    
    init(apiClient: APIClientType) {
        self.apiClient = apiClient
    }
    
    func getAllTasks(completion: @escaping ((Result<[TaskModel], Error>) -> Void)) {
        let models = [TaskModel(), TaskModel(), TaskModel(), TaskModel(), TaskModel(), TaskModel(), TaskModel(), TaskModel(), TaskModel(), TaskModel(), TaskModel(), TaskModel(), TaskModel()]
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            completion(.success(models))
        }
    }
}
