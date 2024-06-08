//
//  HomePresenterType.swift
//  smart-tasks
//
//  Created by Rashid Khan on 07/06/2024.
//

import Foundation

protocol PresenterInputType: AnyObject {
    func viewLoaded()
}

protocol HomePresenterInput: PresenterInputType { }

protocol HomePresenterOutput: AnyObject {
    var title: String? { get set }
    var tasksCellPresenters: (([ReusableViewPresenterType])->Void)? { get set }
    var error: ((String)->Void)? { get set }
}

protocol HomePresenterType {
    var inputs: HomePresenterInput? { get }
    var outputs: HomePresenterOutput? { get }
}

protocol ReusableViewPresenterType { }
