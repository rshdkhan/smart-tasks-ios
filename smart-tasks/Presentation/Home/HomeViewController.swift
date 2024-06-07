//
//  HomeViewController.swift
//  smart-tasks
//
//  Created by Rashid Khan on 07/06/2024.
//

import UIKit

class HomeViewController: UIViewController {
    private var presenter: HomePresenterType!
    
    convenience init(presenter: HomePresenterType) {
        self.init()
        self.presenter = presenter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set the title closure directly on the presenter instance
        presenter.outputs?.title = { [weak self] title in
            self?.title = title
        }

        presenter.inputs?.viewLoaded()
    }
}
