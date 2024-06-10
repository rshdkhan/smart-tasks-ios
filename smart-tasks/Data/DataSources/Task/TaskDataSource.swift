//
//  TaskDataSourceType.swift
//  smart-tasks
//
//  Created by Rashid Khan on 10/06/2024.
//

import Foundation

protocol TaskDataSource {
    func getAllTasks(completion: @escaping ((Result<[TaskModel], NetworkErrors>) -> Void))
}
