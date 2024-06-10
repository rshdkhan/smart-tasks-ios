//
//  TaskModel.swift
//  smart-tasks
//
//  Created by Rashid Khan on 09/06/2024.
//

import Foundation

struct TaskModel: Decodable {
    let id: String
    let title: String?
    let description: String?
    let priority: Int?
    let targetDate: Date?
    let dueDate: Date?
    
    enum CodingKeys: String, CodingKey {
        case id
        case targetDate = "TargetDate"
        case dueDate = "DueDate"
        case title = "Title"
        case description = "Description"
        case priority = "Priority"
    }
    
    func toEntity() -> TaskEntity {
        return TaskEntity(id: self.id,
                          targetDate: self.targetDate ?? Date(),
                          dueDate: self.dueDate ?? Date(),
                          title: self.title ?? "",
                          description: self.description ?? "",
                          priority: self.priority ?? 0)
    }
    
    init() {
        self.id = "11011"
        self.targetDate = Date()
        self.dueDate = Date()
        self.title = "Test title"
        self.description = "Testing with mock implementations is good, this become more useful when you are writing test cases"
        self.priority = 1
    }
}
