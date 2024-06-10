//
//  TaskService.swift
//  smart-tasks
//
//  Created by Rashid Khan on 10/06/2024.
//

import Foundation

class RemoteTaskDataSource: TaskDataSource {
    var apiClient: APIClientType
    
    init(apiClient: APIClientType) {
        self.apiClient = apiClient
    }
    
    func getAllTasks(completion: @escaping ((Result<[TaskModel], NetworkErrors>) -> Void)) {
        // Normally we are setting url, http method, parameters, query, body
        // But for this specific example we don't need to setup as every thing match with the default values
        let route = SmartTasksAPIRoute.init()
        apiClient.request(route: route) { (result: Result<ResponseModel, NetworkErrors>) in
            switch result {
            case .success(let success): completion(.success(success.tasks ?? []))
            case .failure(let failure): completion(.failure(failure))
            }
        }
        
        struct ResponseModel: Decodable {
            let tasks: [TaskModel]?
        }
    }
}
