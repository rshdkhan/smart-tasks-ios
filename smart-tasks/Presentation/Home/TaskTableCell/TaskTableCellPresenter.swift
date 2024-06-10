//
//  TaskTableCellPresenter.swift
//  smart-tasks
//
//  Created by Rashid Khan on 08/06/2024.
//

import Foundation

protocol TaskTableCellPresenterInput: PresenterInputType { }

protocol TaskTableCellPresenterOutput: AnyObject {
    var title: ((String)->Void)? { get set }
    var dueDate: ((String)->Void)? { get set }
    var daysLeft: ((String)->Void)? { get set }
}

protocol TaskTableCellPresenterType {
    var inputs: TaskTableCellPresenterInput? { get }
    var outputs: TaskTableCellPresenterOutput? { get }
}

class TaskTableCellPresenter: TaskTableCellPresenterType, TaskTableCellPresenterInput, TaskTableCellPresenterOutput {
    weak var inputs: TaskTableCellPresenterInput? { self }
    weak var outputs: TaskTableCellPresenterOutput? { self }
    
    var title: ((String) -> Void)?
    var dueDate: ((String) -> Void)?
    var daysLeft: ((String) -> Void)?
    
    private var task: TaskEntity
    
    init(task: TaskEntity) {
        self.task = task
    }
    
    func viewLoaded() {
        self.title?(task.title)
        self.dueDate?("Parsed Due Date")
        self.dueDate?("Calaculated Days")
    }
    
}

extension TaskTableCellPresenter: ReusableViewPresenterType {
    var reusableIdentifier: String { "TaskTableCell" }
}
