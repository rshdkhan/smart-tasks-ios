//
//  AppMainContainer.swift
//  smart-tasks
//
//  Created by Rashid Khan on 08/06/2024.
//

import UIKit

struct AppMainContainer {
    func makeNavigationController(rootViewController: UIViewController? = nil) -> NavigationController {
        let viewController = NavigationController(navigationBarClass: NavigationBar.self, toolbarClass: nil)
        if let rootViewController = rootViewController { viewController.viewControllers = [rootViewController] }
        viewController.modalPresentationStyle = .overFullScreen
        return viewController
    }
    
    func makeSplashViewController() -> (SplashViewController, SplashPresenter){
        let presenter = SplashPresenter()
        let controller = SplashViewController(presenter: presenter)
        return (controller, presenter)
    }
}
