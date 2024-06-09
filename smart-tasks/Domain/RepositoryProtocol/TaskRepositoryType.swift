//
//  TaskRepositoryType.swift
//  smart-tasks
//
//  Created by Rashid Khan on 08/06/2024.
//

import Foundation

protocol TaskRepositoryType {
    func getAllTasks(completion: @escaping (Result<[TaskEntity], Error>)->Void)
}
