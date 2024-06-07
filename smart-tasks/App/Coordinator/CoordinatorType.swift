//
//  CoordinatorType.swift
//  smart-tasks
//
//  Created by Rashid Khan on 07/06/2024.
//

import Foundation

protocol CoordinatorType {
    
    associatedtype TType
    
    /// Starts job of the coordinator.
    /// - Parameter option: Deep linking optios
    /// - Returns: Result of coordinator job.
    func start(completion: @escaping (TType)->Void)
    
    /// 1. Stores coordinator in a dictionary of child coordinators.
    /// 2. Calls method `start()` on that coordinator.
    /// 3. On the `onNext:` of returning observable of method `start()` removes coordinator from the dictionary.
    /// - Parameter coordinator: Coordinator to start.
    /// - Returns: Result of `start()` method.
    func coordinate(to coordinator: Coordinator<TType>, completion: @escaping (TType)->Void)
}
