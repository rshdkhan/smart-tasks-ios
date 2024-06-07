//
//  AppCoordinator.swift
//  smart-tasks
//
//  Created by Rashid Khan on 07/06/2024.
//

import UIKit

struct AppMainContainer {
    func makeNavigationController(rootViewController: UIViewController? = nil) -> NavigationController {
        let viewController = NavigationController(navigationBarClass: NavigationBar.self, toolbarClass: nil)
        if let rootViewController = rootViewController { viewController.viewControllers = [rootViewController] }
        viewController.modalPresentationStyle = .overFullScreen
        return viewController
    }
}

struct AppSessionContainer {
    let parent: AppMainContainer
    
    init(parent: AppMainContainer) {
        self.parent = parent
    }
    
    func makeHomeViewController() -> (HomeViewController, HomePresenter) {
        let presenter = HomePresenter()
        let controller = HomeViewController(presenter: presenter)
        return (controller, presenter)
    }
}

class AppCoordinator: Coordinator<ResultType<Void>> {
    private var window: UIWindow
    private var container: AppSessionContainer
    
    init(window: UIWindow, container: AppSessionContainer) {
        self.window = window
        self.container = container
    }
    
    override func start(completion: @escaping (ResultType<Void>) -> Void) {
        let (controller, _) = container.makeHomeViewController()
        let navigationVC = container.parent.makeNavigationController(rootViewController: controller)
        window.rootViewController = navigationVC
        window.makeKeyAndVisible()
    }
}
