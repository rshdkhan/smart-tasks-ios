//
//  TaskTableCellPresenter.swift
//  smart-tasks
//
//  Created by Rashid Khan on 08/06/2024.
//

import Foundation

protocol TaskTableCellPresenterInput: PresenterInputType { }

protocol TaskTableCellPresenterOutput: AnyObject {
    var height: ((CGFloat)->Void)? { get set }
}

protocol TaskTableCellPresenterType {
    var inputs: TaskTableCellPresenterInput? { get }
    var outputs: TaskTableCellPresenterOutput? { get }
}

class TaskTableCellPresenter: TaskTableCellPresenterType, TaskTableCellPresenterInput, TaskTableCellPresenterOutput {
    weak var inputs: TaskTableCellPresenterInput? { self }
    weak var outputs: TaskTableCellPresenterOutput? { self }
    
    var height: ((CGFloat) -> Void)?
    
    init(task: TaskEntity) { }
    
    func viewLoaded() {
        
    }
    
}

extension TaskTableCellPresenter: ReusableViewPresenterType {
    var reusableIdentifier: String { "TaskTableCell" }
}
