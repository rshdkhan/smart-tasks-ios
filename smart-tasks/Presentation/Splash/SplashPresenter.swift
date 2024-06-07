//
//  SplashViewController.swift
//  smart-tasks
//
//  Created by Rashid Khan on 07/06/2024.
//

import Foundation

struct Resouce { }

class SplashPresenter: SplashPresenterType, SplashPresenterOutput {
    weak var inputs: SplashPresenterInput? { self }
    weak var outputs: SplashPresenterOutput? { self }
    
    // MARK: Outputs
    var playAnimations: (() -> Void)?
    var result: ((ResultType<Void>) -> Void)?
    
    init() { }
    
    deinit{
        print("deinit >>> SplashPresenter")
    }
}

// MARK: Inputs
extension SplashPresenter: SplashPresenterInput {
    func viewLoaded() {
        playAnimations?()
    }
    
    func animationCompleted() {
        result?(.success(()))
    }
}
