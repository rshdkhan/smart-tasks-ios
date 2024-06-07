//
//  UserContainer.swift
//  smart-tasks
//
//  Created by Rashid Khan on 08/06/2024.
//

import Foundation

struct UserContainer {
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
