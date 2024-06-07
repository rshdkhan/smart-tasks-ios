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
            
            let (controller, _) = container.makeHomeViewController()
            let navigation = container.parent.makeNavigationController(rootViewController: controller)
            window.rootViewController = navigation
        }
        
        window.rootViewController = vc
        window.makeKeyAndVisible()
    }
}
