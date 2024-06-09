//
//  TableView.swift
//  smart-tasks
//
//  Created by Rashid Khan on 09/06/2024.
//

import UIKit

protocol ReusableViewPresenterType {
    var reusableIdentifier: String { get }
}

class TableViewCell: UITableViewCell, ConfigurableView, ReusableView {
    func configure(presenter: ReusableViewPresenterType) {
        fatalError("configure with presenter must be implemented.")
    }
}

protocol ConfigurableView {
    func configure(presenter: ReusableViewPresenterType)
}

protocol ReusableView: AnyObject {
    var defaultIdentifier: String { get }
}

extension ReusableView where Self: UIView {
    var defaultIdentifier: String { String(describing: Self.self) }
}
