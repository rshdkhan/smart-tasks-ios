//
//  SpaceCellPresenter.swift
//  smart-tasks
//
//  Created by Rashid Khan on 09/06/2024.
//

import Foundation

protocol SpaceCellPresenterInput: PresenterInputType { }

protocol SpaceCellPresenterOutput: AnyObject { 
    var height: ((CGFloat)->Void)? { get set }
}

protocol SpaceCellPresenterType {
    var inputs: SpaceCellPresenterInput? { get }
    var outputs: SpaceCellPresenterOutput? { get }
}

class SpaceCellPresenter: SpaceCellPresenterType, SpaceCellPresenterInput, SpaceCellPresenterOutput {
    weak var inputs: SpaceCellPresenterInput? { self }
    weak var outputs: SpaceCellPresenterOutput? { self }
    
    var height: ((CGFloat) -> Void)?
    
    private var heightValue: CGFloat
    init(height: CGFloat = 16) {
        heightValue = height
    }
    
    func viewLoaded() {
        height?(heightValue)
    }
}

extension SpaceCellPresenter: ReusableViewPresenterType {
    var reusableIdentifier: String { "SpaceCell" }
}
