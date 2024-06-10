//
//  TaskTableCell.swift
//  smart-tasks
//
//  Created by Rashid Khan on 08/06/2024.
//

import UIKit

class TaskTableCell: TableViewCell {
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDueDate: UILabel!
    @IBOutlet weak var lblDaysLeft: UILabel!
    
    private var presenter: TaskTableCellPresenterType!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = 5
        selectionStyle = .none
    }

    override func configure(presenter: ReusableViewPresenterType) {
        self.presenter = presenter as? TaskTableCellPresenterType
        
        setupBindings()
        self.presenter.inputs?.viewLoaded()
    }
    
    private func setupBindings() {
        presenter.outputs?.title = { [weak self] title in self?.lblTitle.text = title }
        presenter.outputs?.dueDate = { [weak self] title in self?.lblDueDate.text = title }
        presenter.outputs?.daysLeft = { [weak self] title in self?.lblDaysLeft.text = title }
    }
}
