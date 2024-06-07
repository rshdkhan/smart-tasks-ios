//
//  SplashPresenterType.swift
//  smart-tasks
//
//  Created by Rashid Khan on 08/06/2024.
//

import Foundation

protocol SplashPresenterInput: AnyObject, PresenterInputType { 
    func animationCompleted()
}

protocol SplashPresenterOutput: AnyObject {
    var playAnimations: (()->Void)? { get set }
    var result: ((ResultType<Void>) -> Void)? { get set }
}

protocol SplashPresenterType: AnyObject {
    var inputs: SplashPresenterInput? { get }
    var outputs: SplashPresenterOutput? { get }
}
