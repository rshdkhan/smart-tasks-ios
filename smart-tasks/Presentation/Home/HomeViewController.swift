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

        setupViews()
        bindPresenterClosures()

        presenter.inputs?.viewLoaded()
    }
}

private extension HomeViewController {
    func setupViews() { }
    
    func bindPresenterClosures() {
        title = presenter.outputs?.title
    }
}
