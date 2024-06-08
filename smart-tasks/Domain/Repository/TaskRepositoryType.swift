//
//  TaskRepositoryType.swift
//  smart-tasks
//
//  Created by Rashid Khan on 08/06/2024.
//

import Foundation
struct TaskModel: Decodable {
    let id: String
    let targetDate: Date
    let dueDate: Date
    let title: String
    let description: String
    let priority: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case targetDate = "TargetDate"
        case dueDate = "DueDate"
        case title = "Title"
        case description = "Description"
        case priority = "Priority"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try container.decode(String.self, forKey: .id)
        self.targetDate = try container.decode(Date.self, forKey: .targetDate)
        self.dueDate = try container.decode(Date.self, forKey: .dueDate)
        self.title = try container.decode(String.self, forKey: .title)
        self.description = try container.decode(String.self, forKey: .description)
        self.priority = try container.decode(Int.self, forKey: .priority)
    }
    
    func convertToTaskEntity() -> TaskEntity {
        return TaskEntity(id: self.id, 
                          targetDate: self.targetDate,
                          dueDate: self.dueDate,
                          title: self.title,
                          description: self.description,
                          priority: self.priority)
    }
}

protocol TaskRepositoryType {
    func getAllTasks(completion: @escaping (Result<[TaskEntity], Error>)->Void)
}

class TaskRepositoryMock: TaskRepositoryType {
    func getAllTasks(completion: @escaping (Result<[TaskEntity], Error>) -> Void) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let models = [TaskEntity(), TaskEntity(), TaskEntity(), TaskEntity(), TaskEntity(), TaskEntity(), TaskEntity(), TaskEntity(), TaskEntity(), TaskEntity(), TaskEntity(), TaskEntity(), TaskEntity(), TaskEntity(), TaskEntity()]
            completion(.success(models))
        }
    }
}
