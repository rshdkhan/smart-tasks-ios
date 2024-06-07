//
//  Coordinator.swift
//  smart-tasks
//
//  Created by Rashid Khan on 07/06/2024.
//

import Foundation

class Coordinator<T>: NSObject, CoordinatorType {
    typealias CoordinationResult = T

    /// Dictionary of the child coordinators. Every child coordinator should be added
    /// to that dictionary in order to keep it in memory.
    private var childCoordinators:[UUID: Any] = [:]
    
    private let identifier = UUID()
    
    public func coordinate<ResultType>(to coordinator: Coordinator<ResultType>, completion: @escaping (ResultType) -> Void) {
        store(coordinator: coordinator)
        
        coordinator.start { [weak self, weak coordinator] _ in
            if let coordinator = coordinator { self?.free(coordinator: coordinator)}
        }
    }
    
    public func start(completion: @escaping (T) -> Void) {
        fatalError("start method should be implemented.")
    }
}

//MARK: - Private Methods
fileprivate extension Coordinator {
    /// Stores coordinator to the `childCoordinators` dictionary.
    ///
    /// - Parameter coordinator: Child coordinator to store.
    func store<T>(coordinator: Coordinator<T>) {
        childCoordinators[coordinator.identifier] = coordinator
    }

    /// Release coordinator from the `childCoordinators` dictionary.
    ///
    /// - Parameter coordinator: Coordinator to release.
    func free<T>(coordinator: Coordinator<T>) {
        childCoordinators[coordinator.identifier] = nil
    }
}

