//
//  AppCoordinator.swift
//  smart-tasks
//
//  Created by Rashid Khan on 07/06/2024.
//

import UIKit

class AppCoordinator: Coordinator<ResultType<Void>> {
    private var window: UIWindow
    private var container: UserContainer
    
    init(window: UIWindow, container: UserContainer) {
        self.window = window
        self.container = container
    }
    
    override func start(completion: @escaping (ResultType<Void>) -> Void) {
        let (vc, presenter) = container.parent.makeSplashViewController()
        
        presenter.outputs?.result = { [weak self] _ in
            guard let self = self else { return }
            
            // Splash controller finish their work, starting home coordinator for home flow
            self.startHome(completion: completion)
        }
        
        window.rootViewController = vc
        window.makeKeyAndVisible()
    }
}

private extension AppCoordinator {
    func startHome(completion: @escaping (ResultType<Void>) -> Void) {
        let coordinator = HomeCoordinator(window: self.window, container: self.container)
        self.coordinate(to: coordinator, completion: completion)
    }
}
