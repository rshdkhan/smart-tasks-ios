//
//  HomeCoordinator.swift
//  smart-tasks
//
//  Created by Rashid Khan on 08/06/2024.
//

import UIKit

class HomeCoordinator: Coordinator<ResultType<Void>> {
    private var window: UIWindow
    private var container: UserContainer
    
    init(window: UIWindow, container: UserContainer) {
        self.window = window
        self.container = container
    }
    
    override func start(completion: @escaping (ResultType<Void>) -> Void) {
        let (vc, presenter) = container.makeHomeViewController()
        let navigation = container.parent.makeNavigationController(rootViewController: vc)
        window.rootViewController = navigation
    }
}
