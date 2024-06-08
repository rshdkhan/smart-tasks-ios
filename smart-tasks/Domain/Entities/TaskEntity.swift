//
//  Entity.swift
//  smart-tasks
//
//  Created by Rashid Khan on 08/06/2024.
//

import Foundation

class TaskEntity {
    var id: String
    var targetDate: Date
    var dueDate: Date
    var title: String
    var description: String
    var priority: Int
    
    init(id: String, targetDate: Date, dueDate: Date, title: String, description: String, priority: Int) {
        self.id = id
        self.targetDate = targetDate
        self.dueDate = dueDate
        self.title = title
        self.description = description
        self.priority = priority
    }
    
    init() {
        self.id = "11011"
        self.targetDate = Date()
        self.dueDate = Date()
        self.title = "Test title"
        self.description = "Testing with mock implementations is good but it only help if your code is compatible of it"
        self.priority = 1
    }
}
