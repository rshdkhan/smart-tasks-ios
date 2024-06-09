//
//  TaskTableCell.swift
//  smart-tasks
//
//  Created by Rashid Khan on 08/06/2024.
//

import UIKit

class TaskTableCell: TableViewCell {
    @IBOutlet weak var containerView: UIView!
    
    private var presenter: TaskTableCellPresenterType!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = 5
        selectionStyle = .none
    }

    override func configure(presenter: ReusableViewPresenterType) {
        self.presenter = presenter as? TaskTableCellPresenterType
        
    }
}
