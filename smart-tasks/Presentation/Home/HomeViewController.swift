//
//  HomeViewController.swift
//  smart-tasks
//
//  Created by Rashid Khan on 07/06/2024.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    private var tableViewData: [ReusableViewPresenterType] = []
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
    func setupViews() { 
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "TaskTableCell", bundle: .main), forCellReuseIdentifier: "TaskTableCell")
        tableView.register(UINib(nibName: "SpaceCell", bundle: .main), forCellReuseIdentifier: "SpaceCell")
    }
    
    func bindPresenterClosures() {
        title = presenter.outputs?.title
        
        presenter.outputs?.tasksCellPresenters = { [weak self] presenters in
            self?.tableViewData = presenters
            self?.tableView.reloadData()
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellPresenter = tableViewData[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellPresenter.reusableIdentifier, for: indexPath) as! TableViewCell
        cell.configure(presenter: cellPresenter)
        return cell
    }
}
