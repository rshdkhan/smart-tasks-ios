//
//  FetchAllTasksUseCase.swift
//  smart-tasks
//
//  Created by Rashid Khan on 08/06/2024.
//

import Foundation

protocol FetchAllTasksUseCaseType {
    func execute(filterBy _date: Date?, completion: @escaping (Result<[TaskEntity], Error>)->Void)
}

class FetchAllTasksUseCase: FetchAllTasksUseCaseType {
    private var repository: TaskRepositoryType
    private var tasks: [TaskEntity] = []
    
    init(repository: TaskRepositoryType) {
        self.repository = repository
    }
    
    func execute(filterBy _date: Date?, completion: @escaping (Result<[TaskEntity], Error>) -> Void) {
        repository.getAllTasks { result in
            switch result {
                
            case .success(let allTasks):
                var result = allTasks
                
                // Filtering the tasks by date
                if let filterByDate = _date {
                    result = allTasks.filter { $0.dueDate.isSameDayIgnoringTimes(as: filterByDate) }
                }
                
                // Sorting of filtered data
                result = result.sorted(by: { $0.priority > $1.priority })
                
                completion(.success(result))
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

extension Date {
    func isSameDayIgnoringTimes(as otherDate: Date) -> Bool {
        let calendar = Calendar.current
        let selfComponents = calendar.dateComponents([.year, .month, .day], from: self)
        let otherComponents = calendar.dateComponents([.year, .month, .day], from: otherDate)
        
        return selfComponents.year == otherComponents.year &&
               selfComponents.month == otherComponents.month &&
               selfComponents.day == otherComponents.day
    }
}
